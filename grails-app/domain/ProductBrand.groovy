

class ProductBrand {
    String brandName
    String brandDescription
    boolean statusShow
    boolean isTop
    String logoName

    static constraints = {
        isTop nullable: true
        logoName nullable: true
    }
}
