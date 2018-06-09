import grails.converters.JSON
class CartController extends SessionCreateController{
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
            session.cart=productService.checkAddToCart(params,session.cart)
        }
        catch (Exception e){

        }
    }
    def updateBasket(){
        try {
            if(session.cart.size()>0){
            def totalArray = productService.updateBasket(params, session.cart)
            session.cart=totalArray[4]
            render totalArray as JSON
            }
            else{
                render "cartEmpty"
            }
        }
        catch(Exception e){

        }
    }
    def addToCart() {

        session.cart=productService.addToCart(params,session.cart)
    }
    def checkout(){
        try{
            if(session.cart.size()==0){
redirect(action: "cart",params: [cartEmptyMessage:"cannot proceed while cart is empty"])
            }
            else{

            def totalArray=productService.cart(session.cart)
            if(session.endUser){
                def endUserInformation=EndUserInformation.findById(session.endUser.id)
                render(view: "checkout", model:[totalArray:totalArray,endUserInformation:endUserInformation])}
            else{
                render(view: "checkout", model:[totalArray:totalArray])}

            }
        }



        catch (Exception e){

        }
    }

    def cart()
    {
        try{
            def totalArray=productService.cart(session.cart)
            if(!params.cartEmptyMessage){
            render(view: "cart", model:[totalArray:totalArray])
        }
            else{
             render(view: "cart",model: [totalArray:totalArray,cartEmptyMessage:params.cartEmptyMessage])
            }
        }





        catch (Exception e){

        }

}
    def delete(){
        try{
            if(session.cart.size()>0){
       def totalArray=productService.deleteCart(params,session.cart)
            session.cart=totalArray[4]
        render totalArray as JSON}
            else{
                render "cartEmpty"
            }
    }
        catch (Exception e){

        }
    }

}
