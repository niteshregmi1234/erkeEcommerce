

class MailSetUpController {
static allowedMethods = [save: 'POST']
    def save() {
        try{
            def mailSetUpInstance=MailSetUp.get(params.id)
            if(mailSetUpInstance){
                                mailSetUpInstance.toEmail=params.toEmail

                mailSetUpInstance.save(flush: true)
                redirect(action: "show")}
            else{
                print "a"
                redirect(action: "notfound",controller: "errorPage")
            }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }
    def show(){
        try{
            def mailSetUpInstance=MailSetUp.list()[0]
            if(mailSetUpInstance){
                render(view: "show",model:[mailSetUpInstance:mailSetUpInstance] )

            }
            else{
                redirect(action: "notfound",controller: "errorPage")
            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def edit(){
        try {

            def mailSetUpInstance=MailSetUp.get(params.id)

            if(mailSetUpInstance){
                [mailSetUpInstance:mailSetUpInstance]}
            else{
                redirect(action: "notfound",controller: "errorPage")



            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

}
