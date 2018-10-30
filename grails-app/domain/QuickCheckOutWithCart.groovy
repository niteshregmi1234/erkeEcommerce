

class QuickCheckOutWithCart {
    long mobileNumber
    Product product
    int quantity
    ProductSize productSize
    boolean isFakeOrder
    OrderId orderId
    Date date
    boolean isDelivered
    boolean isSentForPurchaseOrder
    boolean successfulOrderDelFlag
    ProductBrand productBrand
    static constraints = {

    }
    static mapping={
        sort id: "desc"

    }
}
