class CheckOutController {
    static allowedMethods = [placeOrder: 'POST',checkCart: 'POST',sendFeedBackMessage: 'POST']
    def endUserInformationService
    def sendFeedBackMessage(){
        try{
        sendMail {
            to "${MailSetUp.list()[0].toEmail}"
            subject "Feedback Message from Customer"
            html g.render(template:"/cart/feedback")

        }
            flash.message="your enquiry has been successfully sent. We will contact you as soon as possible."

            redirect(action: "contact",controller: "endUser")

        }
        catch (Exception e){
            flash.message="your enquiry has been not been sent due to some problems.Please try again later."

            redirect(action: "contact",controller: "endUser")

        }
    }
    def checkCart(){
        try{
        if(session.cart){
            if(session.cart.size()==0){
                render "cartEmpty"
            }
            else{
                render "ok"
            }
        }
        else{
            render "sessionNull"
        }
        }
        catch (Exception e){

        }

    }
    def placeOrder(){
        try{
            def cartList=session.cart
        def totalPrice=endUserInformationService.getTotalPriceOfCartList(cartList)
        def orderId=endUserInformationService.getOrderId(cartList,params)
        sendMail {
                    to "${MailSetUp.list()[0].toEmail}"
                    subject "Shopping mail from customers"
                    html g.render(template:"/cart/mail",model: [totalPrice: totalPrice])

                }
                    flash.message1=orderId
            session.cart.clear()
                    redirect(action: "cart",controller: "cart")
        }
    catch(Exception e){
        flash.message="your enquiry has been not been sent due to some problems.Please try again later"
        redirect(action: "cart",controller: "cart")
    }
    }
}
