
class EndUserController {
    def productService
    static allowedMethods = [search: "POST"]
    def subCategory(){
        try{
        if(params.id){
        def productDetailsList=ProductDetails.findAllByProductSubCategory(ProductSubCategory.findBySubCategoryName(params.id))
    if(productDetailsList){
        List<Product> productList=new ArrayList<>()
            List<List<ProductSize>> listList=new ArrayList<>()
            for(ProductDetails productDetails:productDetailsList){
            def product=Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
            if(product){
                productList.add(product)
                def sizeString=product.productDetails.productSizes
                String[] stringArraySize= sizeString.split(",")
                List<ProductSize> productSizeList=new ArrayList<>()
                for(int i=0;i<stringArraySize.size();i++){
                    def sizeId=stringArraySize[i] as long
                    if(ProductSize.get(sizeId)) {

                        productSizeList.add(ProductSize.get(sizeId))
                    }                }
                listList.add(productSizeList)
            }
        }
            def prices=productService.pricesArray(productList)
            render(view: "specialSubCategory", model: [prices: prices,productSizeList:listList,productList: productList, specialCategoryInstance:ProductSubCategory.findBySubCategoryName(params.id)])

        }}
        }
        catch (Exception e){

        }
    }
    def topSales(){
    try {
        def prices = [0,0]
        def productTopSalesList = Product.findAllBySoldNumbersGreaterThanAndDelFlag(0, false, [sort: "soldNumbers", order: "desc"])
        List<List<ProductSize>> listList = new ArrayList<>()
        for (int j = 0; j < productTopSalesList.size(); j++) {
            def productInstance = productTopSalesList.get(j)
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
        prices = productService.pricesArray(productTopSalesList)
        [ prices: prices, productSizeList: listList, productList: productTopSalesList]
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
            List<List<ProductSize>> listList=new ArrayList<>()
            List<Product> productList = new ArrayList<>()
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
                  def sizeString=product.productDetails.productSizes
                  String[] stringArraySize= sizeString.split(",")
                  List<ProductSize> productSizeList=new ArrayList<>()
                  for(int i=0;i<stringArraySize.size();i++){
                      def sizeId=stringArraySize[i] as long
                      if(ProductSize.get(sizeId)) {

                          productSizeList.add(ProductSize.get(sizeId))
                      }                }
                  listList.add(productSizeList)
              }

          }
                prices=productService.pricesArray(productList)

            }

            render(view: "search", model: [productSizeList: listList, productList: productList,prices: prices])

        }
        catch (Exception e){
        }
        }
    def allProducts(){
        try{
            def prices=[0,0]
                        def productDetailsList=ProductDetails.list();
            List<List<ProductSize>> listList=new ArrayList<>()
            List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def productInstance = Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
            if (productInstance) {
                productList.add(productInstance)
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
                   }
            prices=productService.pricesArray(productList)
            render(view: "allProducts", model: [prices: prices,productSizeList:listList,productList: productList])

    }
        catch (Exception e){
        }
    }
    def specialSubCategory(){
        try{
            if(AboutUs.list()[0].specialProductSubCategory) {
                def productDetailsList = ProductDetails.findAllByProductSubCategory(AboutUs.list()[0].specialProductSubCategory)
                List<Product> productList = new ArrayList<>()
                List<List<ProductSize>> listList=new ArrayList<>()
                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
                    if (product) {
                        productList.add(product)
                        def sizeString=product.productDetails.productSizes
                        String[] stringArraySize= sizeString.split(",")
                        List<ProductSize> productSizeList=new ArrayList<>()
                        for(int i=0;i<stringArraySize.size();i++){
                            def sizeId=stringArraySize[i] as long
                            if(ProductSize.get(sizeId)) {

                                productSizeList.add(ProductSize.get(sizeId))
                            }                }
                        listList.add(productSizeList)
                    }
                }
                def prices=productService.pricesArray(productList)
                render(view: "specialSubCategory", model: [prices: prices,productSizeList:listList,productList: productList, specialCategoryInstance: AboutUs.list()[0].specialProductSubCategory])
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
        List<List<ProductSize>> listList=new ArrayList<>()
        def latestProductLists = Product.findAllByIsLatestAndDelFlag(true,false)
        if(latestProductLists){
        prices=productService.pricesArray(latestProductLists)}
        for(Product product:latestProductLists) {
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
        [prices: prices,productSizeList:listList,productList:latestProductLists]

    }
    def userHome() {
        try{
            if(HomeContent.list()[0] && SpecialBrand.list()[0] && SeasonManagement.list()[0] && CompanyInformation.list()[0]){
                List<List<Product>> listListProduct=new ArrayList<>()
                def subCategoryList=ProductSubCategory.findAllByShowInHomePage(true)
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductSubCategory(productSubCategory)
                    List<Product> productList=new ArrayList<>()
                    for(ProductDetails productDetails:productDetailsList){
                        def product=Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
                        if(productList.size()==10){
                            break;
                        }
                        if(product){
                            productList.add(product)
                        }
                    }
                    if(productList){
                    listListProduct.add(productList)}
                }
                def upCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "UP")
        def downCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "DOWN")
        def latestProductList = Product.findAllByIsLatestAndDelFlag(true,false,[max:10])
        def specialBrandInstance = SpecialBrand.list()[0]
            def homeContent=HomeContent.list()[0]
        def productTopSalesList = Product.findAllBySoldNumbersGreaterThanAndDelFlag(0,false, [max:10,sort: "soldNumbers", order: "desc"])
        def seasonManagementInstance = SeasonManagement.list()[0]
        [brandList:ProductBrand.findAllByIsTop(true),upCoverImageList: upCoverImageList, downCoverImageList: downCoverImageList, latestProductList: latestProductList, specialBrandInstance: specialBrandInstance, seasonManagementInstance: seasonManagementInstance,featuredProductList:productTopSalesList,homeContent:homeContent,listListProduct:listListProduct]}
    }
        catch (Exception e){

        }
    }
    def subCategoryList() {
        try{
def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.findByCategoryId(params.category), ProductSubCategory.findBySubCategoryId(params.subCategory))
            if(productDetailsList)
                    {
                        List<List<ProductSize>> listList=new ArrayList<>()
                        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
            if (product) {
                productList.add(product)
                def sizeString=product.productDetails.productSizes
                String[] stringArraySize= sizeString.split(",")
                List<ProductSize> productSizeList=new ArrayList<>()
                for(int i=0;i<stringArraySize.size();i++){
                    def sizeId=stringArraySize[i] as long
                    if(ProductSize.get(sizeId)) {

                        productSizeList.add(ProductSize.get(sizeId))
                    }                }
                listList.add(productSizeList)

            }
        }

                        def prices=productService.pricesArray(productList)

                        render(view: "subCategoryProducts", model: [prices:prices, productSizeList:listList, productList: productList, productSubCategory: ProductSubCategory.findBySubCategoryId(params.subCategory), productCategory: ProductCategory.findByCategoryId(params.category)])
            }

        }
        catch (Exception e){

        }
    }
def test(){
}
    def allCategoryProducts() {
        try{
        if (params.id != null) {
            if(ProductCategory.findByCategoryId(params.id)){
                List<List<ProductSize>> listList=new ArrayList<>()
                def productDetailsList = ProductDetails.findAllByProductCategory(ProductCategory.findByCategoryId(params.id))
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
                if (product) {
                    productList.add(product)
                    def sizeString=product.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                }
                    listList.add(productSizeList)
                }
            }
                def prices=productService.pricesArray(productList)
                render(view: "categoryList", model: [prices: prices, productList: productList, productCategory: ProductCategory.findByCategoryId(params.id),productSizeList:listList])

        }

        }}
        catch (Exception e){

        }
    }
def topBrand(){
    try{
        if (params.id != null) {
            if(ProductBrand.findById(params.id) && ProductBrand.findById(params.id).isTop){
                def productDetailsList = ProductDetails.findAllByProductBrand(ProductBrand.findById(params.id))
                List<List<ProductSize>> listList=new ArrayList<>()
                List<Product> productList = new ArrayList<>()
                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
                    if (product) {
                        productList.add(product)
                        def sizeString=product.productDetails.productSizes
                        String[] stringArraySize= sizeString.split(",")
                        List<ProductSize> productSizeList=new ArrayList<>()
                        for(int i=0;i<stringArraySize.size();i++){
                            def sizeId=stringArraySize[i] as long
                            if(ProductSize.get(sizeId)) {

                                productSizeList.add(ProductSize.get(sizeId))
                            }                }
                        listList.add(productSizeList)
                    }
                }
                def prices=productService.pricesArray(productList)
                render(view: "brandProducts", model: [prices: prices,productList: productList, productBrandInstance: ProductBrand.findById(params.id), productSizeList:listList])

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
                    def productDetailsList = ProductDetails.findAllByProductBrand(ProductBrand.findById(params.id))
                    List<List<ProductSize>> listList=new ArrayList<>()
                    List<Product> productList = new ArrayList<>()
                    for (ProductDetails productDetails : productDetailsList) {
                        def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
                        if (product) {
                            productList.add(product)
                            def sizeString=product.productDetails.productSizes
                            String[] stringArraySize= sizeString.split(",")
                            List<ProductSize> productSizeList=new ArrayList<>()
                            for(int i=0;i<stringArraySize.size();i++){
                                def sizeId=stringArraySize[i] as long
                                if(ProductSize.get(sizeId)) {

                                    productSizeList.add(ProductSize.get(sizeId))
                                }                }
                            listList.add(productSizeList)

                        }
                    }
                    def prices=productService.pricesArray(productList)

                    render(view: "brandProducts", model: [prices: prices,productList: productList, productBrandInstance: ProductBrand.findById(params.id), productSizeList:listList])

                }

            } }
        catch (Exception e){

        }

    }
    def specifiedProducts(){
        try{
            List<List<ProductSize>> listList=new ArrayList<>()
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
                        def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
                        if (product) {
                            productList.add(product)
                            def sizeString=product.productDetails.productSizes
                            String[] stringArraySize= sizeString.split(",")
                            List<ProductSize> productSizeList=new ArrayList<>()
                            for(int i=0;i<stringArraySize.size();i++){
                                def sizeId=stringArraySize[i] as long
                                if(ProductSize.get(sizeId)) {

                                    productSizeList.add(ProductSize.get(sizeId))
                                }                }
                            listList.add(productSizeList)
                        }
                    }
                    def prices=productService.pricesArray(productList)
                    render(view: "specifiedProducts", model: [prices: prices, productSpecifyInstance: ProductSubCategorySpecify.findById(params.subCategorySpecify),productCategory:ProductCategory.findByCategoryId(params.category), productSizeList:listList,productList:productList])

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