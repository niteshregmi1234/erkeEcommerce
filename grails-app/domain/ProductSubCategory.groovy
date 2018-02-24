

class ProductSubCategory {
    String subCategoryId = UUID.randomUUID().toString()
    String subCategoryName
    ProductSubCategorySpecify productSubCategorySpecify
    String coverImageName
String subCategoryDescription
    boolean statusShow
    boolean isFooter
    static constraints = {
        subCategoryId (generator:'assigned',unique:true)
    }
    static mapping = {
        sort id: "desc"
    }

}
