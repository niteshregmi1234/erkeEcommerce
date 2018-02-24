

class CoverImage {
    String imageName
    boolean statusShow
    String slidePlace
    ProductBrand productBrand
    static constraints = {
        productBrand nullable: true
    }
    static mapping = {
        sort id: "desc"
    }

}
