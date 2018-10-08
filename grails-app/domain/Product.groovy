
class Product {
    ProductDetails productDetails
    ProductColor productColor
    boolean isLatest
    boolean isFeatured
    String productSpecificationName
    String specialImageName
    boolean delFlag
    int soldNumbers
    long priorityNumber
    static constraints = {
        delFlag nullable: true
        priorityNumber nullable:true
    }
    static mapping = {
        sort priorityNumber: "asc" // or "desc"
    }

}
