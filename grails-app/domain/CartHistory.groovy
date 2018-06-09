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
    boolean successfulOrderDelFlag
    static constraints = {
        successfulOrderDelFlag nullable: true
    }
    static mapping = {
        sort id: "desc"
    }

}
