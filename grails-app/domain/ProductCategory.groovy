

class ProductCategory {
    String categoryId = UUID.randomUUID().toString()


    String categoryName
    String coverImageName
    String shoppingImageName
    boolean statusShow
    String menuImage1
    String menuImage2
    String menuImage3

    static constraints = {
        categoryId generator:'assigned'

    }
}
