
class Product {
    ProductDetails productDetails
    ProductColor productColor
    boolean isLatest
    boolean isFeatured
    String productSpecificationName
    String specialImageName
    boolean delFlag
    int soldNumbers
    static constraints = {
        delFlag nullable: true
    }
    static mapping = {
        sort id: "desc"
    }

}
