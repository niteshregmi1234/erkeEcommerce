class EndUserController {
    static allowedMethods = [search: "POST"]

    def search(){
        try{
    def productDetailscriteria = ProductDetails.createCriteria()
    def productDetailsList = productDetailscriteria.list {
        or {

            like("productName", "%" + params.search + "%")
        }
    }
            def categoryCriteria = ProductCategory.createCriteria()
            def categoryList = categoryCriteria.list {
                or {

                    like("categoryName", "%" + params.search + "%")
                }
            }
            for(ProductCategory productCategory:categoryList){
              def productDetailsList1=ProductDetails.findAllByProductCategory(productCategory)
                for(ProductDetails productDetails:productDetailsList1){
                    if(!productDetailsList.contains(productDetails)){
                    productDetailsList.add(productDetails)}

                }
            }
            def subCategoryCriteria = ProductSubCategory.createCriteria()
            def subCategoryList = subCategoryCriteria.list {
                or {

                    like("subCategoryName", "%" + params.search + "%")
                }
            }
            for(ProductSubCategory productSubCategory:subCategoryList){
                def productDetailsList1=ProductDetails.findAllByProductSubCategory(productSubCategory)
                for(ProductDetails productDetails:productDetailsList1){
                    if(!productDetailsList.contains(productDetails)){

                        productDetailsList.add(productDetails)}

                }
            }
            def brandCriteria = ProductBrand.createCriteria()
            def brandList = brandCriteria.list {
                or {

                    like("brandName", "%" + params.search + "%")
                }
            }
            for(ProductBrand productBrand:brandList){
                def productDetailsList1=ProductDetails.findAllByProductBrand(productBrand)
                for(ProductDetails productDetails:productDetailsList1){
                    if(!productDetailsList.contains(productDetails)){

                        productDetailsList.add(productDetails)}


                }
            }
        if(productDetailsList){
        List<String> stringListIdList=new ArrayList<>()
        for(ProductDetails productDetails:productDetailsList){
            stringListIdList.add(productDetails.detailId)
        }
            redirect(action: "result",params: [result:stringListIdList])
        }
        else{
           redirect(action: "result")
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }

    }
    def result() {
        try {
            List<Product> productList = new ArrayList<>()
            List<List<ProductSize>> listList = new ArrayList<>()
            def productDetailsIds = params.list("result")
            if (productDetailsIds) {
                List<ProductDetails> productDetailsList = new ArrayList<>()
                for (int i = 0; i < productDetailsIds.size(); i++) {
                    def id=productDetailsIds[i] as String
                    productDetailsList.add(ProductDetails.findByDetailId(id))
                }
          for (ProductDetails productDetails : productDetailsList) {
              def product = Product.findByProductDetails(productDetails)
              if (product) {
                  productList.add(product)

              }

          }
          Collections.shuffle(productList)
                for(Product productInstance: productList){
              def sizeString=productInstance.productDetails.productSizes
              String[] stringArraySize= sizeString.split(",")
              List <ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0; i< stringArraySize.size(); i++){
                  def sizeId=stringArraySize[i] as long
                  productSizeList.add(ProductSize.get(sizeId))
              }
              listList.add(productSizeList)

                }

            }

            render(view: "search", model: [productSizeList: listList, productList: productList, productCategoryList:ProductCategory.list(), productSubCategoryList:ProductSubCategory.findAllByStatusShow(true), productBrandList:ProductBrand.findAllByStatusShow(true), productColourList:ProductColor.findAllByStatusShow(true)])



    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
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
            if(HomeContent.list()[0] && SpecialBrand.list()[0] && SeasonManagement.list()[0] && CompanyInformation.list()[0]){
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
            List<List<ProductSize>> listList=new ArrayList<>()
            def sizeString1=aboutUsInstance.specialProduct1.productDetails.productSizes
            String[] stringArraySize1= sizeString1.split(",")
            List<ProductSize> productSizeList1=new ArrayList<>()
            for(int i=0;i<stringArraySize1.size();i++){
                def sizeId=stringArraySize1[i] as long
                productSizeList1.add(ProductSize.get(sizeId))
            }
            def sizeString2=aboutUsInstance.specialProduct2.productDetails.productSizes
            String[] stringArraySize2= sizeString2.split(",")
            List<ProductSize> productSizeList2=new ArrayList<>()
            for(int i=0;i<stringArraySize2.size();i++){
                def sizeId=stringArraySize2[i] as long
                productSizeList2.add(ProductSize.get(sizeId))
            }
            listList.add(productSizeList1)
            listList.add(productSizeList2)

            [aboutUsInstance: aboutUsInstance,productSizeList:listList]}
        else{
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    catch (Exception e){
        redirect(action: "notfound",controller: "errorPage")

    }
}


}