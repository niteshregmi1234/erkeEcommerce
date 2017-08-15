class CartHistoryController extends BaseController{
    static allowedMethods = [deliveredToCustomer:'POST']
    def undeliveredCartItems(){
        try{
def undeliveredCartItems=CartHistory.findAllByIsDelivered(false)
            List<List<CartHistory>> listListCartList=new ArrayList<>()

        def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.endUserInformation},{undeliveredCartItem -> undeliveredCartItem.date})
        for(CartHistory cartHistory:undeliveredCartItems) {
            def abc = cartItemsByEndUserAndDate[cartHistory.endUserInformation]
            def cartList = abc[cartHistory.date] as List<CartHistory>
            if(!listListCartList.contains(cartList)){
                listListCartList.add(cartList)
                print cartList
            print cartList[0].endUserInformation
                print cartList[0].date

         }
        }
            render(view: "undeliveredCartItems",model:[listListCartList:listListCartList])

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
            cartHistory.save(flush: true)
        }
        redirect(action: "undeliveredCartItems")
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def deliveredCartItems(){
        try{
            def undeliveredCartItems=CartHistory.findAllByIsDelivered(true)
            List<List<CartHistory>> listListCartList=new ArrayList<>()

                def cartItemsByEndUserAndDate = undeliveredCartItems.groupBy({ undeliveredCartItem -> undeliveredCartItem.endUserInformation},{undeliveredCartItem -> undeliveredCartItem.date})
                for(CartHistory cartHistory:undeliveredCartItems) {
                    def abc = cartItemsByEndUserAndDate[cartHistory.endUserInformation]
                    def cartList = abc[cartHistory.date] as List<CartHistory>
                    if(!listListCartList.contains(cartList)){
                        listListCartList.add(cartList)
                        print cartList
                        print cartList[0].endUserInformation
                        print cartList[0].date

                    }
                }
                render(view: "deliveredCartItems",model:[listListCartList:listListCartList])

        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }

    }
}
