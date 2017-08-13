class EndUserController {
def a(){

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
            List<List<ProductSize>> listList=new ArrayList<>()
            for(Product productInstance:productList){
                def sizeString=productInstance.productDetails.productSizes
                String[] stringArraySize= sizeString.split(",")
                List<ProductSize> productSizeList=new ArrayList<>()
                for(int i=0;i<stringArraySize.size();i++){
                    def sizeId=stringArraySize[i] as long
                    productSizeList.add(ProductSize.get(sizeId))
                }
                listList.add(productSizeList)
            }
        render(view: "allProducts", model: [productSizeList:listList,productList: productList,productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])

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
    def singleProduct() {
        try{
        if (params.id != null) {
            def productInstance1 = Product.findByProductId(params.id)
            if (productInstance1) {
                def sizeString=productInstance1.productDetails.productSizes
                String[] stringArraySize= sizeString.split(",")
                List<ProductSize> productSizeList=new ArrayList<>()
                for(int i=0;i<stringArraySize.size();i++){
                   def sizeId=stringArraySize[i] as long
                    productSizeList.add(ProductSize.get(sizeId))
                }
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

                render(view: "detail", model :[productSizeList:productSizeList,moreColorsList:moreColorsList,relatedProductList:relatedProductList,productInstance: productInstance1,productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])
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
            if(HomeContent.list()[0] && SpecialBrand.list()[0] && SeasonManagement.list()[0]){
        def upCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "UP")
        def downCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "DOWN")
        def latestProductList = Product.findAllByIsLatest(true)
        def specialBrandInstance = SpecialBrand.list()[0]
            def homeContent=HomeContent.list()[0]
        def productList = Product.findAllByIsFeatured(true)
        def seasonManagementInstance = SeasonManagement.list()[0]
        [upCoverImageList: upCoverImageList, downCoverImageList: downCoverImageList, latestProductList: latestProductList, specialBrandInstance: specialBrandInstance, seasonManagementInstance: seasonManagementInstance,featuredProductList:productList,homeContent:homeContent]}
            else{
                redirect(action: "notfound",controller: "errorPage")

            }
    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }



    def subCategoryList() {
        try{
            if(ProductCategory.findByCategoryId(params.category) && ProductSubCategory.findBySubCategoryId(params.subCategory)){
        def productDetailsList = ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.findByCategoryId(params.category), ProductSubCategory.findBySubCategoryId(params.subCategory))
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetails(productDetails)
            if (product) {
                productList.add(product)
            }
        }
        Collections.shuffle(productList)
                List<List<ProductSize>> listList=new ArrayList<>()
                for(Product productInstance:productList){
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        productSizeList.add(ProductSize.get(sizeId))
                    }
                    listList.add(productSizeList)
                }
        render(view: "subCategoryList", model: [productSizeList:listList,productList: productList, productSubCategory: ProductSubCategory.findBySubCategoryId(params.subCategory),productCategory: ProductCategory.findByCategoryId(params.category),productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true)])
            }
        else{
            redirect(action: "notfound",controller: "errorPage")
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def allCategoryProducts() {
        try{
        if (params.id != null) {
            if(ProductCategory.findByCategoryId(params.id)){
                def productDetailsList = ProductDetails.findAllByProductCategory(ProductCategory.findByCategoryId(params.id))
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetails(productDetails)
                if (product) {
                    productList.add(product[0])

                }
            }
            Collections.shuffle(productList)

                List<List<ProductSize>> listList=new ArrayList<>()
                for(Product productInstance:productList){
                def sizeString=productInstance.productDetails.productSizes
                String[] stringArraySize= sizeString.split(",")
                List<ProductSize> productSizeList=new ArrayList<>()
                for(int i=0;i<stringArraySize.size();i++){
                    def sizeId=stringArraySize[i] as long
                    productSizeList.add(ProductSize.get(sizeId))
                }
                 listList.add(productSizeList)
                }
            render(view: "categoryList", model: [productList: productList, productCategory: ProductCategory.findByCategoryId(params.id),productSizeList:listList])

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
                List<List<ProductSize>> listList=new ArrayList<>()
                for(Product productInstance:productList){
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        productSizeList.add(ProductSize.get(sizeId))
                    }
                    listList.add(productSizeList)
                }
                render(view: "specialBrandProducts", model: [productSizeList:listList,productList: productList, specialBrandInstance: SpecialBrand.list()[0].productBrand])
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
                List<List<ProductSize>> listList=new ArrayList<>()
                for(Product productInstance:productList){
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        productSizeList.add(ProductSize.get(sizeId))
                    }
                    listList.add(productSizeList)
                }
                render(view: "specialSubCategory", model: [productSizeList:listList,productList: productList, specialCategoryInstance: AboutUs.list()[0].specialProductSubCategory])
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
                List<List<ProductSize>> listList=new ArrayList<>()
                for(Product productInstance:productList){
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        productSizeList.add(ProductSize.get(sizeId))
                    }
                    listList.add(productSizeList)
                }
            render(view: "upComingSeasonProducts", model: [productSizeList:listList,productList: productList, seasonInstance: SeasonManagement.list()[0].seasons])
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