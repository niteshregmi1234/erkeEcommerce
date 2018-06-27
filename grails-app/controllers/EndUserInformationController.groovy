class EndUserInformationController {
    static allowedMethods = [checkSubmit: 'POST' ,checkOldPassword: 'POST',login: 'POST',checkEmail: 'POST',checkLogin: 'POST',checkPassword: 'POST',editEndUserPassword:'POST' ,editEndUserPersonalDetails: 'POST']
    def endUserInformationService
def editPassword(){
  if(session.endUser){
    render(view:"changePassword")
  }
    else{
      render(view: "/errorPage/notfound")
  }
}
    def checkOldPassword(){
        try{
            def isAvailable=endUserInformationService.decryptPassword(params.newPassword, session.endUser.password)
            if(isAvailable){
                render(contentType: 'text/json') {
                    [
                            "valid": false,
                    ]
                }}
            else{
                render(contentType: 'text/json') {
                    [
                            "valid": true,
                    ]
                }
            }
        }
        catch (Exception e){

        }
    }

    def editEndUserPersonalDetails(){
    try{
  endUserInformationService.editEndUserPersonalDetails(params,session.customerDetails)
flash.message="successfully updated your profile"
        redirect(action: "myProfile")
    }
    catch (Exception e){
render(view:"/errorPage/notfound")
    }
}
    def checkSubmit(){
        try {
            def customerPersonalDetails = endUserInformationService.saveCustomerPersonalDetails(params)
            def isAvailable = EndUserInformation.findByEmail(params.email)
            if (!isAvailable) {
                customerPersonalDetails.save(flush: true)
                endUserInformationService.saveEndUser(customerPersonalDetails, params.email, params.password)
                render "successfully registered"
            } else {
                render "already exist email"
            }
        }
        catch (Exception e){

        }
    }

    def checkPassword(){
        try{
            def isAvailable=endUserInformationService.decryptPassword(params.oldPassword, session.endUser.password)
            render(contentType: 'text/json') {
                [
                        "valid": isAvailable,
                ]
            }
        }
        catch (Exception e){

        }
    }

    def editEndUserPassword(){
    try{
  endUserInformationService.editEndUserPassword(params,session.endUser)
       flash.message="password changed successfully"
        redirect(action: "myProfile",controller: "endUserInformation")
    }
    catch (Exception e){

    }
}
def myProfile(){
    try{
if(session.endUser){
    def endUserInstance=session.customerDetails
  [endUserInstance:endUserInstance]
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


    def login() {
        flash.message="successfully logged in."
redirect(action: "allProducts",controller: "endUser")
    }
    def testEmail(){
        try{
            def isAvailable=endUserInformationService.checkEmail(params)
           render isAvailable
        }
        catch (Exception e){

        }
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
session.customerDetails=session.endUser.customerPersonalDetails
        }
          render totalArray[1]
}
        catch (Exception e){

        }
    }
}