import grails.converters.JSON
class CartController {
static  allowedMethods = [checkSession: 'POST', checkAddToCart: 'POST', addToCart:'POST',updateBasket: 'POST',delete: 'POST']
    def productService
    def checkSession(){
        try{
        if(session.endUser){
            render "ok"
        }
        else{
            render "notOk"
        }}
        catch (Exception e){

        }
    }
    def checkAddToCart(){
        try{
      def text=productService.checkAddToCart(params,session.endUser)
        render text
        }
        catch (Exception e){

        }
    }
    def updateBasket(){
        try {
            def totalArray = productService.updateBasket(params, session.endUser)
            render totalArray as JSON
        }
        catch(Exception e){

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
        }

        }
        catch (Exception e){
        }
    }
    def cart()
    {
        try{
      def totalArray=productService.cart(session.endUser)
        render(view: "checkout", model:[totalArray:totalArray])}
        catch (Exception e){

        }
}
    def delete(){
        try{
       def totalArray=productService.deleteCart(params,session.endUser)
        render totalArray as JSON
    }
        catch (Exception e){

        }
    }

}
