class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
"/"(action: "userHome",controller: "endUser")
//        "/"(view:"/index")
        "500"(view:'/error')
	}
}
