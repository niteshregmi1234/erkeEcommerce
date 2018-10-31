

class CoverImage {
    String imageName
    boolean statusShow
    String slidePlace
    ProductBrand productBrand
    long priorityNumber
    static constraints = {
        priorityNumber nullable:true
        productBrand nullable: true
    }
    static mapping = {
        sort priorityNumber: "asc" // or "desc"
    }

}
