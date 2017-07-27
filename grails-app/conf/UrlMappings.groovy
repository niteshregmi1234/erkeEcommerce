class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {


            }
        }


//       "/subCategory/$subCategoryId"(controller: "productSubCategory",action: "show")

//        "/login"(controller: 'endUserInformation',action: "login")
        "/testId/$testId"(controller:"adminHome", action: "show")
        "/testIdAll/$id3/$id4"(controller:"adminHome", action: "showNow")
        "/"(action: "userHome",controller: "endUser")
//        "/"(view:"/index")
        "500"(view:'/error')
        "404"(controller:"endUser",action:"notfound")
        "405"(controller: "adminHome",action: "error")
	}
}
