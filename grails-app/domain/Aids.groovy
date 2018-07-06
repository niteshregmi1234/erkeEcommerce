class Aids {
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
