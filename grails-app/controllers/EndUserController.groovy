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
if(CompanyInformation.list()[0]){
[companyInformation:CompanyInformation.list()[0]]  }
    else{
    redirect(action: "notfound",controller: "errorPage")

}}
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

    def specialBrandProducts() {
        try{
            if(SpecialBrand.list()[0].productBrand) {
                def productDetailsList = ProductDetails.findAllByProductBrand(SpecialBrand.list()[0].productBrand)
                List<Product> productList = new ArrayList<>()
                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findByProductDetails(productDetails)
                    if (product) {
                        productList.add(product)
                    }
                }
                Collections.shuffle(productList)
                render(view: "specialBrandProducts", model: [productList: productList, specialBrandInstance: SpecialBrand.list()[0].productBrand])
            }
            else{
                redirect(action: "notfound",controller: "errorPage")

            }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }
    def specialSubCategory(){
        try{
            if(AboutUs.list()[0].specialProductSubCategory) {
                def productDetailsList = ProductDetails.findAllByProductSubCategory(AboutUs.list()[0].specialProductSubCategory)
                List<Product> productList = new ArrayList<>()
                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findByProductDetails(productDetails)
                    if (product) {
                        productList.add(product)
                    }
                }
                Collections.shuffle(productList)
                render(view: "specialSubCategory", model: [productList: productList, specialCategoryInstance: AboutUs.list()[0].specialProductSubCategory])
            }
            else{
                redirect(action: "notfound",controller: "errorPage")

            }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def upcomingSeasonProducts() {
        try{
            if(SeasonManagement.list()[0].seasons){
            def productList = Product.findAllBySeasons(SeasonManagement.list()[0].seasons)
                Collections.shuffle(productList)
            render(view: "upComingSeasonProducts", model: [productList: productList, seasonInstance: SeasonManagement.list()[0].seasons])
        }
            else{
                redirect(action: "notfound",controller: "errorPage")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }



def about(){
    try{
    def aboutUsInstance = AboutUs.list()[0]
        if(aboutUsInstance){
    [aboutUsInstance: aboutUsInstance]}
        else{
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    catch (Exception e){
        redirect(action: "notfound",controller: "errorPage")

    }
}


}