import grails.converters.JSON
class EndUserController {
    def notfound(){}
    def a(){
session.endUser=null;
    }
    def allProducts={
        def productDetailsList=ProductDetails.list();
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetailsAndSeasons(productDetails, SeasonManagement.list()[1].seasons)
            if (product) {
                productList.add(product)
            }
        }
        Collections.shuffle(productList)
        render(view: "allProducts", model: [productList: productList,productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])

    }
def contact(){
[companyInformation:CompanyInformation.list()[0]]
}
    def singleProduct(Long id) {
        if (id != null) {
            def productInstance1 = Product.get(id)
            if (productInstance1) {
                def productDetailsList=ProductDetails.findAllByProductSubCategoryAndProductCategoryAndIdNotEqual(productInstance1.productDetails.productSubCategory,productInstance1.productDetails.productCategory,productInstance1.productDetails.id)
                List<Product> relatedProductList = new ArrayList<>()

                for (ProductDetails productDetails : productDetailsList) {
                    def product = Product.findAllByProductDetailsAndSeasons(productDetails, SeasonManagement.list()[1].seasons)
                    if (product) {
                        relatedProductList.add(product[0])
                    }
                }
                Collections.shuffle(relatedProductList)

                render(view: "detail", model :[relatedProductList:relatedProductList,productInstance: productInstance1,productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])
            }
        } else {
            print "error is error"
            render("error")
        }
    }

    def userHome() {
        def upCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "UP")
        def downCoverImageList = CoverImage.findAllByStatusShowAndSlidePlace(true, "DOWN")
        def latestProductList = Product.findAllByIsLatestAndSeasons(true, SeasonManagement.list()[1].seasons)
        def specialBrandInstance = SpecialBrand.list()[0]
        def productList = Product.findAllByIsFeaturedAndSeasons(true, SeasonManagement.list()[1].seasons)
        def seasonManagementInstance = SeasonManagement.list()[0]
        [upCoverImageList: upCoverImageList, downCoverImageList: downCoverImageList, latestProductList: latestProductList, specialBrandInstance: specialBrandInstance, seasonManagementInstance: seasonManagementInstance,featuredProductList:productList]
    }

    def fetchAboutUrl() {
        def aboutUsInstance = AboutUs.list()[0]
        def url4 = "../images/otherStuffs/" + aboutUsInstance.backgroundImage;

        render url4
    }

    def fetchUrl() {
        def seasonManagementInstance = SeasonManagement.list()[0].seasons.imageName
        def backgroundImage1 = BackgroundImage.list()[0].imageName
        def backgroundImage2 = BackgroundImage.list()[1].imageName
        def imageUrl1 = "../images/seasonsImage/" + seasonManagementInstance;
        def imageUrl2 = "images/seasonsImage/" + seasonManagementInstance;
        def imageUrl3 = "../images/otherStuffs/" + backgroundImage1;
        def imageUrl4 = "images/otherStuffs/" + backgroundImage1;
        def imageUrl5 = "../images/otherStuffs/" + backgroundImage2;
        def imageUrl6 = "images/otherStuffs/" + backgroundImage2;

        def totalImageUrl = [imageUrl1, imageUrl2, imageUrl3, imageUrl4, imageUrl5, imageUrl6]
        render totalImageUrl as JSON
    }

    def subCategoryList() {
        def productDetailsList = ProductDetails.findAllByProductCategoryAndProductSubCategory(ProductCategory.get(params.id1), ProductSubCategory.get(params.id2))
        List<Product> productList = new ArrayList<>()
        for (ProductDetails productDetails : productDetailsList) {
            def product = Product.findByProductDetailsAndSeasons(productDetails, SeasonManagement.list()[1].seasons)
            if (product) {
                productList.add(product)
            }
        }
        Collections.shuffle(productList)
        render(view: "subCategoryList", model: [productList: productList, productSubCategory: ProductSubCategory.get(params.id2),productCategory: ProductCategory.get(params.id1),productCategoryList:ProductCategory.list(),productSubCategoryList:ProductSubCategory.findAllByStatusShow(true),productBrandList:ProductBrand.findAllByStatusShow(true),productColourList:ProductColor.findAllByStatusShow(true)])
    }

    def allCategoryProducts(Long id) {
        if (id != null) {
            def productDetailsList = ProductDetails.findAllByProductCategory(ProductCategory.get(id))
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndSeasons(productDetails, SeasonManagement.list()[1].seasons)
                if (product) {
                    productList.add(product[0])
                }
            }
            Collections.shuffle(productList)
            render(view: "categoryList", model: [productList: productList, productCategory: ProductCategory.get(params.id)])

        } else {
            render "error"
        }
    }

    def specialBrandProducts(Long id) {
        if (id != null) {
            def productDetailsList = ProductDetails.findAllByProductBrand(SpecialBrand.get(id).productBrand)
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findByProductDetailsAndSeasons(productDetails, SeasonManagement.list()[1].seasons)
                if (product) {
                    productList.add(product)
                }
            }
            Collections.shuffle(productList)
            render(view: "specialBrandProducts", model: [productList: productList, specialBrandInstance: SpecialBrand.get(id)])

        } else {
            render "error"
        }
    }

    def upcomingSeasonProducts(Long id) {
        if (id != null) {
            def productList = Product.findAllBySeasons(SeasonManagement.get(id).seasons)
            render(view: "upcomingSeasonProducts", model: [productList: productList, seasonInstance: SeasonManagement.get(id).seasons])
        } else {
            render "error"
        }
    }

    def featuredProducts() {
        def productList = Product.findAllByIsFeaturedAndSeasons(true, SeasonManagement.list()[1].seasons)
        def coverImageList = CoverImage.findAllBySlidePlaceAndStatusShow("UP", true)
        Collections.shuffle(coverImageList)
        render(view: "featuredProducts", model: [productList: productList, coverImage: coverImageList[0]])


    }
def about(){
    def aboutUsInstance = AboutUs.list()[0]
    [aboutUsInstance: aboutUsInstance]
}
//    def aboutCompany() {
//        def aboutUsInstance = AboutUs.list()[0]
//        [aboutUsInstance: aboutUsInstance]
//    }

    def allSubCategoryProducts(Long id) {
        if (id != null) {
            def productDetailsList = ProductDetails.findAllByProductSubCategory(ProductSubCategory.get(id))
            List<Product> productList = new ArrayList<>()
            for (ProductDetails productDetails : productDetailsList) {
                def product = Product.findAllByProductDetailsAndSeasons(productDetails, SeasonManagement.list()[1].seasons)
                if (product) {
                    productList.add(product[0])
                }
            }
            Collections.shuffle(productList)
            render(view: "subCategoryProducts", model: [productList: productList, productSubCategory: ProductSubCategory.get(params.id)])

        }
        else {
            render "error"
        }
    }
}