class CheckOutController {
    static allowedMethods = [placeOrder: 'POST',checkCart: 'POST',sendFeedBackMessage: 'POST']
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
        def cartList=Cart.findAllByEndUserInformation(session.endUser)
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
            def cartList=Cart.findAllByEndUserInformation(session.endUser)
        def totalPrice=0
        for(Cart cart:cartList){
            totalPrice=totalPrice+((cart.product.productDetails.price*cart.quantity)-(cart.product.productDetails.discountPercentage*(cart.product.productDetails.price*cart.quantity)/100))
        }
                sendMail {
                    to "${MailSetUp.list()[0].toEmail}"
                    subject "Shopping mail from customers"
                    html g.render(template:"/cart/mail",model: [totalPrice: totalPrice])

                }
            def date=new Date()
            def orderIdInstance=new OrderId()
            orderIdInstance.endUserInformation=session.endUser
            orderIdInstance.save(flush: true)
            def orderId="yarsaa-"+orderIdInstance.id
                for(Cart cart:cartList){
                    def cartHistoryInstance=new CartHistory()
                    cartHistoryInstance.productSize=cart.productSize
                    cartHistoryInstance.quantity=cart.quantity
                    cartHistoryInstance.endUserInformation=cart.endUserInformation
                    cartHistoryInstance.product=cart.product
                    cartHistoryInstance.isDelivered=false
                    cartHistoryInstance.date=date
                    cartHistoryInstance.deliveryAddress=params.address
                    cartHistoryInstance.mobileNumber=params.phone
                    cartHistoryInstance.deliveryMethod=DeliveryMethod.get(params.delivery)
                    cartHistoryInstance.paymentMethod=PaymentMethod.get(params.payment)
                    cartHistoryInstance.orderId=orderId
                    cartHistoryInstance.isFakeOrder=false
                    cartHistoryInstance.save(flush: true)
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
