

class LoginController {
    static allowedMethods = [login: 'POST']
    def endUserInformationService

    def adminLoginForm() {
        render(view: "adminLogin")
    }
    def login(){
        try{
        def adminUserInformationInstance = AdminUserInformation.findByEmail(params.email)
        def status=false
        if (adminUserInformationInstance) {
            status = endUserInformationService.decryptPassword(params.password, adminUserInformationInstance.password)
        }
        if(status==true){
            session.adminUser = adminUserInformationInstance
            flash.message="successfully logged in."
            redirect(action: "adminHome",controller: "adminHome")
        }
        else{
            flash.messageError="email or password does not exist"
            redirect(action: "adminLoginForm")
        }

    }
        catch (Exception e){
            redirect(action: "notfound" ,controller: "errorPage")
        }
    }

}
