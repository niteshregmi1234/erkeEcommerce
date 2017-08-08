import grails.converters.JSON

class CartController {
static  allowedMethods = [checkAddToCart: 'POST', addToCart:'POST',updateBasket: 'POST',delete: 'POST',checkUser: 'POST']
    def checkAddToCart(){
        try{
      if(session.endUser){
          def id=params.id1 as long
          def productInstance=Product.get(id)
          def cartInstanceCheck=Cart.findByEndUserInformationAndProduct(session.endUser,productInstance)
          if(cartInstanceCheck){
              cartInstanceCheck.quantity=cartInstanceCheck.quantity+1
              cartInstanceCheck.save(flush: true)
          }
          else{
              def cartInstance=new Cart()
              cartInstance.product=productInstance
              cartInstance.quantity=1
              cartInstance.endUserInformation=session.endUser
              cartInstance.save(flush: true)
          }
          render "ok"
      }
        else{
          render "notOk"
      }}
        catch (Exception e){

        }
    }
    def updateBasket(){
        try{
        def totalPrice=0
        def obj= JSON.parse(params.array)
        for(int i=0;i<obj[0].size();i++){
            def id=obj[0][i] as long
            def sizeId=obj[2][i] as long
            def cartInstance=Cart.findByEndUserInformationAndProductAndProductSize(session.endUser,Product.get(id),ProductSize.get(sizeId))
    cartInstance.quantity=obj[1][i] as int
            cartInstance.save(flush: true)
            totalPrice=totalPrice+((cartInstance.product.productDetails.price*cartInstance.quantity)-(cartInstance.product.productDetails.discountPercentage*(cartInstance.product.productDetails.price*cartInstance.quantity)/100))
        }
        def shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
        def totalPrice1=totalPrice+shippingAndHandling
        def tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
        def totalPriceTotal=totalPrice1+tax
def totalUnits=[totalPrice,shippingAndHandling,tax,totalPriceTotal]
        render totalUnits as JSON}
        catch (Exception e){

        }

    }
    def checkUser(){
        try{
        if(session.endUser==null){
            render "notOk"
        }}
        catch (Exception e){

        }
    }
    def addToCart() {
        try{
        def productInstance=Product.get(params.id)
        if(productInstance){
        def cartInstanceCheck=Cart.findByEndUserInformationAndProductAndProductSize(session.endUser,productInstance,ProductSize.get(params.size))
        if(cartInstanceCheck){
         cartInstanceCheck.quantity=cartInstanceCheck.quantity+1
            cartInstanceCheck.save(flush: true)
        }
        else{
        def cartInstance=new Cart()
        cartInstance.product=productInstance
        cartInstance.quantity=1
            cartInstance.productSize=ProductSize.get(params.size)

            cartInstance.endUserInformation=session.endUser
        cartInstance.save(flush: true)}
        redirect(action: "cart")
        }}
        catch (Exception e){
     redirect(action: "notfound",controller: "errorPage")
        }
    }
    def cart()
    {
        try{
    def cartList=Cart.findAllByEndUserInformation(session.endUser)
        def totalPrice=0
        def shippingAndHandling=0
        def tax=0
        def totalPriceTotal=0
        List<Product> relatedProductList = new ArrayList<>()
        if(cartList.size()>0){
        for(Cart cart:cartList){
            totalPrice=totalPrice+((cart.product.productDetails.price*cart.quantity)-(cart.product.productDetails.discountPercentage*(cart.product.productDetails.price*cart.quantity)/100))
        }
shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
            def totalPrice1=totalPrice+shippingAndHandling
            tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
            totalPriceTotal=totalPrice1+tax
        def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategoryAndIdNotEqual(cartList[cartList.size()-1].product.productDetails.productSubCategory,cartList[cartList.size()-1].product.productDetails.productCategory,cartList[cartList.size()-1].product.productDetails.id)


        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findAllByProductDetailsAndSeasons(productDetails, SeasonManagement.list()[1].seasons)
            if (product) {
                relatedProductList.add(product[0])
            }
        }
        Collections.shuffle(relatedProductList)}

        render(view: "checkout", model:[totalPrice:totalPrice,relatedProductList:relatedProductList,shippingAndHandling:shippingAndHandling,tax:tax,totalPriceTotal:totalPriceTotal])}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }

}
    def delete(){
        try{
        def id=params.id as long
        def cartInstance=Cart.get(id)
        if(cartInstance){
            cartInstance.delete(flush: true)
        }
        def cartList=Cart.findAllByEndUserInformation(session.endUser)
        def totalPrice=0
        for(Cart cart:cartList){
            totalPrice=totalPrice+((cart.product.productDetails.price*cart.quantity)-(cart.product.productDetails.discountPercentage*(cart.product.productDetails.price*cart.quantity)/100))
        }
        def shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
        def totalPrice1=totalPrice+shippingAndHandling
        def tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
        def totalPriceTotal=totalPrice1+tax
        def totalUnits=[totalPrice,shippingAndHandling,tax,totalPriceTotal]
        render totalUnits as JSON

    }
        catch (Exception e){

        }
    }

}
