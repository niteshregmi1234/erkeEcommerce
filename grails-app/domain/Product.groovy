
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
    static constraints = {
        productId (generator:'assigned',unique:true)
    }

}
