import org.springframework.dao.DataIntegrityViolationException

class AdminUserInformationController extends BaseController{
    static  allowedMethods = [save: 'POST',checkEmail: 'POST' ]
    def endUserInformationService
    def checkEmail() {
        try{
            if(session.adminUser){
            if(session.adminUser.role=="CEO" || session.adminUser.role=="MD"){
            def isAvailable = false
            def adminUserInstance = AdminUserInformation.findByEmail(params.email)
            if (!adminUserInstance) {
                isAvailable = true

            }

            render(contentType: 'text/json') {
                [
                        "valid": isAvailable,
                ]
            }}
            else{
                redirect(action: "adminLoginForm",controller: "login")
            }
            }}
        catch (Exception e){

        }
    }


    def list() {
        try{
            if(session.adminUser){
            if(session.adminUser.role=="CEO" || session.adminUser.role=="MD") {

                def adminUserList = AdminUserInformation.list()
                render(view: "list", model: [adminUserList: adminUserList])
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }}
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){
        if(session.adminUser){
        if(session.adminUser.role=="CEO" || session.adminUser.role=="MD") {
        render(view: "create")
        }
        else{
            redirect(action: "adminLoginForm",controller: "login")

        }}

    }
    def save(){
        try{
            if(session.adminUser) {
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {

                    if (!params.id) {
                        def adminUserInstance = new AdminUserInformation()
                        adminUserInstance.firstName = params.firstName
                        adminUserInstance.lastName = params.lastName
                        adminUserInstance.email = params.email
                        adminUserInstance.password = endUserInformationService.encryptedPassword(params.password)
                        adminUserInstance.role = params.role
                        if (adminUserInstance.validate()) {

                            adminUserInstance.save(flush: true)
                            redirect(action: "show", id: adminUserInstance.id)
                        } else {
                            flash.message = "Please don't enter already used email "
                            redirect(action: "create")
                        }
                    } else {
                        def adminUserInstance = AdminUserInformation.get(params.id)
                        if (AdminUserInformation) {

                            if (params.password != '') {
                                adminUserInstance.firstName = params.firstName
                                adminUserInstance.lastName = params.lastName
                                adminUserInstance.password = endUserInformationService.encryptedPassword(params.password)
                                adminUserInstance.role = params.role
                                adminUserInstance.save(flush: true)

                            } else {
                                adminUserInstance.firstName = params.firstName
                                adminUserInstance.lastName = params.lastName
                                adminUserInstance.role = params.role
                                adminUserInstance.save(flush: true)
                            }
                            redirect(action: "show", id: adminUserInstance.id)
                        } else {
                            redirect(action: "notfound", controller: "errorPage")
                        }
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }
            }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }


    def show(Long id){
        try {
            if(session.adminUser){
            if(session.adminUser.role=="CEO" || session.adminUser.role=="MD") {

            def adminUserInstance=AdminUserInformation.get(id)

            if(adminUserInstance){
                [adminUserInstance:adminUserInstance]}
            else {
                redirect(action: "list")
            }
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")
            }}
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
            if(session.adminUser){
            if(session.adminUser.role=="CEO" || session.adminUser.role=="MD") {

                def adminUserInstance=AdminUserInformation.get(params.id)

            if(adminUserInstance){
                [adminUserInstance:adminUserInstance]
            }
            else{
                redirect(action: "list")
            }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }}
            }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try{
            if(session.adminUser){
            if(session.adminUser.role=="CEO" || session.adminUser.role=="MD") {

if(AdminUserInformation.list().size()>1){
            def adminUserInstance=AdminUserInformation.get(params.id)
            if(adminUserInstance) {

                adminUserInstance.delete(flush: true)
                flash.message="Successfully deleted."
                redirect(action: "list")


            }
            else{
                flash.message="Unable to delete the already deleted item."
                redirect(action: "list")


            }}
            else{
    flash.message="Sorry! cannot delete the last admin information."
    redirect(action: "list")

}}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }}
        }
        catch (DataIntegrityViolationException e){
            flash.message="Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }

    }

}
