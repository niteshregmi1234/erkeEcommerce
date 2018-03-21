
class EndUserController {
    def productService
    static allowedMethods = [search: "POST"]
    def nepaliProducts(){
        def productDetailsList=ProductDetails.findAllByProductBrandInList(ProductBrand.findAllByUrlNameInList(["goldstar","black-horse"]))
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
        Collections.shuffle(productList)
        def prices=productService.pricesArray(productList)
        render(view: "nepaliBrands", model: [prices: prices,productSizeList:listList,productList: productList])

    }
    def subCategory(){
        try{
        if(params.subCategory){
        def productDetailsList=ProductDetails.findAllByProductSubCategory(ProductSubCategory.findByUrlName(params.subCategory))
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
        Collections.shuffle(productList)
        def prices=productService.pricesArray(productList)
            render(view: "specialSubCategory", model: [prices: prices,productSizeList:listList,productList: productList, specialCategoryInstance:ProductSubCategory.findByUrlName(params.subCategory)])

        }
        }
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
        Collections.shuffle(productList)

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
            stringListIdList.add(productDetails.briefDescription)
        }
            redirect(action: "result",params: [q:stringListIdList])
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
            def productDetailsIds = params.list("q")
            if (productDetailsIds) {
                List<ProductDetails> productDetailsList = new ArrayList<>()
                for (int i = 0; i < productDetailsIds.size(); i++) {
                    def id=productDetailsIds[i] as String
                    productDetailsList.add(ProductDetails.findByBriefDescription(id))
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
                Collections.shuffle(productList)

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
            Collections.shuffle(productList)

            render(view: "allProducts", model: [prices: prices,productSizeList:listList,productList: productList])

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
        if (params.specificationName != null) {
            def productInstance1 = Product.findByProductSpecificationNameAndDelFlag(params.specificationName,false)
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
            if(CompanyInformation.list()[0]){
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
        def latestProductList = Product.findAllByIsLatestAndDelFlag(true,false,[max:10])
        def productTopSalesList = Product.findAllBySoldNumbersGreaterThanAndDelFlag(0,false, [max:10,sort: "soldNumbers", order: "desc"])
        [brandList:ProductBrand.findAllByIsTop(true),upCoverImageList: upCoverImageList, latestProductList: latestProductList,featuredProductList:productTopSalesList,listListProduct:listListProduct]}
    }
        catch (Exception e){

        }
    }
    def subCategoryList() {
        try{
def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.findByUrlName(params.category), ProductSubCategory.findByUrlName(params.subCategory))
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
                        Collections.shuffle(productList)

                        render(view: "subCategoryProducts", model: [prices:prices, productSizeList:listList, productList: productList, productSubCategory: ProductSubCategory.findByUrlName(params.subCategory), productCategory: ProductCategory.findByUrlName(params.category)])
            }

        }
        catch (Exception e){

        }
    }
def test(){
}
    def allCategoryProducts() {
        try{
        if (params.category) {
            if(ProductCategory.findByUrlName(params.category)){
                List<List<ProductSize>> listList=new ArrayList<>()
                def productDetailsList = ProductDetails.findAllByProductCategory(ProductCategory.findByUrlName(params.category))
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
                Collections.shuffle(productList)

                render(view: "categoryList", model: [prices: prices, productList: productList, productCategory: ProductCategory.findByUrlName(params.category),productSizeList:listList])

        }

        }}
        catch (Exception e){

        }
    }
def topBrand(){
    try{
        if (params.brandNames != null) {
            if(ProductBrand.findByUrlName(params.brandNames)){
                def productDetailsList = ProductDetails.findAllByProductBrand(ProductBrand.findByUrlName(params.brandNames))
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
                Collections.shuffle(productList)

                render(view: "brandProducts", model: [prices: prices,productList: productList, productBrandInstance: ProductBrand.findByUrlName(params.brandNames), productSizeList:listList])

            }

        }
    }
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
    def specifiedProducts(){
        try{
            List<List<ProductSize>> listList=new ArrayList<>()
            def subCategoryList1=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findByUrlName(params.subCategorySpecify))
            def productList1=new ArrayList<>()
            for(ProductSubCategory productSubCategory: subCategoryList1){
                def product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategoryAndProductCategory(productSubCategory,ProductCategory.findByUrlName(params.category)),false)
                if(product){
                    productList1.add(product)
                }
            }
                if(productList1){
                    def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findByUrlName(params.subCategorySpecify))
                    List<ProductDetails> productDetailsList=new ArrayList<>()
                    for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsListSubCategoryWise = ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.findByUrlName(params.category),productSubCategory)
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
                    Collections.shuffle(productList)

                    render(view: "specifiedProducts", model: [prices: prices, productSpecifyInstance: ProductSubCategorySpecify.findByUrlName(params.subCategorySpecify),productCategory:ProductCategory.findByUrlName(params.category), productSizeList:listList,productList:productList])

                }

            }
        catch (Exception e){

        }
    }
    def about(){
    try{
    def aboutUsInstance = AboutUs.list()[0]
        if(aboutUsInstance){
            [aboutUsInstance: aboutUsInstance]}

    }
    catch (Exception e){

    }
}
}