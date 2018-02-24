

import grails.transaction.Transactional



@Transactional
class ProductService {

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

}


