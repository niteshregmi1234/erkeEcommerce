

class ProductBrand {
    String brandName
    String brandDescription
    boolean statusShow
    boolean isTop
    String logoName
    long priorityNumber
String urlName
    String email
    static constraints = {
        email nullable: true
        priorityNumber nullable:true
        isTop nullable: true
        logoName nullable: true
        urlName nullable: true
    }
    static mapping = {
        sort priorityNumber: "asc"
    }

}
