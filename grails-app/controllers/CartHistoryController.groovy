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
    def pendingOrders(){
        try{
            def undeliveredCartItems=CartHistoryWithoutEndUser.findAllByIsDeliveredAndIsFakeOrder(false,true)
            List<List<CartHistoryWithoutEndUser>> listListCartList=new ArrayList<>()

            def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.customerPersonalDetails},{undeliveredCartItem -> undeliveredCartItem.date})
            for(CartHistoryWithoutEndUser cartHistory:undeliveredCartItems) {
                def abc = cartItemsByEndUserAndDate[cartHistory.customerPersonalDetails]
                def cartList = abc[cartHistory.date] as List<CartHistoryWithoutEndUser>
                if(!listListCartList.contains(cartList)){
                    listListCartList.add(cartList)
                }
            }
            render(view: "fakeOrders",model:[listListCartList:listListCartList])
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

}
