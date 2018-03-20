

class ProductBrand {
    String brandName
    String brandDescription
    boolean statusShow
    boolean isTop
    String logoName
String urlName
    static constraints = {
        isTop nullable: true
        logoName nullable: true
        urlName nullable: true
    }
    static mapping = {
        sort id: "desc"
    }

}
