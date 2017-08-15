

class CartHistory {
    boolean isFakeOrder
    String orderId
    Product product
    int quantity
    EndUserInformation endUserInformation
    ProductSize productSize
    Date date
    String deliveryAddress
    String mobileNumber
    boolean isDelivered
    DeliveryMethod deliveryMethod
    PaymentMethod paymentMethod
    static constraints = {
    }
}
