import grails.converters.JSON

class EndUserController extends SessionCreateController{
    def productService
    static allowedMethods = [search: "POST",findView: 'POST']
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