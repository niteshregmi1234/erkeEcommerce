

class ProductDetails {
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
        productNameWithBrand(nullable: true)
        price scale: 2
    }
    static mapping = {
        sort id: "desc"
    }

}
