class ProductCategory {
    String categoryId = UUID.randomUUID().toString()
    String categoryDescription
    String categoryName
    String coverImageName
    boolean statusShow
    String menuImage1
    String menuImage2
    static constraints = {
        categoryId (generator:'assigned',unique:true)
    }
}
