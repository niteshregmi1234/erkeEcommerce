
class CartHistoryWithoutEndUser {
   CustomerPersonalDetails customerPersonalDetails
    Product product
    int quantity
    ProductSize productSize
    boolean isFakeOrder
    OrderId orderId
    Date date
 String orderNotes
    boolean isDelivered
    boolean successfulOrderDelFlag
 DeliveryMethod deliveryMethod
 PaymentMethod paymentMethod
 String customerType
    static constraints = {
orderNotes nullable: true
    }
    static mapping = {
        sort id: "desc"
    }
}
