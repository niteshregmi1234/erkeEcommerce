

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

    static constraints = {
        price scale: 2
    }
}
