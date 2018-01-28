import grails.converters.JSON

class EndUserInformationController {
    static allowedMethods = [save: 'POST',login: 'POST',checkEmail: 'POST',checkLogin: 'POST',checkPassword: 'POST',editEndUserPassword:'POST' ,editEndUserPersonalDetails: 'POST']
    def endUserInformationService
def editEndUserPersonalDetails(){
    try{
        def status=false
        def obj= JSON.parse(params.array)
        if(session.endUser){
            session.endUser.firstName =obj[0]
            session.endUser.lastName =obj[1]
            session.endUser.phone =obj[2]
            session.endUser.address =obj[3]
            session.endUser.city =obj[4]
            status=true
            render status
        }
        else{
            render status
        }
    }
    catch (Exception e){

        render "serverError"
    }
}
    def checkPassword(){
        try{
        def status=false
        if (session.endUser) {
            status = endUserInformationService.decryptPassword(params.oldPassword, session.endUser.password)
            render status
        }
            else{

        }
        }
        catch (Exception e){

        }
    }

def editEndUserPassword(){
    try{
        def status=false
    if(session.endUser){
    session.endUser.password = endUserInformationService.encryptedPassword(params.newPassword)
        status=true
        render status
    }
        else{
        render status
    }
    }
    catch (Exception e){

render "serverError"
    }
}
def myProfile(){
    try{
if(session.endUser){
  render(view: "myProfile")
}
    else{
    redirect(action: "userHome",controller:"endUser" )
}
    }
    catch (Exception e){

    }
}
    def register() {

    }
    def logout(){
        try{
        if(session.endUser){
        session.endUser=null
            render "logoutSuccess"
        }
        else{
            render "logoutUnSuccess"
        }
        }
        catch (Exception e){

        }
    }

    def save() {
        try{
        def endUserInformationInstance = new EndUserInformation()
        endUserInformationInstance.firstName = params.first_name
        endUserInformationInstance.lastName = params.last_name
        endUserInformationInstance.phone = params.phone
        endUserInformationInstance.address = params.address
        endUserInformationInstance.city = params.city
        endUserInformationInstance.email = params.email
        endUserInformationInstance.password = endUserInformationService.encryptedPassword(params.password)
        if (endUserInformationInstance.validate()) {
            endUserInformationInstance.save(flush: true)
            flash.message1="you are successfully registered"
            redirect(action: "register")
        } else {
            flash.message = "Please don't enter already used email "
            redirect(action: "register")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }

    def login() {
        flash.message="successfully logged in."
redirect(action: "allProducts",controller: "endUser")

    }

    def checkEmail() {
        try{
        def isAvailable = false
        def endUserInstance = EndUserInformation.findByEmail(params.email)
        if (!endUserInstance) {
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

    def checkLogin() {
        try{
        def obj= JSON.parse(params.array)

        def endUserInformationInstance = EndUserInformation.findByEmail(obj[0])
       def status=false
        if (endUserInformationInstance) {
            status = endUserInformationService.decryptPassword(obj[1], endUserInformationInstance.password)
        }
        if(status==true){
            session.endUser = endUserInformationInstance

        }
          render status
}
        catch (Exception e){

        }
    }

}