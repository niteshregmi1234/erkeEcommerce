import grails.converters.JSON

class EndUserController extends SessionCreateController{
    def productService
    static allowedMethods = [search: "POST",findView: 'POST']
    def ad(){
        try{
        def productList=new ArrayList<>()
        def aidsInstance=Aids.findByAdDescribe(params.aidsDescribe)
        if(aidsInstance){
        if(aidsInstance.aidType=="customize"){
            def totalArray=[]
            if(aidsInstance.isDiscountForProduct=="noDiscount") {
                if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    String[] specificationIds = aidsInstance.specificationIds.split(",")
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
                    totalArray=productService.productIfAll(brandIds, categoryIds, specificationIds, subCategoryIds)

                }
                else if (aidsInstance.brandIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")
                    String[] specificationIds = aidsInstance.specificationIds.split(",")
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
                    totalArray= productService.productIfBrandAndSpecificationAndSubCategory(brandIds, specificationIds, subCategoryIds)
                }
                else if (aidsInstance.categoryIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    String[] specificationIds = aidsInstance.specificationIds.split(",")
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

                    totalArray=productService.productIfCategoryAndSpecificationAndSubCategory(specificationIds, categoryIds, subCategoryIds)
                }
                else if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.subCategoryIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

                    totalArray=productService.productIfBrandAndCategoryAndSubCategory(brandIds, categoryIds, subCategoryIds)
                }
                else if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.specificationIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    String[] specificationIds = aidsInstance.specificationIds.split(",")

                    totalArray=productService.productIfBrandAndSpecificationAndCategory(brandIds, categoryIds, specificationIds)
                }
                else if (aidsInstance.brandIds && aidsInstance.categoryIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    totalArray=productService.productIfBrandAndCategory(brandIds, categoryIds)
                }
                else if (aidsInstance.brandIds && aidsInstance.specificationIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")
                    String[] specificationIds = aidsInstance.specificationIds.split(",")

                    totalArray=productService.productIfBrandAndSpecification(brandIds, specificationIds)
                }
                else if (aidsInstance.brandIds && aidsInstance.subCategoryIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

                    totalArray=productService.productIfBrandAndSubCategory(brandIds, subCategoryIds)
                }
                else if (aidsInstance.categoryIds && aidsInstance.specificationIds) {
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    String[] specificationIds = aidsInstance.specificationIds.split(",")

                    totalArray=productService.productIfSpecificationAndCategory(categoryIds, specificationIds)
                }
                else if (aidsInstance.subCategoryIds && aidsInstance.specificationIds) {
                    String[] specificationIds = aidsInstance.specificationIds.split(",")
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

                    totalArray=productService.productIfSpecificationAndSubCategory(subCategoryIds, specificationIds)

                }
                else if (aidsInstance.subCategoryIds && aidsInstance.categoryIds) {
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

                    totalArray=productService.productIfCategoryAndSubCategory(subCategoryIds, categoryIds)
                }
                else if (aidsInstance.brandIds) {
                    String[] brandIds = aidsInstance.brandIds.split(",")

                    totalArray=productService.productIfBrand(brandIds)
                }
                else if (aidsInstance.categoryIds) {
                    String[] categoryIds = aidsInstance.categoryIds.split(",")
                    totalArray=productService.productIfCategory(categoryIds)
                }
                else if (aidsInstance.specificationIds) {
                    String[] specificationIds = aidsInstance.specificationIds.split(",")
                    totalArray=productService.productIfSpecification(specificationIds)
                }
                else if (aidsInstance.subCategoryIds) {
                    String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
                    totalArray=productService.productIfSubCategory(subCategoryIds)
                }
            }
            else if(aidsInstance.isDiscountForProduct=="discount"){
if (aidsInstance.discountType=="noRange"){
    if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray=productService.productIfAllDiscountWithNoRange(brandIds, categoryIds, specificationIds, subCategoryIds,aidsInstance.discount)

    }
    else if (aidsInstance.brandIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray= productService.productIfBrandAndSpecificationAndSubCategoryDiscountWithNoRange(brandIds, specificationIds, subCategoryIds,aidsInstance.discount)
    }
    else if (aidsInstance.categoryIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfCategoryAndSpecificationAndSubCategoryDiscountWithNoRange(specificationIds, categoryIds, subCategoryIds,aidsInstance.discount)
    }
    else if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfBrandAndCategoryAndSubCategoryDiscountWithNoRange(brandIds, categoryIds, subCategoryIds,aidsInstance.discount)
    }
    else if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.specificationIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")

        totalArray=productService.productIfBrandAndSpecificationAndCategoryDiscountWithNoRange(brandIds, categoryIds, specificationIds,aidsInstance.discount)
    }
    else if (aidsInstance.brandIds && aidsInstance.categoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        totalArray=productService.productIfBrandAndCategoryDiscountWithNoRange(brandIds, categoryIds,aidsInstance.discount)
    }
    else if (aidsInstance.brandIds && aidsInstance.specificationIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")

        totalArray=productService.productIfBrandAndSpecificationDiscountWithNoRange(brandIds, specificationIds,aidsInstance.discount)
    }
    else if (aidsInstance.brandIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfBrandAndSubCategoryDiscountWithNoRange(brandIds, subCategoryIds,aidsInstance.discount)
    }
    else if (aidsInstance.categoryIds && aidsInstance.specificationIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")

        totalArray=productService.productIfSpecificationAndCategoryDiscountWithNoRange(categoryIds, specificationIds,aidsInstance.discount)
    }
    else if (aidsInstance.subCategoryIds && aidsInstance.specificationIds) {
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfSpecificationAndSubCategoryDiscountWithNoRange(subCategoryIds, specificationIds,aidsInstance.discount)

    }
    else if (aidsInstance.subCategoryIds && aidsInstance.categoryIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfCategoryAndSubCategoryDiscountWithNoRange(subCategoryIds, categoryIds,aidsInstance.discount)
    }
    else if (aidsInstance.brandIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")

        totalArray=productService.productIfBrandDiscountWithNoRange(brandIds,aidsInstance.discount)
    }
    else if (aidsInstance.categoryIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        totalArray=productService.productIfCategoryDiscountWithNoRange(categoryIds,aidsInstance.discount)
    }
    else if (aidsInstance.specificationIds) {
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        totalArray=productService.productIfSpecificationDiscountWithNoRange(specificationIds,aidsInstance.discount)
    }
    else if (aidsInstance.subCategoryIds) {
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray=productService.productIfSubCategoryDiscountWithNoRange(subCategoryIds,aidsInstance.discount)
    }
}
                else if(aidsInstance.discountType=="range"){
    if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray=productService.productIfAllDiscountWithRange(brandIds, categoryIds, specificationIds, subCategoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)

    }
    else if (aidsInstance.brandIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray= productService.productIfBrandAndSpecificationAndSubCategoryDiscountWithRange(brandIds, specificationIds, subCategoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.categoryIds && aidsInstance.specificationIds && aidsInstance.subCategoryIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfCategoryAndSpecificationAndSubCategoryDiscountWithRange(specificationIds, categoryIds, subCategoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfBrandAndCategoryAndSubCategoryDiscountWithRange(brandIds, categoryIds, subCategoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.brandIds && aidsInstance.categoryIds && aidsInstance.specificationIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")

        totalArray=productService.productIfBrandAndSpecificationAndCategoryDiscountWithRange(brandIds, categoryIds, specificationIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.brandIds && aidsInstance.categoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        totalArray=productService.productIfBrandAndCategoryDiscountWithRange(brandIds, categoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.brandIds && aidsInstance.specificationIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")

        totalArray=productService.productIfBrandAndSpecificationDiscountWithRange(brandIds, specificationIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.brandIds && aidsInstance.subCategoryIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")

        totalArray=productService.productIfBrandAndSubCategoryDiscountWithRange(brandIds, subCategoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.categoryIds && aidsInstance.specificationIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        totalArray=productService.productIfSpecificationAndCategoryDiscountWithRange(categoryIds, specificationIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.subCategoryIds && aidsInstance.specificationIds) {
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray=productService.productIfSpecificationAndSubCategoryDiscountWithRange(subCategoryIds, specificationIds,aidsInstance.discountFrom,aidsInstance.discountTo)

    }
    else if (aidsInstance.subCategoryIds && aidsInstance.categoryIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray=productService.productIfCategoryAndSubCategoryDiscountWithRange(subCategoryIds, categoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.brandIds) {
        String[] brandIds = aidsInstance.brandIds.split(",")

        totalArray=productService.productIfBrandDiscountWithRange(brandIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.categoryIds) {
        String[] categoryIds = aidsInstance.categoryIds.split(",")
        totalArray=productService.productIfCategoryDiscountWithRange(categoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.specificationIds) {
        String[] specificationIds = aidsInstance.specificationIds.split(",")
        totalArray=productService.productIfSpecificationDiscountWithRange(specificationIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
    else if (aidsInstance.subCategoryIds) {
        String[] subCategoryIds = aidsInstance.subCategoryIds.split(",")
        totalArray=productService.productIfSubCategoryDiscountWithRange(subCategoryIds,aidsInstance.discountFrom,aidsInstance.discountTo)
    }
}
            }
            if (totalArray[0]) {
                render(view: "ad", model: [totalArray: totalArray])
            }
        }
        else if(aidsInstance.aidType=="product"){
if(aidsInstance.isDiscountForProduct=="noDiscount"){
    def productIds = aidsInstance.productIds
    String[] productIdsArray = productIds.split(",")
if(productIdsArray.size()>1){
    for(int i=0;i<productIdsArray.size();i++){
        def productInstance=Product.findByDelFlagAndId(false,productIdsArray[i] as long)
productList.add(productInstance)
    }
    def totalArray = productService.ad(productList)
    if (totalArray[0]) {

        render(view: "ad", model: [totalArray: totalArray])
    }
}
    else{
   def product= Product.findByDelFlagAndId(false,productIdsArray[0] as long)
    redirect(action: "singleProduct",params: [specificationName:product.productSpecificationName])
}
}
            else if(aidsInstance.isDiscountForProduct=="discount"){
if(aidsInstance.discountType=="noRange"){

    def productDetailsList=ProductDetails.findAllByDiscountPercentage(aidsInstance.discount)
    for(ProductDetails productDetails:productDetailsList){
        def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)
    if(product){
        productList.add(product[0])
    }
    }

}
    else if(aidsInstance.discountType=="range"){
    def productDetailsList=ProductDetails.findAllByDiscountPercentageBetween(aidsInstance.discountFrom,aidsInstance.discountTo)
    for(ProductDetails productDetails:productDetailsList){
        def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
        if(product){
            productList.add(product)
        }
    }

}
    def totalArray = productService.ad(productList)
    render(view: "ad", model: [totalArray: totalArray])
}
        }}
        else{
            redirect(action: "userHome",controller: "endUser")
        }}
        catch (Exception e){

        }
    }
    def findView(){
        def id=params.id as long
      def productInstance=Product.findByIdAndDelFlag(id,false)
        def productView=ProductView.findAllByDelFlagAndProduct(false,productInstance)
  render productView as JSON
    }
def test1(){

}
    def nepaliProducts() {
        try {
            def totalArray = productService.nepaliProducts()
            if (totalArray[0]) {
                render(view: "nepaliBrands", model: [totalArray: totalArray])
            }
        }
        catch (Exception e) {

        }
    }

    def subCategory() {
        try {
            if (params.subCategory) {
                def totalArray = productService.subCategory(params.subCategory)
                render(view: "specialSubCategory", model: [totalArray: totalArray])
            }
        }
        catch (Exception e) {

        }
    }

    def topSales() {
        try {
            def totalArray = productService.topSales()
            if (totalArray[0]) {
                render(view: "topSale", model: [totalArray: totalArray])
            }
        }
        catch (Exception e) {

        }
    }

    def brand() {
        def brandId = params.list("brand")
        print brandId
    }

    def search() {
        try {
            def search=params.search
                redirect(action: "result", params: [q:search])
            }
        catch (Exception e) {
        }

    }

    def result() {
        try {
         def totalArray=productService.searchProduct(params.q)
                render(view: "results", model: [totalArray: totalArray,params:params])

        }
        catch (Exception e) {
        }
    }

    def allProducts() {
        try {
            def totalArray = productService.allProducts()
            if (totalArray[0]) {
                render(view: "allProduct", model: [totalArray: totalArray])
            }
        }
        catch (Exception e) {

        }

    }

    def contact() {
        try {
            if (CompanyInformation.list()[0]) {
                render(view: "contactYarsaa", model: [companyInformation: CompanyInformation.list()[0]])
            }
        }
        catch (Exception e) {

        }
    }

    def singleProduct() {
        try {
            if (params.specificationName) {
                def totalArray = productService.singleProduct(params.specificationName)
                if (totalArray[0]) {
                    render(view: "detail", model: [totalArray: totalArray,productInstance:Product.findByProductSpecificationName(params.specificationName)])
                }
            }
        }
        catch (Exception e) {

        }
    }

    def latestProducts() {
        try {
            def totalArray = productService.latestProducts()
            if (totalArray[0]) {
                render(view: "latestProduct", model: [totalArray: totalArray])
            }
        }
        catch (Exception e) {

        }
    }

    def userHome() {
        try {
            def totalArray = productService.homeContent()
            if (CompanyInformation.list()[0]) {
                [totalArray: totalArray]
            }
        }
        catch (Exception e) {

        }
    }

    def subCategoryList() {
        try {


            def totalArray = productService.subCategoryList(params.subCategory, params.category)
            if (totalArray[0]) {
                render(view: "subCategoryProduct", model: [totalArray: totalArray])
            }
        }
        catch (Exception e) {

        }
    }

    def test() {
    }

    def allCategoryProducts() {
        try {
            if (params.category) {
                if (ProductCategory.findByUrlName(params.category)) {
                    def totalArray = productService.allCategoryProducts(params.category)
                    if (totalArray[0]) {
                        render(view: "categoryList", model: [totalArray: totalArray])
                    }
                }
            }
        }
        catch (Exception e) {

        }
    }

    def topBrand() {
        try {
            if (params.brandNames) {
                if (ProductBrand.findByUrlName(params.brandNames)) {

                    def totalArray = productService.topBrandProducts(params.brandNames)
                    if (totalArray[0]) {
                        render(view: "brandProducts", model: [totalArray: totalArray])
                    }
                }

            }
        }
        catch (Exception e) {

        }
    }

    def allBrands() {
        try {
            def brandsList = productService.getAllBrands()
            render(view: "allBrand", model: [brandsList: brandsList])
        }
        catch (Exception e) {

        }
    }

    def specifiedProducts() {
        try {
            def productList1 = productService.checkProduct(params.subCategorySpecify, params.category)
            if (productList1) {
                def totalArray = productService.specifiedProducts(params.subCategorySpecify, params.category)
                if (totalArray[0]) {
                    render(view: "specifiedProduct", model: [totalArray: totalArray])
                }
            }

        }
        catch (Exception e) {

        }
    }

    def about() {
        try {
            def aboutUsInstance = AboutUs.list()[0]
            if (aboutUsInstance) {
                render(view: "aboutYarsaa", model: [aboutUsInstance: aboutUsInstance])
            }

        }
        catch (Exception e) {

        }
    }
}