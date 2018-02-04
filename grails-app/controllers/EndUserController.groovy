class EndUserController {
    static allowedMethods = [search: "POST"]
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
              def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
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
                        if(ProductSize.get(sizeId)){

                            productSizeList.add(ProductSize.get(sizeId))}
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
            def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
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
                    if(ProductSize.get(sizeId)) {

                        productSizeList.add(ProductSize.get(sizeId))
                    }               }
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
        def latestProductList = Product.findAllByIsLatestAndDelFlag(true,false)
        def specialBrandInstance = SpecialBrand.list()[0]
            def homeContent=HomeContent.list()[0]
        def productList = Product.findAllByIsFeaturedAndDelFlag(true,false)
        def seasonManagementInstance = SeasonManagement.list()[0]
        [brandList:ProductBrand.findAllByIsTop(true),upCoverImageList: upCoverImageList, downCoverImageList: downCoverImageList, latestProductList: latestProductList, specialBrandInstance: specialBrandInstance, seasonManagementInstance: seasonManagementInstance,featuredProductList:productList,homeContent:homeContent]}
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
            if(ProductDetails.findByProductCategoryAndProductSubCategory(ProductCategory.findByCategoryId(params.category), ProductSubCategory.findBySubCategoryId(params.subCategory)))
                    {
        def productDetailsList = ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.findByCategoryId(params.category), ProductSubCategory.findBySubCategoryId(params.subCategory))
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
            if (product) {
                productList.add(product)
            }
        }

                        def maxPrice=0;
                        for (int counter = 1; counter < productList.size(); counter++)
                        {
                            if (productList.productDetails.price[counter] > maxPrice)
                            {
                                maxPrice = productList.productDetails.price[counter];
                            }
                        }
                        def minPrice = productList.productDetails.price[0];
                        for (int i = 1; i < productList.size(); i++) {
                            if (productList.productDetails.price[i] < minPrice) {
                                minPrice = productList.productDetails.price[i];
                            }
                        }
                        def prices=[maxPrice,minPrice]

        Collections.shuffle(productList)
                List<List<ProductSize>> listList=new ArrayList<>()
                for(Product productInstance:productList){
                    def sizeString=productInstance.productDetails.productSizes
                    String[] stringArraySize= sizeString.split(",")
                    List<ProductSize> productSizeList=new ArrayList<>()
                    for(int i=0;i<stringArraySize.size();i++){
                        def sizeId=stringArraySize[i] as long
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                    }
                    listList.add(productSizeList)
                }
        render(view: "subCategoryList", model: [prices:prices,productSizeList:listList,productList: productList, productSubCategory: ProductSubCategory.findBySubCategoryId(params.subCategory),productCategory: ProductCategory.findByCategoryId(params.category),productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true)])
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
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
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
                    if(ProductSize.get(sizeId)) {

                        productSizeList.add(ProductSize.get(sizeId))
                    }                }
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
def topBrand(){
    try{
        if (params.id != null) {
            if(ProductBrand.findById(params.id) && ProductBrand.findById(params.id).isTop){
                def productDetailsList = ProductDetails.findAllByProductBrand(ProductBrand.findById(params.id))
                List<Product> productList = new ArrayList<>()
                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
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
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                    }
                    listList.add(productSizeList)
                }
                render(view: "brandProducts", model: [productList: productList, productBrandInstance: ProductBrand.findById(params.id), productSizeList:listList])

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
    def allBrands(){
        def brandsList=new ArrayList<>()
        def topBrandsList=ProductBrand.findAllByIsTop(true)
        for(ProductBrand topBrand:topBrandsList){
            if(Product.findByProductDetails(ProductDetails.findByProductBrand(topBrand))){
                brandsList.add(topBrand)
            }
        }
        def nonTopBrandsList=ProductBrand.findAllByIsTop(false)
        for(ProductBrand nonTopBrand:nonTopBrandsList){
            if(Product.findByProductDetails(ProductDetails.findByProductBrand(nonTopBrand))){
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
                    List<Product> productList = new ArrayList<>()
                    for (ProductDetails productDetails : productDetailsList) {
                        def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
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
                            if(ProductSize.get(sizeId)) {

                                productSizeList.add(ProductSize.get(sizeId))
                            }                        }
                        listList.add(productSizeList)
                    }
                    render(view: "brandProducts", model: [productList: productList, productBrandInstance: ProductBrand.findById(params.id), productSizeList:listList])

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
    def specifiedProducts(){
        try{
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
                            if(ProductSize.get(sizeId)) {

                                productSizeList.add(ProductSize.get(sizeId))
                            }                        }
                        listList.add(productSizeList)
                    }
                    render(view: "specifiedProducts", model: [productList: productList, productSpecifyInstance: ProductSubCategorySpecify.findById(params.subCategorySpecify),productCategory:ProductCategory.findByCategoryId(params.category), productSizeList:listList])

                }
                else{
                    redirect(action: "notfound",controller: "errorPage")

                }
            }
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
                    def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
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
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                    }
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
                    def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
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
                        if(ProductSize.get(sizeId)) {

                            productSizeList.add(ProductSize.get(sizeId))
                        }                    }
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
        else{
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    catch (Exception e){
        redirect(action: "notfound",controller: "errorPage")

    }
}


}