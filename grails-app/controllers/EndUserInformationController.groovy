class EndUserInformationController {
    static allowedMethods = [save: 'POST',login: 'POST',checkEmail: 'POST',checkLogin: 'POST',checkPassword: 'POST',editEndUserPassword:'POST' ,editEndUserPersonalDetails: 'POST']
    def endUserInformationService
def editEndUserPersonalDetails(){
    try{
  def status=endUserInformationService.editEndUserPersonalDetails(params,session.endUser)
    render status}
    catch (Exception e){

    }
}
    def checkPassword(){
        try {
            def status = endUserInformationService.checkPassword(params, session.endUser)
            render status
        }
        catch (Exception e){

        }
    }

def editEndUserPassword(){
    try{
  def status=endUserInformationService.editEndUserPassword(params,session.endUser)
    render status}
    catch (Exception e){

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
        def message=endUserInformationService.saveEndUser(params)
        if(message=="you are successfully registered"){
            flash.message1=message
            redirect(action: "register")
        }
        else if(message=="Please don't enter already used email "){
            flash.message=message
            redirect(action: "register")
        }}
        catch (Exception e){

        }
    }

    def login() {
        flash.message="successfully logged in."
redirect(action: "allProducts",controller: "endUser")
    }

    def checkEmail() {
        try{
            def isAvailable=endUserInformationService.checkEmail(params)
                render(contentType: 'text/json') {
            [
                    "valid": isAvailable,
            ]
        }
        }
        catch (Exception e){

        }
    }

    def checkLogin() {
        try{
        def totalArray=endUserInformationService.checkLogin(params)
        if(totalArray[1]==true){
            session.endUser = totalArray[0] as EndUserInformation

        }
          render totalArray[1]
}
        catch (Exception e){

        }
    }
}