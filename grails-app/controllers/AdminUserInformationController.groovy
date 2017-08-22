import org.springframework.dao.DataIntegrityViolationException

class AdminUserInformationController extends BaseController{
    static  allowedMethods = [save: 'POST',checkEmail: 'POST' ]

    def endUserInformationService
    def checkEmail() {
        try{
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
        catch (Exception e){

        }
    }


    def list() {
        try{
            def adminUserList=AdminUserInformation.list()
            render(view: "list",model: [adminUserList:adminUserList])}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
            if(!params.id){
                def adminUserInstance=new AdminUserInformation()
                adminUserInstance.firstName=params.firstName
                adminUserInstance.lastName=params.lastName
                adminUserInstance.email=params.email
                adminUserInstance.password = endUserInformationService.encryptedPassword(params.password)
                if (adminUserInstance.validate()) {

                    adminUserInstance.save(flush: true)
                redirect(action: "show" ,id:adminUserInstance.id)}
                else{
                    flash.message = "Please don't enter already used email "
                    redirect(action: "create")
                }
            }
            else{
                def adminUserInstance=AdminUserInformation.get(params.id)
                if(AdminUserInformation) {
                    print params.password
                    if(params.password!=''){
                    adminUserInstance.password = endUserInformationService.encryptedPassword(params.password)
                        adminUserInstance.save(flush: true)

                    }
                    redirect(action: "show", id: adminUserInstance.id)
                }

                else {
                    redirect(action: "notfound",controller: "errorPage")
                }}}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }


    def show(Long id){
        try {

            def adminUserInstance=AdminUserInformation.get(id)

            if(adminUserInstance){
                [adminUserInstance:adminUserInstance]}
            else{
                redirect(action: "list")
            }        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
            def adminUserInstance=AdminUserInformation.get(params.id)

            if(adminUserInstance){
                [adminUserInstance:adminUserInstance]
            }
            else{
                redirect(action: "list")
            }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try{
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

}
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
