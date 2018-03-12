class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {


            }
        }

            "/search/$result"(action: "search",controller: "endUser")
            "/error"(action: "notfound",controller: "errorPage")

            "/result"(action: "result",controller: "endUser")
        "/topBrand"(action: "topBrand",controller: "endUser")
        "/allBrands"(action: "allBrands",controller: "endUser")
            "/topSales"(action: "topSales",controller: "endUser")
            "/latestProducts"(action: "latestProducts",controller: "endUser")

        "/offerBrand"(action: "offerBrand",controller: "endUser")

        "/allProducts"(action: "allProducts",controller: "endUser")
        "/contact"(action: "contact",controller: "endUser")
        "/product"(action: "singleProduct",controller: "endUser")
        "/subCategory/$category/$subCategory"(action: "subCategoryList",controller: "endUser")
        "/specifiedProducts/$category/$subCategorySpecify"(action: "specifiedProducts",controller: "endUser")

        "/category"(action: "allCategoryProducts",controller: "endUser")
        "/specialBrand"(action: "specialBrandProducts",controller: "endUser")
        "/specialSubCategory"(action: "specialSubCategory",controller: "endUser")
        "/$id"(action: "subCategory",controller: "endUser")

        "/season"(action: "upcomingSeasonProducts",controller: "endUser")
        "/about"(action: "about",controller: "endUser")
        "/addCart"(action: "addToCart",controller: "cart")
        "/basket"(action: "cart",controller: "cart")
        "/saveEndUser"(action: "save",controller: "endUserInformation")
        "/register"(action: "register",controller: "endUserInformation")
        "/sendQuery"(action: "placeOrder",controller: "checkOut")
        "/login-YarsaaAnojAndBikash"(action: "adminLoginForm",controller: "login")
        "/"(action: "userHome",controller: "endUser")
        "500"(controller:"errorPage",action:"notfound")
        "404"(controller:"errorPage",action:"notfound")
        "405"(controller: "errorPage",action: "notfound")
	}
}