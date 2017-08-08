class BaseController {

    def beforeInterceptor=[action: this.&auth]
//    def beforeInterceptor=[action: this.&auth,except:"adminLoginForm"]
    def auth(){
        if(!session.adminUser){
            redirect(action:"adminLoginForm",controller: "login")
        }}

}
