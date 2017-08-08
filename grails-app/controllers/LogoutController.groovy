

class LogoutController {

    def logout(){
        try{
        if(session.adminUser){
        session.adminUser=null
        flash.message="successfully logged out"
        redirect(action: "adminLoginForm",controller: "login")
    }
    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }


}
