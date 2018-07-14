class Aids {
    String adDescribeRaw
    String adDescribe
    String isDiscountForProduct
    String discountType
    String divPosition
    String aidType
    float discount
    float discountFrom
    float discountTo
    String categoryIds
    String subCategoryIds
    String brandIds
    String specificationIds
    String productIds
    String imageName
    static constraints = {
        discountType nullable: true
        discountFrom nullable:true
        discountTo nullable:true
        discount nullable:true
        imageName nullable: true
        categoryIds nullable: true
        subCategoryIds nullable: true
        brandIds nullable: true
        specificationIds nullable: true
        productIds nullable: true
    }
}
