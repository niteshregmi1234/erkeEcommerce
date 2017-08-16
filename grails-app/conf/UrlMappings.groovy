class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {


            }
        }

            "/search/$result"(action: "search",controller: "endUser")
            "/error"(action: "notfound",controller: "errorPage")

            "/result"(action: "result",controller: "endUser")
            "/allProducts"(action: "allProducts",controller: "endUser")
        "/contact"(action: "contact",controller: "endUser")
        "/product"(action: "singleProduct",controller: "endUser")
        "/subCategory/$category/$subCategory"(action: "subCategoryList",controller: "endUser")
        "/category"(action: "allCategoryProducts",controller: "endUser")
        "/specialBrand"(action: "specialBrandProducts",controller: "endUser")
        "/specialSubCategory"(action: "specialSubProducts",controller: "endUser")
        "/season"(action: "upcomingSeasonProducts",controller: "endUser")
        "/about"(action: "about",controller: "endUser")
        "/addCart"(action: "addToCart",controller: "cart")
        "/basket"(action: "cart",controller: "cart")
        "/saveEndUser"(action: "save",controller: "endUserInformation")
        "/register"(action: "register",controller: "endUserInformation")
        "/sendQuery"(action: "placeOrder",controller: "checkOut")
        "/login-YarsaaAnojAndBikash"(action: "adminLoginForm",controller: "login")
        "/"(action: "userHome",controller: "endUser")
        "500"(view:'/error')
        "404"(controller:"errorPage",action:"notfound")
        "405"(controller: "errorPage",action: "notfound")
	}
}