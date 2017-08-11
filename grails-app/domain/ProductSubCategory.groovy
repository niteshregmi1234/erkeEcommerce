

class ProductSubCategory {
    String subCategoryId = UUID.randomUUID().toString()


    String subCategoryName
    ProductSubCategorySpecify productSubCategorySpecify
    String coverImageName

    boolean statusShow
    static constraints = {
        subCategoryId generator:'assigned'

    }
}
