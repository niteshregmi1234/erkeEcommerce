

class ProductDetails {
    String detailId = UUID.randomUUID().toString()
    String productSizes
    ProductCategory productCategory
    ProductSubCategory productSubCategory
    ProductBrand productBrand
    String productName
    boolean isSale
    float discountPercentage
        float price
    String briefDescription
    String detailDescription
String productNameWithBrand
    static constraints = {
        detailId (generator:'assigned',unique:true,nullable: true)
        productNameWithBrand(nullable: true)
        price scale: 2
    }
}
