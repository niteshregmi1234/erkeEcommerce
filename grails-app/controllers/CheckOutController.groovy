import grails.converters.JSON

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
        def text
        try{
            def cartList=session.cart
        def billingInfo=JSON.parse(params.billingInfo);
        if(params.isCreateAccount){
                def endUserInformation=EndUserInformation.findByEmail(billingInfo[5])
                if(!endUserInformation){
                def orderId=endUserInformationService.getOrderId(cartList,params,session.endUser)
                def totalPrice=endUserInformationService.getTotalPriceOfCartList(cartList)
                    if(params.isShipping){
                        def shippingInfo= JSON.parse(params.isShipping)

                        sendMail {
                    to "${MailSetUp.list()[0].toEmail}"
                    subject "Shopping mail from customers"
                    html g.render(template:"/cart/mail",model: [totalPrice: totalPrice,billingInfo:billingInfo,shippingInfo:shippingInfo])

                }}
                        else{
                            sendMail {
                                to "${MailSetUp.list()[0].toEmail}"
                                subject "Shopping mail from customers"
                                html g.render(template:"/cart/mail",model: [totalPrice: totalPrice,billingInfo:billingInfo])

                            }

                        }

                    session.cart.clear()
                    text=[]
                    text=[orderId,billingInfo[5],params.isCreateAccount] as JSON
                    print text
                    render text

            }
                else{
                    text="email is already taken"
                    render text
                }
            }
            else{
            def orderId=endUserInformationService.getOrderId(cartList,params,session.endUser)
            def totalPrice=endUserInformationService.getTotalPriceOfCartList(cartList)
            if(params.isShipping){
                def shippingInfo= JSON.parse(params.isShipping)


                sendMail {
                    to "${MailSetUp.list()[0].toEmail}"
                    subject "Shopping mail from customers"
                    html g.render(template: "/cart/mail", model: [totalPrice: totalPrice, billingInfo: billingInfo,shippingInfo:shippingInfo])

                }                }
            else{
                sendMail {
                    to "${MailSetUp.list()[0].toEmail}"
                    subject "Shopping mail from customers"
                    html g.render(template: "/cart/mail", model: [totalPrice: totalPrice, billingInfo: billingInfo])

                }
            }
                session.cart.clear()
            text=orderId
                render text
            }
        }
        catch(Exception e){
            text="enquiry not sent"
render text
    }
    }
}
