

class ProductSubCategory {
    String subCategoryId = UUID.randomUUID().toString()
    String subCategoryName
    ProductSubCategorySpecify productSubCategorySpecify
    String coverImageName
String subCategoryDescription
    boolean statusShow
    boolean isFooter
    boolean showInHomePage
    String urlName
    long priorityNumber

    static constraints = {
        priorityNumber nullable:true
        subCategoryId (generator:'assigned',unique:true)
        showInHomePage (nullable: true)
        urlName (nullable: true)

    }
    static mapping = {
        sort priorityNumber: "asc"
    }

}
