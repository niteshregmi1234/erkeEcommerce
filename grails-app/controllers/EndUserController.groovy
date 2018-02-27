class EndUserController {
    def productService
    static allowedMethods = [search: "POST"]
def topSales(){
    try {
        def subList = []
        List<Product> productListSub = new ArrayList<>()
        def prices = []
        def productTopSalesList = Product.findAllBySoldNumbersGreaterThanAndDelFlag(0, false, [sort: "soldNumbers", order: "desc"])
        List<List<ProductSize>> listList = new ArrayList<>()
        List<ProductCategory> productCategoryList = new ArrayList<>()
        List<Float> discountList = new ArrayList<>()
        List<ProductBrand> productBrandList = new ArrayList<>()
        List<ProductSubCategory> productSubCategoryList = new ArrayList<>()
        subList = productService.getSubList(productTopSalesList, params)
        for (int j = 0; j < subList.size(); j++) {
            def productInstance = subList.get(j)
            productListSub.add(productInstance)
            if (!productBrandList.contains(productInstance.productDetails.productBrand)) {
                productBrandList.add(productInstance.productDetails.productBrand)
            }
            if (!productSubCategoryList.contains(productInstance.productDetails.productSubCategory)) {
                productSubCategoryList.add(productInstance.productDetails.productSubCategory)
            }
            if (!productCategoryList.contains(productInstance.productDetails.productCategory)) {
                productCategoryList.add(productInstance.productDetails.productCategory)
            }
            if (!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage != 0) {
                discountList.add(productInstance.productDetails.discountPercentage)
            }
            def sizeString = productInstance.productDetails.productSizes
            String[] stringArraySize = sizeString.split(",")
            List<ProductSize> productSizeList = new ArrayList<>()
            for (int i = 0; i < stringArraySize.size(); i++) {
                def sizeId = stringArraySize[i] as long
                if (ProductSize.get(sizeId)) {

                    productSizeList.add(ProductSize.get(sizeId))
                }
            }
            listList.add(productSizeList)
        }
        prices = productService.pricesArray(productListSub)
        [countPaginate: productTopSalesList.size(), productCategoryList: productCategoryList, productSubCategoryList: productSubCategoryList, discountList: discountList, prices: prices, productBrandList: productBrandList, productSizeList: listList, productList: subList]
    }
    catch(Exception e){

    }
}
    def brand(){
    def brandId=params.list("brand")
    print brandId
}
    def search(){
        try{
    def productDetailscriteria = ProductDetails.createCriteria()
    def productDetailsList = productDetailscriteria.list {
        or {
            like("briefDescription", "%" + params.search + "%")
            like("detailDescription", "%" + params.search + "%")
            like("productNameWithBrand", "%" + params.search + "%")
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
        }

    }
    def result() {
        try {
            def prices=[0,0]
            def subList=[]
            List<List<ProductSize>> listList=new ArrayList<>()
            List<Product> productListSub=new ArrayList<>()
            List<Product> productList = new ArrayList<>()
            List<ProductCategory> productCategoryList=new ArrayList<>()
            List<Float> discountList=new ArrayList<>()
            List<ProductBrand> productBrandList=new ArrayList<>()
            List<ProductSubCategory> productSubCategoryList=new ArrayList<>()
            def productDetailsIds = params.list("result")
            if (productDetailsIds) {
                List<ProductDetails> productDetailsList = new ArrayList<>()
                for (int i = 0; i < productDetailsIds.size(); i++) {
                    def id=productDetailsIds[i] as String
                    productDetailsList.add(ProductDetails.findByDetailId(id))
                }
          for (ProductDetails productDetails : productDetailsList) {
              def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
              if (product) {
                  productList.add(product)
              }

          }
                subList = productService.getSubList(productList, params)
                for(int j=0;j<subList.size();j++){
                    def productInstance=subList.get(j)
                    productListSub.add(productInstance)
                    if(!productBrandList.contains(productInstance.productDetails.productBrand)){
                        productBrandList.add(productInstance.productDetails.productBrand)}
                    if(!productSubCategoryList.contains(productInstance.productDetails.productSubCategory)){
                        productSubCategoryList.add(productInstance.productDetails.productSubCategory)
                    }
                    if(!productCategoryList.contains(productInstance.productDetails.productCategory)){
                        productCategoryList.add(productInstance.productDetails.productCategory)
                    }
                    if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                        discountList.add(productInstance.productDetails.discountPercentage)
                    }
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                }
                    listList.add(productSizeList)
                }
                prices=productService.pricesArray(productListSub)

            }

            render(view: "search", model: [countPaginate:productList.size(),productCategoryList:productCategoryList,productSubCategoryList:productSubCategoryList,discountList:discountList,productBrandList: productBrandList,productSizeList: listList, productList: subList,prices: prices,result:productDetailsIds])

        }
        catch (Exception e){
        }
        }

    def allProducts={
        try{
            List<Product> productListSub=new ArrayList<>()
            def subList=[]
            def prices=[0,0]
            def productDetailsList=ProductDetails.list();
            List<ProductCategory> productCategoryList=new ArrayList<>()
            List<Float> discountList=new ArrayList<>()
            List<ProductBrand> productBrandList=new ArrayList<>()
            List<ProductSubCategory> productSubCategoryList=new ArrayList<>()
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
            if (product) {
                productList.add(product)
            }
        }
            prices=productService.pricesArray(productList)
            List<List<ProductSize>> listList=new ArrayList<>()
            subList = productService.getSubList(productList, params)
            for(int j=0;j<subList.size();j++){
                def productInstance=subList.get(j)
                productListSub.add(productInstance)
                if(!productBrandList.contains(productInstance.productDetails.productBrand)){
                    productBrandList.add(productInstance.productDetails.productBrand)}
                if(!productSubCategoryList.contains(productInstance.productDetails.productSubCategory)){
                    productSubCategoryList.add(productInstance.productDetails.productSubCategory)
                }
                if(!productCategoryList.contains(productInstance.productDetails.productCategory)){
                    productCategoryList.add(productInstance.productDetails.productCategory)
                }
                if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                    discountList.add(productInstance.productDetails.discountPercentage)
                }
                def sizeString=productInstance.productDetails.productSizes
                String[] stringArraySize= sizeString.split(",")
                List<ProductSize> productSizeList=new ArrayList<>()
                for(int i=0;i<stringArraySize.size();i++){
                    def sizeId=stringArraySize[i] as long
                    if(ProductSize.get(sizeId)) {

                        productSizeList.add(ProductSize.get(sizeId))
                    }                }
                listList.add(productSizeList)
            }
            prices=productService.pricesArray(productListSub)
            render(view: "allProducts", model: [countPaginate:productList.size(),productCategoryList:productCategoryList,productSubCategoryList:productSubCategoryList,discountList:discountList,prices: prices,productBrandList: productBrandList,productSizeList:listList,productList: subList])

    }
        catch (Exception e){
        }
    }
    def specialSubCategory(){
        try{
            if(AboutUs.list()[0].specialProductSubCategory) {
                def subList=[]
                List<ProductCategory> productCategoryList=new ArrayList<>()
                List<Float> discountList=new ArrayList<>()
                List<ProductBrand> productBrandList=new ArrayList<>()
                def productDetailsList = ProductDetails.findAllByProductSubCategory(AboutUs.list()[0].specialProductSubCategory)
                List<Product> productList = new ArrayList<>()
                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
                    if (product) {
                        productList.add(product)

                    }
                }
                List<Product>  productListSub=new ArrayList<>()
                List<List<ProductSize>> listList=new ArrayList<>()
                subList = productService.getSubList(productList, params)
                for(int j=0;j<subList.size();j++){
                    def productInstance=subList.get(j)
                    productListSub.add(productInstance)
                    if(!productBrandList.contains(productInstance.productDetails.productBrand)){
                        productBrandList.add(productInstance.productDetails.productBrand)}
                    if(!productCategoryList.contains(productInstance.productDetails.productCategory)){
                        productCategoryList.add(productInstance.productDetails.productCategory)
                    }
                    if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                        discountList.add(productInstance.productDetails.discountPercentage)
                    }
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                }
                    listList.add(productSizeList)
                }
                def prices=productService.pricesArray(productListSub)
                render(view: "specialSubCategory", model: [countPaginate:productList.size(),productCategoryList:productCategoryList,discountList:discountList,prices: prices,productBrandList: productBrandList,productSizeList:listList,productList: subList, specialCategoryInstance: AboutUs.list()[0].specialProductSubCategory])
            }
      }
        catch (Exception e){

        }
    }

    def contact(){
    try {
if(CompanyInformation.list()[0]){
[companyInformation:CompanyInformation.list()[0]]  }
   }
catch (Exception e){

}
}
    def singleProduct() {
        try{
        if (params.id != null) {
            def productInstance1 = Product.findByProductIdAndDelFlag(params.id,false)
            if (productInstance1) {
                def sizeString=productInstance1.productDetails.productSizes
                String[] stringArraySize= sizeString.split(",")
                List<ProductSize> productSizeList=new ArrayList<>()
                for(int i=0;i<stringArraySize.size();i++){
                   def sizeId=stringArraySize[i] as long
                    if(ProductSize.get(sizeId)) {

                        productSizeList.add(ProductSize.get(sizeId))
                    }                }
                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategoryAndIdNotEqual(productInstance1.productDetails.productSubCategory,productInstance1.productDetails.productCategory,productInstance1.productDetails.id)
                def moreColorsList=Product.findAllByProductDetailsAndIdNotEqualAndDelFlag(productInstance1.productDetails,productInstance1.id,false)
                List<Product> relatedProductList = new ArrayList<>()

                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
                    if (product) {
                        relatedProductList.add(product[0])
                    }
                }
                Collections.shuffle(relatedProductList)

                render(view: "detail", model :[productSizeList:productSizeList,moreColorsList:moreColorsList,relatedProductList:relatedProductList,productInstance: productInstance1,productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])
            }

        }
        }
        catch (Exception e){

        }
    }
    def latestProducts(){
        def prices=[0,0]
        params.max=15
        List<List<ProductSize>> listList=new ArrayList<>()
        List<ProductCategory> productCategoryList=new ArrayList<>()
        List<Float> discountList=new ArrayList<>()
        List<ProductBrand> productBrandList=new ArrayList<>()
        List<ProductSubCategory> productSubCategoryList=new ArrayList<>()
        def latestProductList = Product.findAllByIsLatestAndDelFlag(true,false,params)
        for(Product product:latestProductList) {
            if (!productBrandList.contains(product.productDetails.productBrand)) {
                productBrandList.add(product.productDetails.productBrand)
            }
            if (!productSubCategoryList.contains(product.productDetails.productSubCategory)) {
                productSubCategoryList.add(product.productDetails.productSubCategory)
            }
            if (!discountList.contains(product.productDetails.discountPercentage) && product.productDetails.discountPercentage != 0) {
                discountList.add(product.productDetails.discountPercentage)
            }
            if (!productCategoryList.contains(product.productDetails.productCategory)) {
                productCategoryList.add(product.productDetails.productCategory)
            }

            def sizeString = product.productDetails.productSizes
            String[] stringArraySize = sizeString.split(",")
            List<ProductSize> productSizeList = new ArrayList<>()
            for (int i = 0; i < stringArraySize.size(); i++) {
                def sizeId = stringArraySize[i] as long
                if (ProductSize.get(sizeId)) {
                    productSizeList.add(ProductSize.get(sizeId))
                }
            }
            listList.add(productSizeList)
        }
            prices=productService.pricesArray(latestProductList)

[countPaginate:Product.findAllByIsLatestAndDelFlag(true,false).size(),productCategoryList:productCategoryList,productSubCategoryList:productSubCategoryList,discountList:discountList,prices: prices,productBrandList: productBrandList,productSizeList:listList,productList:latestProductList]
    }
    def userHome() {
        try{
            if(HomeContent.list()[0] && SpecialBrand.list()[0] && SeasonManagement.list()[0] && CompanyInformation.list()[0]){
                response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                def upCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "UP")
        def downCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "DOWN")
        def latestProductList = Product.findAllByIsLatestAndDelFlag(true,false,[max:10])
        def specialBrandInstance = SpecialBrand.list()[0]
            def homeContent=HomeContent.list()[0]
        def productTopSalesList = Product.findAllBySoldNumbersGreaterThanAndDelFlag(0,false, [max:10,sort: "soldNumbers", order: "desc"])
        def seasonManagementInstance = SeasonManagement.list()[0]
        [brandList:ProductBrand.findAllByIsTop(true),upCoverImageList: upCoverImageList, downCoverImageList: downCoverImageList, latestProductList: latestProductList, specialBrandInstance: specialBrandInstance, seasonManagementInstance: seasonManagementInstance,featuredProductList:productTopSalesList,homeContent:homeContent]}
    }
        catch (Exception e){

        }
    }

    def subCategoryList() {
        try{

            if(ProductDetails.findByProductCategoryAndProductSubCategory(ProductCategory.findByCategoryId(params.category), ProductSubCategory.findBySubCategoryId(params.subCategory)))
                    {
                        List<Float> discountList=new ArrayList<>()
                        List<ProductBrand> productBrandList=new ArrayList<>()
                        def productDetailsList = ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.findByCategoryId(params.category), ProductSubCategory.findBySubCategoryId(params.subCategory))
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
            if (product) {
                productList.add(product)

            }
        }

                        def subList=[]
                        List<Product>  productListSub=new ArrayList<>()
                        List<List<ProductSize>> listList=new ArrayList<>()
                        subList = productService.getSubList(productList, params)
                        for(int j=0;j<subList.size();j++){
                            def productInstance=subList.get(j)
                            productListSub.add(productInstance)
                            if(!productBrandList.contains(productInstance.productDetails.productBrand)){
                                productBrandList.add(productInstance.productDetails.productBrand)
                            }
                            if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                                discountList.add(productInstance.productDetails.discountPercentage)
                            }
                            def sizeString=productInstance.productDetails.productSizes
                            String[] stringArraySize= sizeString.split(",")
                            List<ProductSize> productSizeList=new ArrayList<>()
                            for(int i=0;i<stringArraySize.size();i++){
                                def sizeId=stringArraySize[i] as long
                                if(ProductSize.get(sizeId)) {

                                    productSizeList.add(ProductSize.get(sizeId))
                                }                }
                            listList.add(productSizeList)
                        }
                        def prices=productService.pricesArray(productListSub)

                        render(view: "subCategoryList", model: [countPaginate:productList.size(),discountList:discountList,productBrandList:productBrandList,prices:prices,productSizeList:listList,productList: subList, productSubCategory: ProductSubCategory.findBySubCategoryId(params.subCategory),productCategory: ProductCategory.findByCategoryId(params.category)])
            }
        }
        catch (Exception e){

        }
    }
def test(){
    render(view: "test")
}
    def allCategoryProducts() {
        try{
        if (params.id != null) {
            if(ProductCategory.findByCategoryId(params.id)){
                List<List<ProductSize>> listList=new ArrayList<>()
                List<Float> discountList=new ArrayList<>()
                List<ProductBrand> productBrandList=new ArrayList<>()
                List<ProductSubCategory> productSubCategoryList=new ArrayList<>()
                def productDetailsList = ProductDetails.findAllByProductCategory(ProductCategory.findByCategoryId(params.id))
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
                if (product) {
                    productList.add(product[0])

                }
            }
                List<Product> productListSub=new ArrayList<>()
                def subList = productService.getSubList(productList, params)
                for(int j=0;j<subList.size();j++){
                    def productInstance=subList.get(j)
                    productListSub.add(productInstance)
                    if(!productBrandList.contains(productInstance.productDetails.productBrand)){
                        productBrandList.add(productInstance.productDetails.productBrand)}
                    if(!productSubCategoryList.contains(productInstance.productDetails.productSubCategory)){
                        productSubCategoryList.add(productInstance.productDetails.productSubCategory)
                    }
                    if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                        discountList.add(productInstance.productDetails.discountPercentage)
                    }
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                }
                    listList.add(productSizeList)
                }
                def prices=productService.pricesArray(productListSub)
                render(view: "categoryList", model: [countPaginate: productList.size(), discountList:discountList,prices: prices,productBrandList: productBrandList, productList: subList, productCategory: ProductCategory.findByCategoryId(params.id),productSizeList:listList,productSubCategoryList:productSubCategoryList])

        }

        }}
        catch (Exception e){

        }
    }
def topBrand(){
    try{
        if (params.id != null) {
            if(ProductBrand.findById(params.id) && ProductBrand.findById(params.id).isTop){
                def subList=[]
                List<ProductCategory> productCategoryList=new ArrayList<>()
                List<Float> discountList=new ArrayList<>()
                List<ProductSubCategory> productSubCategoryList=new ArrayList<>()
                def productDetailsList = ProductDetails.findAllByProductBrand(ProductBrand.findById(params.id))
                List<Product> productList = new ArrayList<>()
                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
                    if (product) {
                        productList.add(product[0])

                    }
                }
                List<Product>  productListSub=new ArrayList<>()
                List<List<ProductSize>> listList=new ArrayList<>()
                subList = productService.getSubList(productList, params)
                for(int j=0;j<subList.size();j++){
                    def productInstance=subList.get(j)
                    productListSub.add(productInstance)
                    if(!productSubCategoryList.contains(productInstance.productDetails.productSubCategory)){
                        productSubCategoryList.add(productInstance.productDetails.productSubCategory)
                    }
                    if(!productCategoryList.contains(productInstance.productDetails.productCategory)){
                        productCategoryList.add(productInstance.productDetails.productCategory)
                    }
                    if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                        discountList.add(productInstance.productDetails.discountPercentage)
                    }
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                }
                    listList.add(productSizeList)
                }
                def prices=productService.pricesArray(productListSub)

                render(view: "brandProducts", model: [countPaginate:productList.size(),productCategoryList:productCategoryList,productSubCategoryList:productSubCategoryList,discountList:discountList,prices: prices,productList: subList, productBrandInstance: ProductBrand.findById(params.id), productSizeList:listList])

            }

        }}
    catch (Exception e){

    }
    }
    def allBrands(){
        def brandsList=new ArrayList<>()
        def topBrandsList=ProductBrand.findAllByIsTop(true)
        for(ProductBrand topBrand:topBrandsList){
            if(Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(topBrand),false)){
                brandsList.add(topBrand)
            }
        }
        def nonTopBrandsList=ProductBrand.findAllByIsTop(false)
        for(ProductBrand nonTopBrand:nonTopBrandsList){
            if(Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(nonTopBrand),false)){
                brandsList.add(nonTopBrand)
            }
        }
        render(view:"allBrands",model: [brandsList:brandsList])

    }
    def offerBrand(){
        try{
            if (params.id != null) {
                if(ProductBrand.findById(params.id) && CoverImage.findByProductBrand(ProductBrand.findById(params.id))){
                    def subList=[]
                    List<ProductCategory> productCategoryList=new ArrayList<>()
                    List<Float> discountList=new ArrayList<>()
                    List<ProductSubCategory> productSubCategoryList=new ArrayList<>()
                    def productDetailsList = ProductDetails.findAllByProductBrand(ProductBrand.findById(params.id))
                    List<Product> productList = new ArrayList<>()
                    for (ProductDetails productDetails : productDetailsList) {
                        def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
                        if (product) {
                            productList.add(product[0])

                        }
                    }
                    List<Product>  productListSub=new ArrayList<>()
                    List<List<ProductSize>> listList=new ArrayList<>()
                    subList = productService.getSubList(productList, params)
                    for(int j=0;j<subList.size();j++){
                        def productInstance=subList.get(j)
                        productListSub.add(productInstance)
                                     if(!productSubCategoryList.contains(productInstance.productDetails.productSubCategory)){
                            productSubCategoryList.add(productInstance.productDetails.productSubCategory)
                        }
                        if(!productCategoryList.contains(productInstance.productDetails.productCategory)){
                            productCategoryList.add(productInstance.productDetails.productCategory)
                        }
                        if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                            discountList.add(productInstance.productDetails.discountPercentage)
                        }
                        def sizeString=productInstance.productDetails.productSizes
                        String[] stringArraySize= sizeString.split(",")
                        List<ProductSize> productSizeList=new ArrayList<>()
                        for(int i=0;i<stringArraySize.size();i++){
                            def sizeId=stringArraySize[i] as long
                            if(ProductSize.get(sizeId)) {

                                productSizeList.add(ProductSize.get(sizeId))
                            }                }
                        listList.add(productSizeList)
                    }
                    def prices=productService.pricesArray(productListSub)

                    render(view: "brandProducts", model: [countPaginate:productList.size(),productCategoryList:productCategoryList,productSubCategoryList:productSubCategoryList,discountList:discountList,prices: prices,productList: subList, productBrandInstance: ProductBrand.findById(params.id), productSizeList:listList])

                }

            } }
        catch (Exception e){

        }

    }
    def specifiedProducts(){
        try{
            List<Float> discountList=new ArrayList<>()
            List<ProductBrand> productBrandList=new ArrayList<>()
            List<ProductSubCategory> productSubCategoryList=new ArrayList<>()
            def subCategoryList1=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(params.subCategorySpecify))
            def productList1=new ArrayList<>()
            for(ProductSubCategory productSubCategory: subCategoryList1){
                def product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategoryAndProductCategory(productSubCategory,ProductCategory.findByCategoryId(params.category)),false)
                if(product){
                    productList1.add(product)
                }
            }
                if(productList1){
                    def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(params.subCategorySpecify))
                    List<ProductDetails> productDetailsList=new ArrayList<>()
                    for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsListSubCategoryWise = ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.findByCategoryId(params.category),productSubCategory)
                        for(ProductDetails productDetails1:productDetailsListSubCategoryWise){
                            productDetailsList.add(productDetails1)
                        }
                    }
                    List<Product> productList = new ArrayList<>()
                    for (ProductDetails productDetails : productDetailsList) {
                        def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
                        if (product) {
                            productList.add(product[0])
                            if(!productBrandList.contains(product[0].productDetails.productBrand)){
                                productBrandList.add(product[0].productDetails.productBrand)}
                            if(!productSubCategoryList.contains(product[0].productDetails.productSubCategory)){
                                productSubCategoryList.add(product[0].productDetails.productSubCategory)
                            }
                            if(!discountList.contains(product[0].productDetails.discountPercentage) && product[0].productDetails.discountPercentage!=0 ) {
                                discountList.add(product[0].productDetails.discountPercentage)
                            }
                        }
                    }
                    def subList=[]
                    List<Product>  productListSub=new ArrayList<>()
                    List<List<ProductSize>> listList=new ArrayList<>()
                    subList = productService.getSubList(productList, params)
                    for(int j=0;j<subList.size();j++){
                        def productInstance=subList.get(j)
                        productListSub.add(productInstance)
                        if(!productSubCategoryList.contains(productInstance.productDetails.productSubCategory)){
                            productSubCategoryList.add(productInstance.productDetails.productSubCategory)
                        }
                        if(!productBrandList.contains(productInstance.productDetails.productBrand)){
                            productBrandList.add(productInstance.productDetails.productBrand)
                        }
                        if(!discountList.contains(productInstance.productDetails.discountPercentage) && productInstance.productDetails.discountPercentage!=0 ) {
                            discountList.add(productInstance.productDetails.discountPercentage)
                        }
                        def sizeString=productInstance.productDetails.productSizes
                        String[] stringArraySize= sizeString.split(",")
                        List<ProductSize> productSizeList=new ArrayList<>()
                        for(int i=0;i<stringArraySize.size();i++){
                            def sizeId=stringArraySize[i] as long
                            if(ProductSize.get(sizeId)) {

                                productSizeList.add(ProductSize.get(sizeId))
                            }                }
                        listList.add(productSizeList)
                    }
                    def prices=productService.pricesArray(productListSub)


                    render(view: "specifiedProducts", model: [countPaginate:productList.size(),productSubCategoryList:productSubCategoryList,discountList:discountList,prices: prices,productBrandList: productBrandList,productList: subList, productSpecifyInstance: ProductSubCategorySpecify.findById(params.subCategorySpecify),productCategory:ProductCategory.findByCategoryId(params.category), productSizeList:listList])

                }

            }
        catch (Exception e){

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
                if(ProductSize.get(sizeId)) {

                    productSizeList1.add(ProductSize.get(sizeId))
                }            }
            def sizeString2=aboutUsInstance.specialProduct2.productDetails.productSizes
            String[] stringArraySize2= sizeString2.split(",")
            List<ProductSize> productSizeList2=new ArrayList<>()
            for(int i=0;i<stringArraySize2.size();i++){
                def sizeId=stringArraySize2[i] as long
                if(ProductSize.get(sizeId)) {

                    productSizeList2.add(ProductSize.get(sizeId))
                }            }
            listList.add(productSizeList1)
            listList.add(productSizeList2)

            [aboutUsInstance: aboutUsInstance,productSizeList:listList]}

    }
    catch (Exception e){

    }
}


}