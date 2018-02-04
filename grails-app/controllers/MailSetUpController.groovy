

class MailSetUpController {
static allowedMethods = [save: 'POST']
    def save() {
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mailSetUpInstance=MailSetUp.get(params.id)
            if(mailSetUpInstance){
                                mailSetUpInstance.toEmail=params.toEmail

                mailSetUpInstance.save(flush: true)
                redirect(action: "show")}
            else{
                print "a"
                redirect(action: "notfound",controller: "errorPage")
            }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }
    def show(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mailSetUpInstance = MailSetUp.list()[0]
                if (mailSetUpInstance) {
                    render(view: "show", model: [mailSetUpInstance: mailSetUpInstance])

                } else {
                    redirect(action: "notfound", controller: "errorPage")
                }
            }
        else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def edit(){
        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mailSetUpInstance = MailSetUp.get(params.id)

                if (mailSetUpInstance) {
                    [mailSetUpInstance: mailSetUpInstance]
                } else {
                    redirect(action: "notfound", controller: "errorPage")


                }
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
