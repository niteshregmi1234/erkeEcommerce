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
        if(session.endUser!=null){
            def cartList=endUserInformationService.cartList(session.endUser)
            if(cartList.size()==0){
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
            def cartList=endUserInformationService.cartList(session.endUser)
        def totalPrice=endUserInformationService.getTotalPriceOfCartList(cartList)
                sendMail {
                    to "${MailSetUp.list()[0].toEmail}"
                    subject "Shopping mail from customers"
                    html g.render(template:"/cart/mail",model: [totalPrice: totalPrice])

                }
           def orderId=endUserInformationService.getOrderId(cartList,session.endUser,params)
                    flash.message1="yarsaa/"+orderId
                    redirect(action: "cart",controller: "cart")
        }
    catch(Exception e){
        flash.message="your enquiry has been not been sent due to some problems.Please try again later"
        redirect(action: "cart",controller: "cart")
    }
    }
}
