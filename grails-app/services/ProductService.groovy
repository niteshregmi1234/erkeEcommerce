import grails.converters.JSON
import grails.transaction.Transactional

import java.text.DecimalFormat


@Transactional
class ProductService {
    private static final DecimalFormat df = new DecimalFormat("0.00")
    def addToCart(Map params,List<CartWithoutEndUser> cartWithoutEndUserList){
        def obj= JSON.parse(params.array)
        def id=obj[0] as long
        def size=obj[1] as String
        CartWithoutEndUser cartWithoutEndUser=new CartWithoutEndUser()
        cartWithoutEndUser.product=Product.get(id)
        cartWithoutEndUser.productSize=ProductSize.findBySizeNameAndStatusShow(size,true)
        cartWithoutEndUser.quantity=obj[2] as int
        cartWithoutEndUser.productDetails=cartWithoutEndUser.product.productDetails
        cartWithoutEndUser.productBrand=cartWithoutEndUser.productDetails.productBrand
        cartWithoutEndUser.productColor=cartWithoutEndUser.product.productColor
        cartWithoutEndUserList.add(cartWithoutEndUser)
        for(int i=cartWithoutEndUserList.size()-1;i>0;i--){
            Collections.swap(cartWithoutEndUserList,i,i-1)
        }
        for (int i = 0; i < cartWithoutEndUserList.size() - 1; i++) {
            for (int j = i + 1; j < cartWithoutEndUserList.size(); j++) {
                if (cartWithoutEndUserList[i].product.id == cartWithoutEndUserList[j].product.id && cartWithoutEndUserList[i].productSize.sizeName == cartWithoutEndUserList[j].productSize.sizeName) {
                    cartWithoutEndUserList[i].quantity = cartWithoutEndUserList[i].quantity + cartWithoutEndUserList[j].quantity
                    cartWithoutEndUserList.remove(cartWithoutEndUserList[j])
                    j--
                }

            }
        }
        return cartWithoutEndUserList
    }
def deleteCart(Map params,List<CartWithoutEndUser> cartWithoutEndUserList){
    try{
        def idList= JSON.parse(params.idList)
        def index=idList[0] as int
        def productId=idList[1] as long
        def sizeId=idList[2] as long
        def success
        def cartWithoutEndUserDelete=cartWithoutEndUserList[index]
        if(cartWithoutEndUserDelete.productSize.id==sizeId && cartWithoutEndUserDelete.product.id==productId) {
            cartWithoutEndUserList.removeAt(index)
            success="yes"
        }
        else{
          success="no"
        }
            def totalPrice=0
        for(CartWithoutEndUser cartWithoutEndUser:cartWithoutEndUserList){
            totalPrice=totalPrice+((cartWithoutEndUser.productDetails.price*cartWithoutEndUser.quantity)-(cartWithoutEndUser.productDetails.discountPercentage*(cartWithoutEndUser.productDetails.price*cartWithoutEndUser.quantity)/100))
        }
        def shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
        def totalPrice1=totalPrice+shippingAndHandling
        def tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
        def totalPriceTotal=totalPrice1+tax
        def totalUnits=[df.format(totalPrice),df.format(shippingAndHandling),df.format(tax),df.format(totalPriceTotal),cartWithoutEndUserList,success,cartWithoutEndUserList.size()]
        return totalUnits

    }
    catch (Exception e){

    }
}
    def cart(List<CartWithoutEndUser> cartList){
    try{
        def totalPrice=0
        def shippingAndHandling=0
        def tax=0
        def totalPriceTotal=0
        if(cartList.size()>0){
            for(CartWithoutEndUser cart:cartList){
                totalPrice=totalPrice+((cart.productDetails.price*cart.quantity)-(cart.productDetails.discountPercentage*(cart.productDetails.price*cart.quantity)/100))
            }
            shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
            def totalPrice1=totalPrice+shippingAndHandling
            tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
            totalPriceTotal=totalPrice1+tax
        }
        def totalArray=[df.format(totalPrice),"abc",df.format(shippingAndHandling),df.format(tax),df.format(totalPriceTotal)]
        return totalArray
    }
    catch (Exception e){
    }

}
    def updateBasket(Map params,List<CartWithoutEndUser> cartWithoutEndUserList){
        try{
            def totalPrice=0
            def success
            def quantityList= JSON.parse(params.array)
            if(quantityList.size()==cartWithoutEndUserList.size()) {
                for (int i = 0; i < quantityList.size(); i++) {
                    def quantity = quantityList[i] as int
                    if (quantity < 1) {
                        cartWithoutEndUserList[i].quantity = cartWithoutEndUserList[i].quantity
                    } else {
                        cartWithoutEndUserList[i].quantity = quantity
                    }
                    totalPrice = totalPrice + ((cartWithoutEndUserList[i].productDetails.price * cartWithoutEndUserList[i].quantity) - (cartWithoutEndUserList[i].productDetails.discountPercentage * (cartWithoutEndUserList[i].productDetails.price * cartWithoutEndUserList[i].quantity) / 100))
                }
                success="yes"
            }
            else{
                for(CartWithoutEndUser cartWithoutEndUser:cartWithoutEndUserList){
                    totalPrice=totalPrice+((cartWithoutEndUser.productDetails.price*cartWithoutEndUser.quantity)-(cartWithoutEndUser.productDetails.discountPercentage*(cartWithoutEndUser.productDetails.price*cartWithoutEndUser.quantity)/100))
                }
                success="no"
            }
            def shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
            def totalPrice1=totalPrice+shippingAndHandling
            def tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
            def totalPriceTotal=totalPrice1+tax
            def totalUnits=[df.format(totalPrice),df.format(shippingAndHandling),df.format(tax),df.format(totalPriceTotal),cartWithoutEndUserList,success]
            return totalUnits
        }
        catch (Exception e){

        }
    }
    def checkAddToCart(Map params,List<CartWithoutEndUser> cartWithoutEndUserList){
        try{
            def obj= JSON.parse(params.array)
            def id=obj[0] as long
            def size=obj[1] as long
            CartWithoutEndUser cartWithoutEndUser=new CartWithoutEndUser()
            cartWithoutEndUser.product=Product.get(id)
            cartWithoutEndUser.productSize=ProductSize.findByIdAndStatusShow(size,true)
            cartWithoutEndUser.quantity=1
            cartWithoutEndUser.productDetails=cartWithoutEndUser.product.productDetails
            cartWithoutEndUser.productBrand=cartWithoutEndUser.productDetails.productBrand
            cartWithoutEndUser.productColor=cartWithoutEndUser.product.productColor
            cartWithoutEndUserList.add(cartWithoutEndUser)
            for(int i=cartWithoutEndUserList.size()-1;i>0;i--){
                Collections.swap(cartWithoutEndUserList,i,i-1)
            }
            for (int i = 0; i < cartWithoutEndUserList.size() - 1; i++) {
                for (int j = i + 1; j < cartWithoutEndUserList.size(); j++) {
                    if (cartWithoutEndUserList[i].product.id == cartWithoutEndUserList[j].product.id && cartWithoutEndUserList[i].productSize.sizeName == cartWithoutEndUserList[j].productSize.sizeName) {
                        cartWithoutEndUserList[i].quantity = cartWithoutEndUserList[i].quantity + cartWithoutEndUserList[j].quantity
                        cartWithoutEndUserList.remove(cartWithoutEndUserList[j])
                        j--
                    }

                }
            }
            return cartWithoutEndUserList
        }
        catch (Exception e){

        }
    }
    def searchProduct(String search){
        try {
            def productDetailscriteria = ProductDetails.createCriteria()
            def productDetailsList = productDetailscriteria.list {
                or {
                    like("briefDescription", "%" + search + "%")
                    like("detailDescription", "%" + search + "%")
                    like("productNameWithBrand", "%" + search + "%")
                    like("productName", "%" + search + "%")
                }
            }
            def categoryCriteria = ProductCategory.createCriteria()
            def categoryList = categoryCriteria.list {
                or {

                    like("categoryName", "%" + search + "%")
                }
            }
            for (ProductCategory productCategory : categoryList) {
                def productDetailsList1 = ProductDetails.findAllByProductCategory(productCategory)
                for (ProductDetails productDetails : productDetailsList1) {
                    if (!productDetailsList.contains(productDetails)) {
                        productDetailsList.add(productDetails)
                    }

                }
            }
            def subCategoryCriteria = ProductSubCategory.createCriteria()
            def subCategoryList = subCategoryCriteria.list {
                or {

                    like("subCategoryName", "%" + search + "%")
                }
            }
            for (ProductSubCategory productSubCategory : subCategoryList) {
                def productDetailsList1 = ProductDetails.findAllByProductSubCategory(productSubCategory)
                for (ProductDetails productDetails : productDetailsList1) {
                    if (!productDetailsList.contains(productDetails)) {

                        productDetailsList.add(productDetails)
                    }

                }
            }
            def brandCriteria = ProductBrand.createCriteria()
            def brandList = brandCriteria.list {
                or {

                    like("brandName", "%" + search + "%")
                }
            }
            for (ProductBrand productBrand : brandList) {
                def productDetailsList1 = ProductDetails.findAllByProductBrand(productBrand)
                for (ProductDetails productDetails : productDetailsList1) {
                    if (!productDetailsList.contains(productDetails)) {

                        productDetailsList.add(productDetails)
                    }


                }

            }
            List<List<ProductSize>> listList = new ArrayList<>()
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails, false)
                if (product) {
                    for(Product product1:product){
                    productList.add(product1)}

                }

            }


//            Collections.shuffle(productList)
            productList=productListWithPriority(productList)
            def prices = pricesArray(productList)
            for(Product productInstance:productList){
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
            def totalArray=[productList,prices,listList]
            return totalArray
        }
        catch (Exception e) {
        }
    }
    def advertisementList(){

    }
    def homeContent(){
        try{
//            def advertisementList=advertisementList()
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
        def brandList=ProductBrand.findAllByIsTop(true)
        def totalArray=[upCoverImageList,brandList,latestProductList,productTopSalesList,listListProduct]
return totalArray}
        catch (Exception e){

        }
    }
    def nepaliProducts(){
        try{
        def productDetailsList=ProductDetails.findAllByProductBrandInList(ProductBrand.findAllByUrlNameInList(["goldstar","black-horse"]))
        List<Product> productList=new ArrayList<>()
        List<List<ProductSize>> listList=new ArrayList<>()
        for(ProductDetails productDetails:productDetailsList){
            def product=Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
            if(product){
                productList.add(product)
            }
        }
        Collections.shuffle(productList)
        def prices=pricesArray(productList)
            for(Product productInstance:productList){
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

            def totalArray = [productList, prices, listList]
        return totalArray
        }
        catch(Exception e){

        }
    }
    def subCategory(String subCategory){
        try {
            def productSubCategory = ProductSubCategory.findByUrlName(subCategory)
            def productDetailsList = ProductDetails.findAllByProductSubCategory(productSubCategory)
            List<Product> productList = new ArrayList<>()
            List<List<ProductSize>> listList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails, false)[0]
                if (product) {
                    productList.add(product)

                }
            }
            def prices = pricesArray(productList)
            Collections.shuffle(productList)
            for(Product productInstance:productList){
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

            def totalArray = [productList, prices, listList, productSubCategory]
            return totalArray
        }
        catch(Exception e){

        }
    }
    def singleProduct(String specificationName){
        try{
        def productInstance1 = Product.findByProductSpecificationNameAndDelFlag(specificationName,false)
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
            def productViewList=ProductView.findAllByProductAndDelFlag(productInstance1,false)
            def totalArray=[productInstance1,productSizeList,moreColorsList,relatedProductList,productViewList]
            return totalArray
        }}
        catch (Exception e){

        }
    }
    def latestProducts(){
        try {
            List<List<ProductSize>> listList = new ArrayList<>()
            def latestProductLists = Product.findAllByIsLatestAndDelFlag(true, false)
            for (Product product : latestProductLists) {
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
            def prices = pricesArray(latestProductLists)
            def totalArray = [latestProductLists, prices, listList]
            return totalArray
        }
        catch (Exception e){

        }
    }
    List<Product> productListWithPriority(List<Product> productList){
        for (int i=0;i<productList.size()-1;i++){
            for (int j=i+1;j<productList.size();j++){
                if(productList[i].priorityNumber>productList[j].priorityNumber){
                    def temp=new Product()
                    temp=productList[i]
                    productList[i]=productList[j]
                    productList[j]=temp
                }
            }
        }
        return productList
    }
    def topBrandProducts(String brandNames){
        try{
            def productBrand=ProductBrand.findByUrlName(brandNames)
        def productDetailsList = ProductDetails.findAllByProductBrand(productBrand)
        List<List<ProductSize>> listList=new ArrayList<>()
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
            if (product) {
                for(Product product1:product){
                    productList.add(product1)}

            }
        }
        def prices=pricesArray(productList)
             productList=productListWithPriority(productList)

//        Collections.shuffle(productList)
            for(Product productInstance:productList){
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

            def totalArray=[productList,prices,listList,productBrand]
return totalArray
    }
        catch(Exception e){

        }
    }

    def getAllBrands(){
        try {
            def brandsList = new ArrayList<>()
            def topBrandsList = ProductBrand.findAllByIsTop(true)
            for (ProductBrand topBrand : topBrandsList) {
                if (Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(topBrand), false)) {
                    brandsList.add(topBrand)
                }
            }
            def nonTopBrandsList = ProductBrand.findAllByIsTop(false)
            for (ProductBrand nonTopBrand : nonTopBrandsList) {
                if (Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(nonTopBrand), false)) {
                    brandsList.add(nonTopBrand)
                }
            }
            return brandsList
        }
        catch (Exception e){

        }
        }
    def subCategoryList(String subCategory,String category){
        try{
        def productCategory=ProductCategory.findByUrlName(category)
        def productSubCategory=ProductSubCategory.findByUrlName(subCategory)
        def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategory(productCategory,productSubCategory)
        List<List<ProductSize>> listList=new ArrayList<>()
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetailsAndDelFlag(productDetails,false)
            if (product) {
                for(Product product1:product){
                    productList.add(product1)}


            }
        }

        def prices=pricesArray(productList)
            productList=productListWithPriority(productList)
//        Collections.shuffle(productList)
            for(Product productInstance:productList){
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

            def totalArray=[productList,prices,listList,productCategory,productSubCategory]
        return totalArray}
        catch (Exception e){

        }
    }
    def specifiedProducts(String subCategorySpecification,String category) {
        try{
            List<List<ProductSize>> listList = new ArrayList<>()
        def productSubCategorySpecify = ProductSubCategorySpecify.findByUrlName(subCategorySpecification)
        def subCategoryList = ProductSubCategory.findAllByProductSubCategorySpecify(productSubCategorySpecify)
        def productCategory = ProductCategory.findByUrlName(category)
        List<ProductDetails> productDetailsList = new ArrayList<>()
        for (ProductSubCategory productSubCategory : subCategoryList) {
            def productDetailsListSubCategoryWise = ProductDetails.findAllByProductCategoryAndProductSubCategory(productCategory, productSubCategory)
            for (ProductDetails productDetails1 : productDetailsListSubCategoryWise) {
                productDetailsList.add(productDetails1)
            }
        }
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findAllByProductDetailsAndDelFlag(productDetails, false)
            if (product) {
                for(Product product1:product){
                    productList.add(product1)}
            }
        }
        def prices = pricesArray(productList)
            productList=productListWithPriority(productList)

//        Collections.shuffle(productList)
            for(Product productInstance:productList){
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

            def totalArray = [productList, prices, listList, productCategory, productSubCategorySpecify]
        return totalArray
    }
        catch(Exception e){

        }
    }
    def checkProduct(String subCategorySpecification,String category){
        try{
        def subCategoryList1=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findByUrlName(subCategorySpecification))
        def productList1=new ArrayList<>()
        for(ProductSubCategory productSubCategory: subCategoryList1){
            def product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategoryAndProductCategory(productSubCategory,ProductCategory.findByUrlName(category)),false)
            if(product){
                productList1.add(product)
            }
        }
        return productList1
    }
        catch(Exception e){

        }
    }
def topSales(){
    try {
        def productTopSalesList = Product.findAllBySoldNumbersGreaterThanAndDelFlag(0, false, [sort: "soldNumbers", order: "desc"])
        List<List<ProductSize>> listList = new ArrayList<>()
        Collections.shuffle(productTopSalesList)
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
        def prices = pricesArray(productTopSalesList)
        def totalArray=[productTopSalesList,prices,listList]
        return totalArray
    }
    catch(Exception e){

    }
}
    def ad(List<Product> productList){
        try{
            List<List<ProductSize>> listList=new ArrayList<>()
            def prices=pricesArray(productList)
            Collections.shuffle(productList)
            for(Product productInstance:productList){
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

            def totalArray=[productList,prices,listList]
            return totalArray
        }
        catch (Exception e){
        }
    }
    def allProducts(){

        try{
            def productDetailsList=ProductDetails.list()
            List<List<ProductSize>> listList=new ArrayList<>()
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
                if (product) {
                    for(Product product1:product){
                        productList.add(product1)}

                }
            }
            def prices=pricesArray(productList)
            productList=productListWithPriority(productList)

//            Collections.shuffle(productList)
            for(Product productInstance:productList){
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

            def totalArray=[productList,prices,listList]
return totalArray
        }
        catch (Exception e){
        }
    }
    def allCategoryProducts(String category){
        try {
            List<List<ProductSize>> listList = new ArrayList<>()
            def productCategory=ProductCategory.findByUrlName(category)
            def productDetailsList = ProductDetails.findAllByProductCategory(productCategory)
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails, false)
                if (product) {
                    for(Product product1:product){
                        productList.add(product1)}
                }
            }
            def prices = pricesArray(productList)
            productList=productListWithPriority(productList)

//            Collections.shuffle(productList)
            for(Product productInstance:productList){
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

        def totalArray=[productList,prices,listList,productCategory]
            return totalArray
        }
        catch(Exception e){

        }
    }
    def convertToOriginalUrl(String urlName){
        def urlOriginal=""
        urlName = urlName.replace("&", "");
        urlName = urlName.replace("/", "");
        urlName = urlName.replace(" ", "-");
        for(int i=0;i<urlName.size();i++){
            if(urlOriginal.contains('-') && urlName[i]=='-' && urlName[i]==urlName[i-1]) {
                urlOriginal=urlOriginal+""
            }
            else{
                urlOriginal=urlOriginal+urlName[i]

            }
        }
        urlOriginal=urlOriginal.toLowerCase()
        return  urlOriginal

    }
    def getSubList(List objectList, Map params) {
        //verify params
        try {
            params.max = params.max.toInteger()
            params.offset = params.offset.toInteger()
        } catch (Exception exceptionInstance) {
            params.max = 3
            params.offset = 0
        }
        //Verify pagination params... if not you add them
        if (params.max <= 0) {
            params.max = 3
        }
        //Get total size of the list
        def objectInstanceTotal = objectList.size()
        //verify offset.
        if (params.offset < 0 || params.offset > objectInstanceTotal) {
            params.offset = 0
        }
        //Verify the pagination border (don't excess from array border).
        Integer bordeInteger = params.max + params.offset
        if (bordeInteger > objectInstanceTotal) {
            bordeInteger = objectInstanceTotal
        }

        //Extract the sublist based on the pagination.
        def objectSubList = objectList.subList(params.offset, bordeInteger)

        return objectSubList
    }
    def pricesArray(List<Product> productList){
        try{
        def maxPrice=0;
        def minPrice=0;
        if(productList){
        for (int counter = 0; counter < productList.size(); counter++)
        {
            if (productList.productDetails.price[counter] > maxPrice)
            {
                maxPrice = productList.productDetails.price[counter];
            }
        }
        minPrice = productList.productDetails.price[0];
        for (int i = 0; i < productList.size(); i++) {
            if (productList.productDetails.price[i] < minPrice) {
                minPrice = productList.productDetails.price[i];
            }
        }}
        def prices=[maxPrice,minPrice]
return prices}
        catch(Exception e){

        }
    }
    def productIfAllDiscountWithRange(String[] brandIds,String[] categoryIds,String[] specificationIds,String[] subCategoryIds,float discountFrom,float discountTo) {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,k,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {
                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                for(l=0;l<specificationIds.size();l++) {
                    def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)
                    for(m=0;m<subCategoryIds.size();m++) {
                        def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategoryAndProductSubCategoryAndDiscountPercentageBetween(brandInstance,categoryInstance,subCategoryInstance,discountFrom,discountTo)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(!productDetailsListTotal.contains(productDetails)){
                                    productDetailsListTotal.add(productDetails)
                                }
                            }
                        }

                    }
                    m=0
                }
                l=0;

            }
            k=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecificationAndSubCategoryDiscountWithRange(String[] brandIds,String[] specificationIds,String[] subCategoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<specificationIds.size();l++) {
                def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndDiscountPercentageBetween(brandInstance,subCategoryInstance,discountFrom,discountTo)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategoryAndSpecificationAndSubCategoryDiscountWithRange(String[] specificationIds,String[] categoryIds,String[] subCategoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(l=0;l<specificationIds.size();l++) {
                def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategoryAndDiscountPercentageBetween(categoryInstance,subCategoryInstance,discountFrom,discountTo)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndCategoryAndSubCategoryDiscountWithRange(String[] brandIds,String[] categoryIds,String[] subCategoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategoryAndDiscountPercentageBetween(brandInstance,subCategoryInstance,categoryInstance,discountFrom,discountTo)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }

                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecificationAndCategoryDiscountWithRange(String[] brandIds, String[] categoryIds ,String[] specificationIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<specificationIds.size();m++) {
                    def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                    for(ProductSubCategory productSubCategory:subCategoryList){
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategoryAndDiscountPercentageBetween(brandInstance,productSubCategory,categoryInstance,discountFrom,discountTo)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(!productDetailsListTotal.contains(productDetails)){
                                    productDetailsListTotal.add(productDetails)
                                }
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndCategoryDiscountWithRange(String[] brandIds,String[] categoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategoryAndDiscountPercentageBetween(brandInstance,categoryInstance,discountFrom,discountTo)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }



            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecificationDiscountWithRange(String[] brandIds,String[] specificationIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndDiscountPercentageBetween(brandInstance,productSubCategory,discountFrom,discountTo)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
            }
            m=0


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSubCategoryDiscountWithRange(String[] brandIds,String[] subCategoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndDiscountPercentageBetween(brandInstance,subCategoryInstance,discountFrom,discountTo)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            m=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationAndCategoryDiscountWithRange(String[] categoryIds, String[] specificationIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategoryAndDiscountPercentageBetween(categoryInstance,productSubCategory,discountFrom,discountTo)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
            }
            m=0


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationAndSubCategoryDiscountWithRange(String[] subCategoryIds,String[] specificationIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int l,m
        for(l=0;l<specificationIds.size();l++) {
            def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndDiscountPercentageBetween(subCategoryInstance,discountFrom,discountTo)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            m=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategoryAndSubCategoryDiscountWithRange(String[] subCategoryIds,String[] categoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategoryAndDiscountPercentageBetween(subCategoryInstance,categoryInstance,discountFrom,discountTo)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            l=0;
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }
        def totalArray=ad(productList)
        return totalArray

    }
    def productIfBrandDiscountWithRange(String[] brandIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            def productDetailsList=ProductDetails.findAllByProductBrandAndDiscountPercentageBetween(brandInstance,discountFrom,discountTo)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }

        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategoryDiscountWithRange(String[] categoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int l
        for(l=0;l<categoryIds.size();l++) {
            def categoryInstance=ProductCategory.findById(categoryIds[l] as long)
            def productDetailsList=ProductDetails.findAllByProductCategoryAndDiscountPercentageBetween(categoryInstance,discountFrom,discountTo)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationDiscountWithRange(String[] specificationIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int m
        for(m=0;m<specificationIds.size();m++) {
            def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
            for(ProductSubCategory productSubCategory:subCategoryList){
                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndDiscountPercentageBetween(productSubCategory,discountFrom,discountTo)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray

    }
    def productIfSubCategoryDiscountWithRange(String[] subCategoryIds,float discountFrom,float discountTo)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            def productDetailsList=ProductDetails.findAllByProductSubCategoryAndDiscountPercentageBetween(subCategoryInstance,discountFrom,discountTo)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }

    def productIfAllDiscountWithNoRange(String[] brandIds,String[] categoryIds,String[] specificationIds,String[] subCategoryIds,float discount) {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,k,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {
                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                for(l=0;l<specificationIds.size();l++) {
                    def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)
                    for(m=0;m<subCategoryIds.size();m++) {
                        def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategoryAndProductSubCategoryAndDiscountPercentage(brandInstance,categoryInstance,subCategoryInstance,discount)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(!productDetailsListTotal.contains(productDetails)){
                                    productDetailsListTotal.add(productDetails)
                                }
                            }
                        }

                    }
                    m=0
                }
                l=0;

            }
            k=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecificationAndSubCategoryDiscountWithNoRange(String[] brandIds,String[] specificationIds,String[] subCategoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<specificationIds.size();l++) {
                def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndDiscountPercentage(brandInstance,subCategoryInstance,discount)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategoryAndSpecificationAndSubCategoryDiscountWithNoRange(String[] specificationIds,String[] categoryIds,String[] subCategoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(l=0;l<specificationIds.size();l++) {
                def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategoryAndDiscountPercentage(categoryInstance,subCategoryInstance,discount)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndCategoryAndSubCategoryDiscountWithNoRange(String[] brandIds,String[] categoryIds,String[] subCategoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategoryAndDiscountPercentage(brandInstance,subCategoryInstance,categoryInstance,discount)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }

                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecificationAndCategoryDiscountWithNoRange(String[] brandIds, String[] categoryIds ,String[] specificationIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<specificationIds.size();m++) {
                    def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                    for(ProductSubCategory productSubCategory:subCategoryList){
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategoryAndDiscountPercentage(brandInstance,productSubCategory,categoryInstance,discount)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(!productDetailsListTotal.contains(productDetails)){
                                    productDetailsListTotal.add(productDetails)
                                }
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndCategoryDiscountWithNoRange(String[] brandIds,String[] categoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategoryAndDiscountPercentage(brandInstance,categoryInstance,discount)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }



            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecificationDiscountWithNoRange(String[] brandIds,String[] specificationIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndDiscountPercentage(brandInstance,productSubCategory,discount)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
            }
            m=0


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSubCategoryDiscountWithNoRange(String[] brandIds,String[] subCategoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndDiscountPercentage(brandInstance,subCategoryInstance,discount)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            m=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationAndCategoryDiscountWithNoRange(String[] categoryIds, String[] specificationIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategoryAndDiscountPercentage(categoryInstance,productSubCategory,discount)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
            }
            m=0


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationAndSubCategoryDiscountWithNoRange(String[] subCategoryIds,String[] specificationIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int l,m
        for(l=0;l<specificationIds.size();l++) {
            def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndDiscountPercentage(subCategoryInstance,discount)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            m=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategoryAndSubCategoryDiscountWithNoRange(String[] subCategoryIds,String[] categoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategoryAndDiscountPercentage(subCategoryInstance,categoryInstance,discount)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            l=0;
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }
        def totalArray=ad(productList)
        return totalArray

    }
    def productIfBrandDiscountWithNoRange(String[] brandIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            def productDetailsList=ProductDetails.findAllByProductBrandAndDiscountPercentage(brandInstance,discount)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }

        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategoryDiscountWithNoRange(String[] categoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int l
        for(l=0;l<categoryIds.size();l++) {
            def categoryInstance=ProductCategory.findById(categoryIds[l] as long)
            def productDetailsList=ProductDetails.findAllByProductCategoryAndDiscountPercentage(categoryInstance,discount)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationDiscountWithNoRange(String[] specificationIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int m
        for(m=0;m<specificationIds.size();m++) {
            def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
            for(ProductSubCategory productSubCategory:subCategoryList){
                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndDiscountPercentage(productSubCategory,discount)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray

    }
    def productIfSubCategoryDiscountWithNoRange(String[] subCategoryIds,float discount)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            def productDetailsList=ProductDetails.findAllByProductSubCategoryAndDiscountPercentage(subCategoryInstance,discount)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }

    def productIfAll(String[] brandIds,String[] categoryIds,String[] specificationIds,String[] subCategoryIds) {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
               int j,k,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {
                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                for(l=0;l<specificationIds.size();l++) {
                    def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)
                    for(m=0;m<subCategoryIds.size();m++) {
                        def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategoryAndProductSubCategory(brandInstance,categoryInstance,subCategoryInstance)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(!productDetailsListTotal.contains(productDetails)){
                                    productDetailsListTotal.add(productDetails)
                                }
                            }
                        }

                    }
                    m=0
                }
                l=0;

            }
            k=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }
        def totalArray=ad(productList)
        return totalArray
    }
def productIfBrandAndSpecificationAndSubCategory(String[] brandIds,String[] specificationIds,String[] subCategoryIds)
{List<ProductDetails> productDetailsListTotal=new ArrayList<>()
    List<Product> productList=new ArrayList<>()

    int j,l,m
    for(j=0;j<brandIds.size();j++){
        def brandInstance=ProductBrand.findById(brandIds[j] as long)
        for(l=0;l<specificationIds.size();l++) {
            def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategory(brandInstance,subCategoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }

            }
            m=0
        }
        l=0;


    }
    if(productDetailsListTotal){
        for(ProductDetails productDetails:productDetailsListTotal){
            def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
            if(product){
                productList.add(product)
            }
        }
    }

    def totalArray=ad(productList)
    return totalArray
    }
    def productIfCategoryAndSpecificationAndSubCategory(String[] specificationIds,String[] categoryIds,String[] subCategoryIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(l=0;l<specificationIds.size();l++) {
                def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategory(categoryInstance,subCategoryInstance)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndCategoryAndSubCategory(String[] brandIds,String[] categoryIds,String[] subCategoryIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategory(brandInstance,subCategoryInstance,categoryInstance)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecificationAndCategory(String[] brandIds, String[] categoryIds ,String[] specificationIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<specificationIds.size();m++) {
                    def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                    for(ProductSubCategory productSubCategory:subCategoryList){
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategory(brandInstance,productSubCategory,categoryInstance)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(!productDetailsListTotal.contains(productDetails)){
                                    productDetailsListTotal.add(productDetails)
                                }
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndCategory(String[] brandIds,String[] categoryIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategory(brandInstance,categoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }
            }
            l=0;
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSpecification(String[] brandIds,String[] specificationIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategory(brandInstance,productSubCategory)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }
                }
            }
            m=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrandAndSubCategory(String[] brandIds,String[] subCategoryIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategory(brandInstance,subCategoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            m=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationAndCategory(String[] categoryIds, String[] specificationIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategory(categoryInstance,productSubCategory)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(!productDetailsListTotal.contains(productDetails)){
                                productDetailsListTotal.add(productDetails)
                            }
                        }
                    }


                }
            }
            m=0


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecificationAndSubCategory(String[] subCategoryIds,String[] specificationIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int l,m
        for(l=0;l<specificationIds.size();l++) {
            def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                def productDetailsList=ProductDetails.findAllByProductSubCategory(subCategoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
            m=0
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategoryAndSubCategory(String[] subCategoryIds,String[] categoryIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j,l
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategory(subCategoryInstance,categoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }
            }
            l=0;
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }
        def totalArray=ad(productList)
        return totalArray
    }
    def productIfBrand(String[] brandIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            def productDetailsList=ProductDetails.findAllByProductBrand(brandInstance)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfCategory(String[] categoryIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int l
        for(l=0;l<categoryIds.size();l++) {
            def categoryInstance=ProductCategory.findById(categoryIds[l] as long)
            def productDetailsList=ProductDetails.findAllByProductCategory(categoryInstance)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }
    def productIfSpecification(String[] specificationIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int m
        for(m=0;m<specificationIds.size();m++) {
            def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
            for(ProductSubCategory productSubCategory:subCategoryList){
                def productDetailsList=ProductDetails.findAllByProductSubCategory(productSubCategory)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(!productDetailsListTotal.contains(productDetails)){
                            productDetailsListTotal.add(productDetails)
                        }
                    }
                }


            }
        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray

    }
    def productIfSubCategory(String[] subCategoryIds)
    {
        List<ProductDetails> productDetailsListTotal=new ArrayList<>()
        List<Product> productList=new ArrayList<>()
        int j
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            def productDetailsList=ProductDetails.findAllByProductSubCategory(subCategoryInstance)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(!productDetailsListTotal.contains(productDetails)){
                        productDetailsListTotal.add(productDetails)
                    }
                }
            }


        }
        if(productDetailsListTotal){
            for(ProductDetails productDetails:productDetailsListTotal){
                def product=Product.findAllByDelFlagAndProductDetails(false,productDetails)[0]
                if(product){
                    productList.add(product)
                }
            }
        }

        def totalArray=ad(productList)
        return totalArray
    }

    def changeDiscountIfAll(ArrayList brandIds,ArrayList categoryIds,ArrayList specificationIds,ArrayList subCategoryIds,float discountPercentage) {
        int j,k,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {
                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                for(l=0;l<specificationIds.size();l++) {
                    def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                    for(m=0;m<subCategoryIds.size();m++) {
                        def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategoryAndProductSubCategory(brandInstance,categoryInstance,subCategoryInstance)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(discountPercentage==0f){
                                    productDetails.isSale=false
                                    productDetails.discountPercentage=0
                                    productDetails.save(flush: true)
                                }
                                else{
                                    productDetails.isSale=true
                                    productDetails.discountPercentage=discountPercentage
                                    productDetails.save(flush: true)
                                }
                            }
                        }
                    }
                    m=0
                }
                l=0;

            }
            k=0
        }

    }
    def changeDiscountIfBrandAndSpecificationAndSubCategory(ArrayList brandIds,ArrayList specificationIds,ArrayList subCategoryIds,float discountPercentage)
    {
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<specificationIds.size();l++) {
                def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategory(brandInstance,subCategoryInstance)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(discountPercentage==0f){
                                productDetails.isSale=false
                                productDetails.discountPercentage=0
                                productDetails.save(flush: true)
                            }
                            else{
                                productDetails.isSale=true
                                productDetails.discountPercentage=discountPercentage
                                productDetails.save(flush: true)
                            }

                        }
                    }
                }
                m=0
            }
            l=0;


        }

    }
    def changeDiscountIfCategoryAndSpecificationAndSubCategory(ArrayList specificationIds,ArrayList categoryIds,ArrayList subCategoryIds,float discountPercentage)
    {
        int j,l,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(l=0;l<specificationIds.size();l++) {
                def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategory(categoryInstance,subCategoryInstance)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(discountPercentage==0f){
                                productDetails.isSale=false
                                productDetails.discountPercentage=0
                                productDetails.save(flush: true)
                            }
                            else{
                                productDetails.isSale=true
                                productDetails.discountPercentage=discountPercentage
                                productDetails.save(flush: true)
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }

    }
    def changeDiscountIfBrandAndCategoryAndSubCategory(ArrayList brandIds,ArrayList categoryIds,ArrayList subCategoryIds,float discountPercentage)
    {
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategory(brandInstance,subCategoryInstance,categoryInstance)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(discountPercentage==0f){
                                productDetails.isSale=false
                                productDetails.discountPercentage=0
                                productDetails.save(flush: true)
                            }
                            else{
                                productDetails.isSale=true
                                productDetails.discountPercentage=discountPercentage
                                productDetails.save(flush: true)
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }

    }
    def changeDiscountIfBrandAndSpecificationAndCategory(ArrayList brandIds, ArrayList categoryIds ,ArrayList specificationIds,float discountPercentage)
    {
        int j,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                for(m=0;m<specificationIds.size();m++) {
                    def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                    for(ProductSubCategory productSubCategory:subCategoryList){
                        def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategoryAndProductCategory(brandInstance,productSubCategory,categoryInstance)
                        if(productDetailsList){
                            for(ProductDetails productDetails:productDetailsList){
                                if(discountPercentage==0f){
                                    productDetails.isSale=false
                                    productDetails.discountPercentage=0
                                    productDetails.save(flush: true)
                                }
                                else{
                                    productDetails.isSale=true
                                    productDetails.discountPercentage=discountPercentage
                                    productDetails.save(flush: true)
                                }
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }

    }
    def changeDiscountIfBrandAndCategory(ArrayList brandIds,ArrayList categoryIds,float discountPercentage)
    {
        int j,l
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductBrandAndProductCategory(brandInstance,categoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(discountPercentage==0f){
                            productDetails.isSale=false
                            productDetails.discountPercentage=0
                            productDetails.save(flush: true)
                        }
                        else{
                            productDetails.isSale=true
                            productDetails.discountPercentage=discountPercentage
                            productDetails.save(flush: true)
                        }
                    }
                }

            }
            l=0;


        }


    }
    def changeDiscountIfBrandAndSpecification(ArrayList brandIds,ArrayList specificationIds,float discountPercentage)
    {
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategory(brandInstance,productSubCategory)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(discountPercentage==0f){
                                productDetails.isSale=false
                                productDetails.discountPercentage=0
                                productDetails.save(flush: true)
                            }
                            else{
                                productDetails.isSale=true
                                productDetails.discountPercentage=discountPercentage
                                productDetails.save(flush: true)
                            }
                        }
                    }
                }
            }
            m=0


        }

    }
    def changeDiscountIfBrandAndSubCategory(ArrayList brandIds,ArrayList subCategoryIds,float discountPercentage)
    {
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                def productDetailsList=ProductDetails.findAllByProductBrandAndProductSubCategory(brandInstance,subCategoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(discountPercentage==0f){
                            productDetails.isSale=false
                            productDetails.discountPercentage=0
                            productDetails.save(flush: true)
                        }
                        else{
                            productDetails.isSale=true
                            productDetails.discountPercentage=discountPercentage
                            productDetails.save(flush: true)
                        }                    }
                }
            }
            m=0
        }

    }
    def changeDiscountIfSpecificationAndCategory(ArrayList categoryIds, ArrayList specificationIds,float discountPercentage)
    {
        int j,m
        for(j=0;j<categoryIds.size();j++){
            def categoryInstance=ProductCategory.findById(categoryIds[j] as long)
            for(m=0;m<specificationIds.size();m++) {
                def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
                for(ProductSubCategory productSubCategory:subCategoryList){
                    def productDetailsList=ProductDetails.findAllByProductCategoryAndProductSubCategory(categoryInstance,productSubCategory)
                    if(productDetailsList){
                        for(ProductDetails productDetails:productDetailsList){
                            if(discountPercentage==0f){
                                productDetails.isSale=false
                                productDetails.discountPercentage=0
                                productDetails.save(flush: true)
                            }
                            else{
                                productDetails.isSale=true
                                productDetails.discountPercentage=discountPercentage
                                productDetails.save(flush: true)
                            }                        }
                    }
                }
            }
            m=0


        }

    }
    def changeDiscountIfSpecificationAndSubCategory(ArrayList subCategoryIds,ArrayList specificationIds,float discountPercentage)
    {
        int l,m
        for(l=0;l<specificationIds.size();l++) {
            def specificationInstance=ProductSubCategorySpecify.findById(specificationIds[l] as long)

            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findByIdAndProductSubCategorySpecify(subCategoryIds[m] as long,specificationInstance)
                def productDetailsList=ProductDetails.findAllByProductSubCategory(subCategoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(discountPercentage==0f){
                            productDetails.isSale=false
                            productDetails.discountPercentage=0
                            productDetails.save(flush: true)
                        }
                        else{
                            productDetails.isSale=true
                            productDetails.discountPercentage=discountPercentage
                            productDetails.save(flush: true)
                        }
                    }
                }
            }
            m=0
        }

    }
    def changeDiscountIfCategoryAndSubCategory(ArrayList subCategoryIds,ArrayList categoryIds,float discountPercentage)
    {
        int j,l
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            for(l=0;l<categoryIds.size();l++) {
                def categoryInstance=ProductCategory.findById(categoryIds[l] as long)

                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategory(subCategoryInstance,categoryInstance)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(discountPercentage==0f){
                            productDetails.isSale=false
                            productDetails.discountPercentage=0
                            productDetails.save(flush: true)
                        }
                        else{
                            productDetails.isSale=true
                            productDetails.discountPercentage=discountPercentage
                            productDetails.save(flush: true)
                        }
                    }
                }

            }
            l=0;
        }

    }
    def changeDiscountIfBrand(ArrayList brandIds,float discountPercentage)
    {
        int j
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            def productDetailsList=ProductDetails.findAllByProductBrand(brandInstance)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(discountPercentage==0f){
                        productDetails.isSale=false
                        productDetails.discountPercentage=0
                        productDetails.save(flush: true)
                    }
                    else{
                        productDetails.isSale=true
                        productDetails.discountPercentage=discountPercentage
                        productDetails.save(flush: true)
                    }
                }
            }

        }

    }
    def changeDiscountIfCategory(ArrayList categoryIds,float discountPercentage)
    {
        int l
        for(l=0;l<categoryIds.size();l++) {
            def categoryInstance=ProductCategory.findById(categoryIds[l] as long)
            def productDetailsList=ProductDetails.findAllByProductCategory(categoryInstance)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(discountPercentage==0f){
                        productDetails.isSale=false
                        productDetails.discountPercentage=0
                        productDetails.save(flush: true)
                    }
                    else{
                        productDetails.isSale=true
                        productDetails.discountPercentage=discountPercentage
                        productDetails.save(flush: true)
                    }
                }
            }

        }

    }
    def changeDiscountIfSpecification(ArrayList specificationIds,float discountPercentage)
    {
        int m
        for(m=0;m<specificationIds.size();m++) {
            def subCategoryList=ProductSubCategory.findAllByProductSubCategorySpecify(ProductSubCategorySpecify.findById(specificationIds[m] as long))
            for(ProductSubCategory productSubCategory:subCategoryList){
                def productDetailsList=ProductDetails.findAllByProductSubCategory(productSubCategory)
                if(productDetailsList){
                    for(ProductDetails productDetails:productDetailsList){
                        if(discountPercentage==0f){
                            productDetails.isSale=false
                            productDetails.discountPercentage=0
                            productDetails.save(flush: true)
                        }
                        else{
                            productDetails.isSale=true
                            productDetails.discountPercentage=discountPercentage
                            productDetails.save(flush: true)
                        }
                    }
                }
            }
        }


    }
    def changeDiscountIfSubCategory(ArrayList subCategoryIds,float discountPercentage)
    {
        int j
        for(j=0;j<subCategoryIds.size();j++){
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[j] as long)
            def productDetailsList=ProductDetails.findAllByProductSubCategory(subCategoryInstance)
            if(productDetailsList){
                for(ProductDetails productDetails:productDetailsList){
                    if(discountPercentage==0f){
                        productDetails.isSale=false
                        productDetails.discountPercentage=0
                        productDetails.save(flush: true)
                    }
                    else{
                        productDetails.isSale=true
                        productDetails.discountPercentage=discountPercentage
                        productDetails.save(flush: true)
                    }                }
            }

        }

    }
    def checkFloat(Map params){
        def isFloat=false
        def string=params.discount
        if (string.matches("[-+]?[0-9]*\\.?[0-9]+")) { // You can use the `\\d` instead of `0-9` too!
            isFloat=true
        }
        return isFloat
    }

}


