class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {


            }
        }


//       "/subCategory/$subCategoryId"(controller: "productSubCategory",action: "show")

//        "/login"(controller: 'endUserInformation',action: "login")
        "/testId/$testId"(controller:"imageRender", action: "show")
        "/testIdAll/$id3/$id4"(controller:"imageRender", action: "showNow")
        "/"(action: "userHome",controller: "endUser")
//        "/"(view:"/index")
        "500"(view:'/error')
        "404"(controller:"errorPage",action:"notfound")
        "405"(controller: "errorPage",action: "notfound")
	}
}
