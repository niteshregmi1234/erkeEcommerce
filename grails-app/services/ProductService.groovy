

import grails.transaction.Transactional



@Transactional
class ProductService {
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
return prices
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


