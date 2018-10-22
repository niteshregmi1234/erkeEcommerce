class CartHistoryController extends BaseController{
    static allowedMethods = [deliveredToCustomer:'POST',addToPending: 'POST']
    def recentOrders(){
        try{
def undeliveredCartItems=CartHistoryWithoutEndUser.findAllByIsDeliveredAndIsFakeOrder(false,false)
            List<List<CartHistoryWithoutEndUser>> listListCartList=new ArrayList<>()

        def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.customerPersonalDetails},{undeliveredCartItem -> undeliveredCartItem.date})
        for(CartHistoryWithoutEndUser cartHistory:undeliveredCartItems) {
            def abc = cartItemsByEndUserAndDate[cartHistory.customerPersonalDetails]
            def cartList = abc[cartHistory.date] as List<CartHistoryWithoutEndUser>
            if(!listListCartList.contains(cartList)){
                listListCartList.add(cartList)


         }
        }
            render(view: "undeliveredCartItems",model:[listListCartList:listListCartList])
        }
        catch (Exception e){
        }

    }
    def addToPending(){
        try{
        def cartHistoryIdList=params.list("cartHistoryId")
        for(int i=0;i<cartHistoryIdList.size();i++){
            def cartHistoryId=cartHistoryIdList[i] as long
            def cartHistory=CartHistoryWithoutEndUser.findById(cartHistoryId)
            cartHistory.isDelivered=false
            cartHistory.isFakeOrder=true
            cartHistory.save(flush: true)
        }
        redirect(action: "recentOrders")
        }
        catch (Exception e){
        }
    }
    def deliveredToCustomer(){
        try{
            def cartHistoryIdList=params.list("cartHistoryId")
            for(int i=0;i<cartHistoryIdList.size();i++){
                def cartHistoryId=cartHistoryIdList[i] as long
                def cartHistory=CartHistoryWithoutEndUser.findById(cartHistoryId)
                cartHistory.isDelivered=true
                cartHistory.isFakeOrder=false
                cartHistory.save(flush: true)
                def productInstance=cartHistory.product
                productInstance.soldNumbers=cartHistory.product.soldNumbers+cartHistory.quantity
                productInstance.save(flush: true)
            }
            redirect(action: "recentOrders")
        }
        catch (Exception e){
        }
    }

    def successFullOrders(){
        try{
            def undeliveredCartItems=CartHistoryWithoutEndUser.findAllByIsDeliveredAndIsFakeOrderAndSuccessfulOrderDelFlag(true,false,false)
            List<List<CartHistoryWithoutEndUser>> listListCartList=new ArrayList<>()
             def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.customerPersonalDetails},{undeliveredCartItem -> undeliveredCartItem.date})
                for(CartHistoryWithoutEndUser cartHistory:undeliveredCartItems) {
                    def abc = cartItemsByEndUserAndDate[cartHistory.customerPersonalDetails]
                    def cartList = abc[cartHistory.date] as List<CartHistoryWithoutEndUser>
                    if(!listListCartList.contains(cartList)){
                        listListCartList.add(cartList)

                    }
                }
                render(view: "deliveredCartItems",model:[listListCartList:listListCartList])

        }
        catch (Exception e){
        }
    }
    def pendingOrdersMailNotSent(){
        try{
            def undeliveredCartItems=CartHistoryWithoutEndUser.findAllByIsDeliveredAndIsFakeOrderAndIsSentForPurchaseOrder(false,true,false)
            List<List<CartHistoryWithoutEndUser>> listListCartList=new ArrayList<>()

            def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.customerPersonalDetails},{undeliveredCartItem -> undeliveredCartItem.date})
            for(CartHistoryWithoutEndUser cartHistory:undeliveredCartItems) {
                def abc = cartItemsByEndUserAndDate[cartHistory.customerPersonalDetails]
                def cartList = abc[cartHistory.date] as List<CartHistoryWithoutEndUser>
                if(!listListCartList.contains(cartList)){
                    listListCartList.add(cartList)
                }
            }
            render(view: "mailNotSentPendingOrders",model:[listListCartList:listListCartList])
        }
        catch (Exception e){
        }
    }
    def pendingOrdersMailSent(){
        try{
            def undeliveredCartItems=CartHistoryWithoutEndUser.findAllByIsDeliveredAndIsFakeOrderAndIsSentForPurchaseOrder(false,true,true)
            List<List<CartHistoryWithoutEndUser>> listListCartList=new ArrayList<>()

            def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.customerPersonalDetails},{undeliveredCartItem -> undeliveredCartItem.date})
            for(CartHistoryWithoutEndUser cartHistory:undeliveredCartItems) {
                def abc = cartItemsByEndUserAndDate[cartHistory.customerPersonalDetails]
                def cartList = abc[cartHistory.date] as List<CartHistoryWithoutEndUser>
                if(!listListCartList.contains(cartList)){
                    listListCartList.add(cartList)
                }
            }
            render(view: "mailSentPendingOrders",model:[listListCartList:listListCartList])
        }
        catch (Exception e){
        }
    }
    def deleteSuccessfulOrders(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
                def cartHistoryIdList=params.list("cartHistoryId")
            for(int i=0;i<cartHistoryIdList.size();i++){
                def cartHistoryId=cartHistoryIdList[i] as long
                def cartHistory=CartHistoryWithoutEndUser.findById(cartHistoryId)
                cartHistory.successfulOrderDelFlag=true
                cartHistory.save(flush: true)
            }
            redirect(action: "successFullOrders")
        }
            else {
                redirect(action: "adminLoginForm",controller: "login")
            }
        }}
        catch (Exception e){
        }
    }
    def sendMailForOrders(){
        def undeliveredCartItems=CartHistoryWithoutEndUser.findAllByIsDeliveredAndIsFakeOrderAndIsSentForPurchaseOrder(false,true,false)
        if(undeliveredCartItems.size()>0) {
            def cartItemsForPurchaseBrandWise = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.productBrand })
            List<List<CartHistoryWithoutEndUser>> listListCartList=new ArrayList<>()
            for(CartHistoryWithoutEndUser cartHistory:undeliveredCartItems) {
                def cartList = cartItemsForPurchaseBrandWise[cartHistory.productBrand] as List<CartHistoryWithoutEndUser>
                if(!listListCartList.contains(cartList)){
                    listListCartList.add(cartList)
                }
            }
for(List<CartHistoryWithoutEndUser> listOfCartBrandWise:listListCartList){
    if (listOfCartBrandWise[0].productBrand) {
        if (listOfCartBrandWise[0].productBrand.email) {
            sendMail {
                to "${listOfCartBrandWise[0].productBrand.email}"
                subject "Order mail from customers of yarsaa.com"
                html g.render(template: "/cart/order", model: [cartWithoutEndUser: listOfCartBrandWise])

            }
        }
    }
    for (CartHistoryWithoutEndUser cartHistoryWithoutEndUser : undeliveredCartItems) {
        cartHistoryWithoutEndUser.isSentForPurchaseOrder = true
        cartHistoryWithoutEndUser.save(flush: true)
    }
}

            flash.message = "purchase order successfully sent"
        }
        else{
            flash.message = "unable to send purchase order. Pending order is empty"

        }

        redirect(action: "pendingOrdersMailNotSent")
    }

}
