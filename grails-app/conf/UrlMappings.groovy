class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {


            }
        }
        "/$aidsDescribe/_"(action: "ad",controller: "endUser")
        "/"(action: "userHome",controller: "endUser")
            "/error"(action: "notfound",controller: "errorPage")
        "/search"(action: "result",controller: "endUser")
        "/$brandNames/ "(action: "topBrand",controller: "endUser")
        "/black-horse-goldstar"(action: "nepaliProducts",controller: "endUser")
            "/all-brands"(action: "allBrands",controller: "endUser")
            "/topSales"(action: "topSales",controller: "endUser")
            "/latest"(action: "latestProducts",controller: "endUser")
        "/store"(action: "allProducts",controller: "endUser")
        "/contact"(action: "contact",controller: "endUser")
        "/detail-$specificationName"(action: "singleProduct",controller: "endUser")
        "/$category/$subCategorySpecify/$subCategory/ "(action: "subCategoryList",controller: "endUser")
        "/$category/$subCategorySpecify/ "(action: "specifiedProducts",controller: "endUser")
        "/$category/"(action: "allCategoryProducts",controller: "endUser")
        "/all-$subCategory/ "(action: "subCategory",controller: "endUser")
        "/season"(action: "upcomingSeasonProducts",controller: "endUser")
        "/about"(action: "about",controller: "endUser")
        "/addCart"(action: "addToCart",controller: "cart")
        "/cart"(action: "cart",controller: "cart")
        "/saveEndUser"(action: "save",controller: "endUserInformation")
        "/register"(action: "register",controller: "endUserInformation")
            "/my-profile"(action: "myProfile",controller: "endUserInformation")
            "/change-password"(action: "editPassword",controller: "endUserInformation")
            "/checkout"(action: "checkout",controller: "cart")

        "/sendQuery"(action: "placeOrder",controller: "checkOut")
        "/control-panel"(action: "adminLoginForm",controller: "login")
        "500"(controller:"errorPage",action:"notfound")
        "404"(controller:"errorPage",action:"notFoundUrl")
        "405"(controller: "errorPage",action: "notfound")
	}
}