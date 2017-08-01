class CheckOutController {
    static allowedMethods = [placeOrder: 'POST',checkCart: 'POST']
    def checkCart(){
        try{
        if(session.endUser!=null){
        def cartList=Cart.findAllByEndUserInformation(session.endUser)
            if(cartList.size()==0){
                render "cartEmpty"
            }
        }
        else{
            render "sessionNull"
        }}
        catch (Exception e){

        }

    }
    def placeOrder(){


        try{
            def cartList=Cart.findAllByEndUserInformation(session.endUser)
        def totalPrice=0
        for(Cart cart:cartList){
            totalPrice=totalPrice+((cart.product.productDetails.price*cart.quantity)-(cart.product.productDetails.discountPercentage*(cart.product.productDetails.price*cart.quantity)/100))
        }
                sendMail {
                    to "rockingguyheman.hg@gmail.com"
                    subject "Shopping mail from customers"
                    html g.render(template:"/cart/mail",model: [totalPrice: totalPrice])

                }
                for(Cart cart:cartList){
                cart.delete(flush: true)}
            flash.message="your enquiry has been successfully sent.Please,visit again.Thank you!!"
            redirect(action: "cart",controller: "cart")
        }
    catch(Exception e){

        flash.message="your enquiry has been not been sent due to some problems.Please try again later"
        redirect(action: "cart",controller: "cart")

    }

}
}
