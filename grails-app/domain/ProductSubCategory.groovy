

class ProductSubCategory {
    String subCategoryId = UUID.randomUUID().toString()
    String subCategoryName
    ProductSubCategorySpecify productSubCategorySpecify
    String coverImageName
String subCategoryDescription
    boolean statusShow
    static constraints = {
        subCategoryId generator:'assigned'

    }
}
