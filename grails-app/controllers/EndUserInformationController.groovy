import grails.converters.JSON

class EndUserInformationController {
    static allowedMethods = [save: 'POST',login: 'POST',checkEmail: 'POST',checkLogin: 'POST']
    def endUserInformationService

    def register() {

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
}catch (Exception e){

        }
    }

}