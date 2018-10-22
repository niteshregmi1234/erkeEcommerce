
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
    boolean isSentForPurchaseOrder

    boolean successfulOrderDelFlag
 DeliveryMethod deliveryMethod
 PaymentMethod paymentMethod
 String customerType
    ProductBrand productBrand
    static constraints = {
        productBrand nullable: true
orderNotes nullable: true
        isSentForPurchaseOrder nullable:true
    }
    static mapping = {
        sort id: "desc"
    }
}
