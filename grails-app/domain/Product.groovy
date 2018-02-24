
class Product {
    String productId = UUID.randomUUID().toString()
    ProductDetails productDetails
    ProductColor productColor
    String frontImageName
    String sideImageName
    String backImageName
    Seasons seasons
    boolean isLatest
    boolean isFeatured
    String productSpecificationName
    String specialImageName
    boolean delFlag
    int soldNumbers
    static constraints = {
        delFlag nullable: true
        productId (generator:'assigned',unique:true)
    }
    static mapping = {
        sort id: "desc"
    }

}
