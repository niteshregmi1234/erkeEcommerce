

class LogoutController {

    def logout(){
        try{
        if(session.adminUser){
        session.adminUser=null
        flash.messageSuccess="successfully logged out"
        redirect(action: "adminLoginForm",controller: "login")
    }
            else{
            redirect(action: "adminLoginForm",controller: "login")

        }
    }
        catch (Exception e){

            redirect(action: "notfound",controller: "errorPage")
        }
    }


}
