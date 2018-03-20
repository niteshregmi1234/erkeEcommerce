class BootStrap {
    def productService
    def init = { servletContext ->
def productCategoryList=ProductCategory.list()
        for(ProductCategory productCategory:productCategoryList){
            productCategory.urlName=productService.convertToOriginalUrl(productCategory.categoryName)
            productCategory.save(flush: true)
        }
        def productSubCategoryList=ProductSubCategory.list()
        for(ProductSubCategory productSubCategory:productSubCategoryList){
            productSubCategory.urlName=productService.convertToOriginalUrl(productSubCategory.subCategoryName)
            productSubCategory.save(flush: true)
        }
        def productSubCategorySpecifyList=ProductSubCategorySpecify.list()
        for(ProductSubCategorySpecify productSubCategorySpecify:productSubCategorySpecifyList){
            productSubCategorySpecify.urlName=productService.convertToOriginalUrl(productSubCategorySpecify.specificationName)
            productSubCategorySpecify.save(flush: true)
        }
        def productBrandList=ProductBrand.list()
        for(ProductBrand productBrand:productBrandList){
            productBrand.urlName=productService.convertToOriginalUrl(productBrand.brandName)
            productBrand.save(flush: true)
        }
        def productList=Product.list()
        for(Product product:productList){
            product.productSpecificationName=productService.convertToOriginalUrl(product.productDetails.productBrand.urlName + "-" + product.productColor.colorName+ "-" + product.productDetails.briefDescription + "-" + product.id)
            product.save(flush: true)
        }
    }
    def destroy = {
    }
}
