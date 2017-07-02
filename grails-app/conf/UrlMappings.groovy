class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
"/"(action: "endUserHome",controller: "endUser")
//        "/"(view:"/index")
        "500"(view:'/error')
	}
}
