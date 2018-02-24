class CartHistoryController extends BaseController{
    static allowedMethods = [deliveredToCustomer:'POST',addToPending: 'POST']
    def recentOrders(){
        try{
def undeliveredCartItems=CartHistory.findAllByIsDeliveredAndIsFakeOrder(false,false)
            List<List<CartHistory>> listListCartList=new ArrayList<>()

        def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.endUserInformation},{undeliveredCartItem -> undeliveredCartItem.date})
        for(CartHistory cartHistory:undeliveredCartItems) {
            def abc = cartItemsByEndUserAndDate[cartHistory.endUserInformation]
            def cartList = abc[cartHistory.date] as List<CartHistory>
            if(!listListCartList.contains(cartList)){
                listListCartList.add(cartList)


         }
        }
            render(view: "undeliveredCartItems",model:[listListCartList:listListCartList])

}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }

    }
    def addToPending(){
        try{
        def cartHistoryIdList=params.list("cartHistoryId")
        for(int i=0;i<cartHistoryIdList.size();i++){
            def cartHistoryId=cartHistoryIdList[i] as long
            def cartHistory=CartHistory.findById(cartHistoryId)
            cartHistory.isDelivered=false
            cartHistory.isFakeOrder=true
            cartHistory.save(flush: true)
        }
        redirect(action: "recentOrders")
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def deliveredToCustomer(){
        try{
            def cartHistoryIdList=params.list("cartHistoryId")
            for(int i=0;i<cartHistoryIdList.size();i++){
                def cartHistoryId=cartHistoryIdList[i] as long
                def cartHistory=CartHistory.findById(cartHistoryId)
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
            redirect(action: "notfound",controller: "errorPage")
        }
    }

    def successFullOrders(){
        try{
            def undeliveredCartItems=CartHistory.findAllByIsDeliveredAndIsFakeOrderAndSuccessfulOrderDelFlag(true,false,false)
            List<List<CartHistory>> listListCartList=new ArrayList<>()
             def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.endUserInformation},{undeliveredCartItem -> undeliveredCartItem.date})
                for(CartHistory cartHistory:undeliveredCartItems) {
                    def abc = cartItemsByEndUserAndDate[cartHistory.endUserInformation]
                    def cartList = abc[cartHistory.date] as List<CartHistory>
                    if(!listListCartList.contains(cartList)){
                        listListCartList.add(cartList)

                    }
                }
                render(view: "deliveredCartItems",model:[listListCartList:listListCartList])

        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def pendingOrders(){
        try{
            def undeliveredCartItems=CartHistory.findAllByIsDeliveredAndIsFakeOrder(false,true)
            List<List<CartHistory>> listListCartList=new ArrayList<>()

            def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.endUserInformation},{undeliveredCartItem -> undeliveredCartItem.date})
            for(CartHistory cartHistory:undeliveredCartItems) {
                def abc = cartItemsByEndUserAndDate[cartHistory.endUserInformation]
                def cartList = abc[cartHistory.date] as List<CartHistory>
                if(!listListCartList.contains(cartList)){
                    listListCartList.add(cartList)
                }
            }
            render(view: "fakeOrders",model:[listListCartList:listListCartList])
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def deleteSuccessfulOrders(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
                def cartHistoryIdList=params.list("cartHistoryId")
            for(int i=0;i<cartHistoryIdList.size();i++){
                def cartHistoryId=cartHistoryIdList[i] as long
                def cartHistory=CartHistory.findById(cartHistoryId)
                cartHistory.successfulOrderDelFlag=true
                cartHistory.save(flush: true)
            }
            redirect(action: "successFullOrders")
        }
            else {
                redirect(action: "adminLoginForm",controller: "login")
            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }

}
