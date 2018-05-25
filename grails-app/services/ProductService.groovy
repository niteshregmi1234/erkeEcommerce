import grails.converters.JSON
import grails.transaction.Transactional

import java.text.DecimalFormat


@Transactional
class ProductService {
    private static final DecimalFormat df = new DecimalFormat("0.00")
def deleteCart(Map params,EndUserInformation endUserInformation){
    try{
        def id=params.id as long
        def cartInstance=Cart.get(id)
        if(cartInstance){
            cartInstance.delete(flush: true)
        }
        def cartList=Cart.findAllByEndUserInformation(endUserInformation)
        def totalPrice=0
        for(Cart cart:cartList){
            totalPrice=totalPrice+((cart.product.productDetails.price*cart.quantity)-(cart.product.productDetails.discountPercentage*(cart.product.productDetails.price*cart.quantity)/100))
        }
        def shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
        def totalPrice1=totalPrice+shippingAndHandling
        def tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
        def totalPriceTotal=totalPrice1+tax
        def totalUnits=[df.format(totalPrice),df.format(shippingAndHandling),df.format(tax),df.format(totalPriceTotal)]
        return totalUnits

    }
    catch (Exception e){

    }
}
    def cart(EndUserInformation endUserInformation){
    try{
        def cartList=Cart.findAllByEndUserInformation(endUserInformation)
        def totalPrice=0
        def shippingAndHandling=0
        def tax=0
        def totalPriceTotal=0
        List<Product> relatedProductList = new ArrayList<>()
        if(cartList.size()>0){
            for(Cart cart:cartList){
                totalPrice=totalPrice+((cart.product.productDetails.price*cart.quantity)-(cart.product.productDetails.discountPercentage*(cart.product.productDetails.price*cart.quantity)/100))
            }
            shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
            def totalPrice1=totalPrice+shippingAndHandling
            tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
            totalPriceTotal=totalPrice1+tax
            def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategoryAndIdNotEqual(cartList[cartList.size()-1].product.productDetails.productSubCategory,cartList[cartList.size()-1].product.productDetails.productCategory,cartList[cartList.size()-1].product.productDetails.id)


            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)
                if (product) {
                    relatedProductList.add(product[0])
                }
            }
            Collections.shuffle(relatedProductList)}
        def totalArray=[df.format(totalPrice),relatedProductList,df.format(shippingAndHandling),df.format(tax),df.format(totalPriceTotal)]
        return totalArray
    }
    catch (Exception e){
    }

}
    def updateBasket(Map params,EndUserInformation endUserInformation){
        try{
            def totalPrice=0
            def obj= JSON.parse(params.array)
            for(int i=0;i<obj[0].size();i++){
                def id=obj[0][i] as long
                def sizeId=obj[2][i] as long
                def cartInstance=Cart.findByEndUserInformationAndProductAndProductSize(endUserInformation,Product.get(id),ProductSize.get(sizeId))
                def quantity=obj[1][i] as int
                if(quantity<1){
                    cartInstance.quantity=cartInstance.quantity
                }
                else{
                    cartInstance.quantity=quantity
                }
                cartInstance.save(flush: true)
                totalPrice=totalPrice+((cartInstance.product.productDetails.price*cartInstance.quantity)-(cartInstance.product.productDetails.discountPercentage*(cartInstance.product.productDetails.price*cartInstance.quantity)/100))
            }
            def shippingAndHandling= OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100
            def totalPrice1=totalPrice+shippingAndHandling
            def tax=OtherCosts.list()[0].taxPercentage*totalPrice1/100
            def totalPriceTotal=totalPrice1+tax
            def totalUnits=[df.format(totalPrice),df.format(shippingAndHandling),df.format(tax),df.format(totalPriceTotal)]
            return totalUnits
        }
        catch (Exception e){

        }
    }
    def checkAddToCart(Map params,EndUserInformation endUserInformation){
        try{
            if(endUserInformation){
                def obj= JSON.parse(params.array)
                def id=obj[1] as long
                def sizeId=obj[0] as long
                def productInstance=Product.get(id)
                def cartInstanceCheck=Cart.findByEndUserInformationAndProductAndProductSize(endUserInformation,productInstance,ProductSize.get(sizeId))
                if(cartInstanceCheck){
                    cartInstanceCheck.quantity=cartInstanceCheck.quantity+1
                    cartInstanceCheck.save(flush: true)
                }
                else{
                    def cartInstance=new Cart()
                    cartInstance.product=productInstance
                    cartInstance.quantity=1
                    cartInstance.productSize=ProductSize.get(sizeId)
                    cartInstance.endUserInformation=endUserInformation
                    cartInstance.save(flush: true)
                }
                return "ok"
            }
            else{

                return "notOk"

            }
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
                def product = Product.findByProductDetailsAndDelFlag(productDetails, false)
                if (product) {
                    productList.add(product)

                }

            }
            Collections.shuffle(productList)
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
    def homeContent(){
        try{
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
    def topBrandProducts(String brandNames){
        try{
            def productBrand=ProductBrand.findByUrlName(brandNames)
        def productDetailsList = ProductDetails.findAllByProductBrand(productBrand)
        List<List<ProductSize>> listList=new ArrayList<>()
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
            if (product) {
                productList.add(product)
            }
        }
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
                productList.add(product)

            }
        }

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
    def allProducts(){

        try{
            def productDetailsList=ProductDetails.list()
            List<List<ProductSize>> listList=new ArrayList<>()
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def productInstance = Product.findAllByProductDetailsAndDelFlag(productDetails,false)[0]
                if (productInstance) {
                    productList.add(productInstance)

                }
            }
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
    def allCategoryProducts(String category){
        try {
            List<List<ProductSize>> listList = new ArrayList<>()
            def productCategory=ProductCategory.findByUrlName(category)
            def productDetailsList = ProductDetails.findAllByProductCategory(productCategory)
            List<Product> productList = new ArrayList<>()
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
    def brandIdsAndSubCategoryIdsAndDiscountListAndCategoryIds(ArrayList brandIds,ArrayList subCategoryIds,ArrayList discountList, ArrayList categoryIds,float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        int j,k,l,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {

                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                for(l=0;l<discountList.size();l++) {
                    for(m=0;m<subCategoryIds.size();m++) {
                        def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                        def productDetailsList1=ProductDetails.findAllByProductBrandAndProductCategoryAndProductSubCategoryAndDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,categoryInstance,subCategoryInstance,discountList[l] as float,minPrice,maxPrice)
                        if(productDetailsList1){
                            for(ProductDetails productDetails:productDetailsList1){
                                if(!productDetailsList.contains(productDetails)){
                                    productDetailsList.add(productDetails)
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
return productDetailsList
    }
    def brandIdsAndSubCategoryIdsAndCategoryIds(ArrayList brandIds,ArrayList subCategoryIds,ArrayList categoryIds,float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        int j,k,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {

                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                    def productDetailsList1=ProductDetails.findAllByProductBrandAndProductCategoryAndProductSubCategoryAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,categoryInstance,subCategoryInstance,minPrice,maxPrice)
                    if(productDetailsList1){
                        for(ProductDetails productDetails:productDetailsList1){
                            if(!productDetailsList.contains(productDetails)){
                                productDetailsList.add(productDetails)
                            }
                        }
                    }
                }
                m=0
            }

            k=0
        }
return productDetailsList
    }
    def brandIdsAndDiscountListAndCategoryIds(ArrayList brandIds,ArrayList discountList, ArrayList categoryIds,float minPrice,float maxPrice){
       int j,k,l
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {
                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                for(l=0;l<discountList.size();l++) {
                    def productDetailsList1=ProductDetails.findAllByProductBrandAndProductCategoryAndDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,categoryInstance,discountList[l] as float,minPrice,maxPrice)
                    if(productDetailsList1){
                        for(ProductDetails productDetails:productDetailsList1){
                            if(!productDetailsList.contains(productDetails)){
                                productDetailsList.add(productDetails)
                            }
                        }
                    }

                }
                l=0;

            }
            k=0
        }
return productDetailsList
    }
    def brandIdsAndSubCategoryIdsAndDiscountList(ArrayList brandIds,ArrayList subCategoryIds,ArrayList discountList,float minPrice,float maxPrice){
        int j,l,m
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)

            for(l=0;l<discountList.size();l++) {
                for(m=0;m<subCategoryIds.size();m++) {
                    print subCategoryIds
                    def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                    def productDetailsList1=ProductDetails.findAllByProductBrandAndProductSubCategoryAndDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,subCategoryInstance,discountList[l] as float,minPrice,maxPrice)
                    if(productDetailsList1){
                        for(ProductDetails productDetails:productDetailsList1){
                            if(!productDetailsList.contains(productDetails)){
                                productDetailsList.add(productDetails)
                            }
                        }
                    }
                }
                m=0
            }
            l=0;


        }
        return productDetailsList

    }
    def subCategoryIdsAndDiscountListAndCategoryIds(ArrayList subCategoryIds,ArrayList discountList, ArrayList categoryIds,float minPrice,float maxPrice){
       int k,l,m
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(k=0;k<categoryIds.size();k++) {

            def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
            for(l=0;l<discountList.size();l++) {
                for(m=0;m<subCategoryIds.size();m++) {
                    def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                    def productDetailsList1=ProductDetails.findAllByProductCategoryAndProductSubCategoryAndDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(categoryInstance,subCategoryInstance,discountList[l] as float,minPrice,maxPrice)
                    if(productDetailsList1){
                        for(ProductDetails productDetails:productDetailsList1){
                            if(!productDetailsList.contains(productDetails)){
                                productDetailsList.add(productDetails)
                            }
                        }
                    }

                }
                m=0
            }
            l=0;

        }
        return productDetailsList

    }
    def brandIdsAndCategoryIds(ArrayList brandIds, ArrayList categoryIds,float minPrice,float maxPrice){
       int j,k
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(k=0;k<categoryIds.size();k++) {
                def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
                def productDetailsList1=ProductDetails.findAllByProductBrandAndProductCategoryAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,categoryInstance,minPrice,maxPrice)
                if(productDetailsList1){
                    for(ProductDetails productDetails:productDetailsList1){
                        if(!productDetailsList.contains(productDetails)){
                            productDetailsList.add(productDetails)
                        }
                    }
                }
            }
            k=0
        }
        return productDetailsList

    }
    def brandIdsAndSubCategoryIds(ArrayList brandIds,ArrayList subCategoryIds,float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        int j,m
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                def productDetailsList1=ProductDetails.findAllByProductBrandAndProductSubCategoryAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,subCategoryInstance,minPrice,maxPrice)
                if(productDetailsList1){
                    for(ProductDetails productDetails:productDetailsList1){
                        if(!productDetailsList.contains(productDetails)){
                            productDetailsList.add(productDetails)
                        }
                    }
                }

            }
            m=0


        }
        return productDetailsList

    }
    def brandIdsAndDiscountList(ArrayList brandIds,ArrayList discountList, float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
   int j,l
        for(j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            for(l=0;l<discountList.size();l++) {
                def productDetailsList1=ProductDetails.findAllByProductBrandAndDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,discountList[l] as float,minPrice,maxPrice)
                if(productDetailsList1){
                    for(ProductDetails productDetails:productDetailsList1){
                        if(!productDetailsList.contains(productDetails)){
                            productDetailsList.add(productDetails)
                        }
                    }
                }

            }
            l=0

        }

    }
    def subCategoryIdsAndDiscountList(ArrayList subCategoryIds,ArrayList discountList,float minPrice,float maxPrice){
        int l,m
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(l=0;l<discountList.size();l++) {
            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                def productDetailsList1=ProductDetails.findAllByProductSubCategoryAndDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(subCategoryInstance,discountList[l] as float,minPrice,maxPrice)
                if(productDetailsList1){
                    for(ProductDetails productDetails:productDetailsList1){
                        if(!productDetailsList.contains(productDetails)){
                            productDetailsList.add(productDetails)
                        }
                    }
                }

            }
            m=0
        }
        return productDetailsList

    }
    def subCategoryIdsAndCategoryIds(ArrayList subCategoryIds, ArrayList categoryIds,float minPrice,float maxPrice){
     int k,m
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(k=0;k<categoryIds.size();k++) {
            def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
            for(m=0;m<subCategoryIds.size();m++) {
                def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
                def productDetailsList1=ProductDetails.findAllByProductCategoryAndProductSubCategoryAndPriceGreaterThanEqualsAndPriceLessThanEquals(categoryInstance,subCategoryInstance,minPrice,maxPrice)
                if(productDetailsList1){
                    for(ProductDetails productDetails:productDetailsList1){
                        if(!productDetailsList.contains(productDetails)){
                            productDetailsList.add(productDetails)
                        }
                    }
                }

            }
            m=0;

        }
        return productDetailsList

    }
    def discountListAndCategoryIds(ArrayList discountList, ArrayList categoryIds,float minPrice,float maxPrice){
    int k,l
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(k=0;k<categoryIds.size();k++) {
            def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
            for(l=0;l<discountList.size();l++) {
                def productDetailsList1=ProductDetails.findAllByProductCategoryAndDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(categoryInstance,discountList[l] as float,minPrice,maxPrice)
                if(productDetailsList1){
                    for(ProductDetails productDetails:productDetailsList1){
                        if(!productDetailsList.contains(productDetails)){
                            productDetailsList.add(productDetails)
                        }
                    }
                }

            }
            l=0;

        }
        return productDetailsList

    }
    def subCategoryIds(ArrayList subCategoryIds,float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(int m=0;m<subCategoryIds.size();m++) {
            def subCategoryInstance=ProductSubCategory.findById(subCategoryIds[m] as long)
            def productDetailsList1=ProductDetails.findAllByProductSubCategoryAndPriceGreaterThanEqualsAndPriceLessThanEquals(subCategoryInstance,minPrice,maxPrice)
            if(productDetailsList1){
                for(ProductDetails productDetails:productDetailsList1){
                    if(!productDetailsList.contains(productDetails)){
                        productDetailsList.add(productDetails)
                    }
                }
            }

        }
        return productDetailsList

    }
    def discountList(ArrayList discountList,float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(int l=0;l<discountList.size();l++) {
            def productDetailsList1=ProductDetails.findAllByDiscountPercentageAndPriceGreaterThanEqualsAndPriceLessThanEquals(discountList[l] as float,minPrice,maxPrice)
            if(productDetailsList1){
                for(ProductDetails productDetails:productDetailsList1){
                    if(!productDetailsList.contains(productDetails)){
                        productDetailsList.add(productDetails)
                    }
                }
            }

        }
        return productDetailsList

    }
    def brandIds(ArrayList brandIds,float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        for(int j=0;j<brandIds.size();j++){
            def brandInstance=ProductBrand.findById(brandIds[j] as long)
            def productDetailsList1=ProductDetails.findAllByProductBrandAndPriceGreaterThanEqualsAndPriceLessThanEquals(brandInstance,minPrice,maxPrice)
            if(productDetailsList1){
                for(ProductDetails productDetails:productDetailsList1){
                    if(!productDetailsList.contains(productDetails)){
                        productDetailsList.add(productDetails)
                    }
                }
            }

        }
        return productDetailsList

    }
    def categoryIds(ArrayList categoryIds,float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        int k;
        for(k=0;k<categoryIds.size();k++) {
            def categoryInstance=ProductCategory.findById(categoryIds[k] as long)
            def productDetailsList1=ProductDetails.findAllByProductCategoryAndPriceGreaterThanEqualsAndPriceLessThanEquals(categoryInstance,minPrice,maxPrice)
            if(productDetailsList1){
                for(ProductDetails productDetails:productDetailsList1){
                    if(!productDetailsList.contains(productDetails)){
                        productDetailsList.add(productDetails)
                    }
                }
            }
        }
        return productDetailsList

    }
    def maxPriceAndMinPrice(float minPrice,float maxPrice){
        List<ProductDetails> productDetailsList=new ArrayList<>()
        def productDetailsList1=ProductDetails.findAllByPriceGreaterThanEqualsAndPriceLessThanEquals(minPrice,maxPrice)
        if(productDetailsList1){
            for(ProductDetails productDetails:productDetailsList1){
                if(!productDetailsList.contains(productDetails)){
                    productDetailsList.add(productDetails)
                }
            }
        }
        return productDetailsList

    }


}


