import grails.converters.JSON
class EndUserController {
    def a(){
def productDetails=Product.list()
        [productDetails:productDetails]
    }
    def allProducts={
        try{
        def productDetailsList=ProductDetails.list();
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetails(productDetails)
            if (product) {
                productList.add(product)
            }
        }
        Collections.shuffle(productList)
        render(view: "allProducts", model: [productList: productList,productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])

    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
def contact(){
    try {

[companyInformation:CompanyInformation.list()[0]]    }
catch (Exception e){
    redirect(action: "notfound",controller: "errorPage")

}
}
    def singleProduct(Long id) {
        try{
        if (id != null) {
            def productInstance1 = Product.get(id)
            if (productInstance1) {
                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategoryAndIdNotEqual(productInstance1.productDetails.productSubCategory,productInstance1.productDetails.productCategory,productInstance1.productDetails.id)
                def moreColorsList=Product.findAllByProductDetailsAndIdNotEqual(productInstance1.productDetails,productInstance1.id)
                List<Product> relatedProductList = new ArrayList<>()

                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findAllByProductDetails(productDetails)
                    if (product) {
                        relatedProductList.add(product[0])
                    }
                }
                Collections.shuffle(relatedProductList)

                render(view: "detail", model :[moreColorsList:moreColorsList,relatedProductList:relatedProductList,productInstance: productInstance1,productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])
            }
            else{
                redirect(action: "notfound",controller: "errorPage")
            }
        } else {
            redirect(action: "notfound",controller: "errorPage")

        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def userHome() {
        try{
        def upCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "UP")
        def downCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "DOWN")
        def latestProductList = Product.findAllByIsLatest(true)
        def specialBrandInstance = SpecialBrand.list()[0]
        def productList = Product.findAllByIsFeatured(true)
        def seasonManagementInstance = SeasonManagement.list()[0]
        [upCoverImageList: upCoverImageList, downCoverImageList: downCoverImageList, latestProductList: latestProductList, specialBrandInstance: specialBrandInstance, seasonManagementInstance: seasonManagementInstance,featuredProductList:productList]
    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def fetchAboutUrl() {
        try{
        if(params.urlBackground=="urlBackground"){
        def aboutUsInstance = AboutUs.list()[0]
        def url4 = "../images/otherStuffs/" + aboutUsInstance.backgroundImage;

        render url4}
        else {
            redirect(action: "notfound",controller: "errorPage")
        }}
        catch (Exception e){

        }

    }

    def fetchUrl() {
        try{
        if(params.urlBackground=="urlBackground"){
        def seasonManagementInstance = SeasonManagement.list()[0].seasons.imageName
        def backgroundImage1 = BackgroundImage.list()[0].imageName
        def backgroundImage2 = BackgroundImage.list()[1].imageName
        def imageUrl1 = "../images/seasonsImage/" + seasonManagementInstance;
        def imageUrl2 = "images/seasonsImage/" + seasonManagementInstance;
        def imageUrl3 = "../images/otherStuffs/" + backgroundImage1;
        def imageUrl4 = "images/otherStuffs/" + backgroundImage1;
        def imageUrl5 = "../images/otherStuffs/" + backgroundImage2;
        def imageUrl6 = "images/otherStuffs/" + backgroundImage2;

        def totalImageUrl = [imageUrl1, imageUrl2, imageUrl3, imageUrl4, imageUrl5, imageUrl6]
        render totalImageUrl as JSON
    }
        else {
            redirect(action: "notfound",controller: "errorPage")
        }}
        catch (Exception e){

        }
    }

    def subCategoryList() {
        try{
            if(ProductCategory.get(params.id1) && ProductSubCategory.get(params.id2)){
        def productDetailsList = ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.get(params.id1), ProductSubCategory.get(params.id2))
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetails(productDetails)
            if (product) {
                productList.add(product)
            }
        }
        Collections.shuffle(productList)
        render(view: "subCategoryList", model: [productList: productList, productSubCategory: ProductSubCategory.get(params.id2),productCategory: ProductCategory.get(params.id1),productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])
            }
        else{
            redirect(action: "notfound",controller: "errorPage")
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def allCategoryProducts(Long id) {
        try{
        if (id != null) {
            if(ProductCategory.get(id)){
                def productDetailsList = ProductDetails.findAllByProductCategory(ProductCategory.get(id))
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetails(productDetails)
                if (product) {
                    productList.add(product[0])
                }
            }
            Collections.shuffle(productList)
            render(view: "categoryList", model: [productList: productList, productCategory: ProductCategory.get(params.id)])

        }
            else{
                redirect(action: "notfound",controller: "errorPage")

            }
        } else {
            redirect(action: "notfound",controller: "errorPage")

        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def specialBrandProducts(Long id) {
        if (id != null) {
            def productDetailsList = ProductDetails.findAllByProductBrand(SpecialBrand.get(id).productBrand)
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findByProductDetails(productDetails)
                if (product) {
                    productList.add(product)
                }
            }
            Collections.shuffle(productList)
            render(view: "specialBrandProducts", model: [productList: productList, specialBrandInstance: SpecialBrand.get(id)])

        } else {
            render "error"
        }
    }

    def upcomingSeasonProducts() {
        try{
            def productList = Product.findAllBySeasons(SeasonManagement.list()[0].seasons)
            render(view: "upComingSeasonProducts", model: [productList: productList, seasonInstance: SeasonManagement.list()[0].seasons])
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }



def about(){
    try{
    def aboutUsInstance = AboutUs.list()[0]
    [aboutUsInstance: aboutUsInstance]}
    catch (Exception e){
        redirect(action: "notfound",controller: "errorPage")

    }
}


}