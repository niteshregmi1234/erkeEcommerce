
class CartHistoryWithoutEndUser {
   CustomerPersonalDetails customerPersonalDetails
    Product product
    int quantity
    ProductSize productSize
    boolean isFakeOrder
    OrderId orderId
    Date date
    boolean isDelivered
    boolean successfulOrderDelFlag
    static constraints = {

    }
    static mapping = {
        sort id: "desc"
    }
}
