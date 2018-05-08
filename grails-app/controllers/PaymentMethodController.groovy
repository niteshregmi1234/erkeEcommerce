import org.springframework.dao.DataIntegrityViolationException

class PaymentMethodController extends BaseController{
static allowedMethods = [save: 'POST']
    def list() {
        try {
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def paymentMethodList = PaymentMethod.list()
                render(view: "list", model: [paymentMethodList: paymentMethodList])
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }
    def create(){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {
        render(view: "create")
        }
        else {
                redirect(action: "adminLoginForm", controller: "login")

            }        }
    }
    def save(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                if(!params.id){
            def paymentMethodInstance=new PaymentMethod()
            paymentMethodInstance.briefDescribe=params.briefDescribe
            paymentMethodInstance.detailDescribe=params.detailDescribe
            paymentMethodInstance.isShowStatus=params.isShowStatus as byte

            paymentMethodInstance.save(flush: true)
            redirect(action: "show" ,id:paymentMethodInstance.id)
        }
        else{
            def paymentMethodInstance=PaymentMethod.get(params.id)
            if(paymentMethodInstance){
            paymentMethodInstance.briefDescribe=params.briefDescribe
            paymentMethodInstance.detailDescribe=params.detailDescribe
                paymentMethodInstance.isShowStatus=params.isShowStatus as byte

            paymentMethodInstance.save(flush: true)
            redirect(action: "show" ,id:paymentMethodInstance.id)}
            else{
                redirect(action: "notfound", controller: "errorPage")

            }
        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }}
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }


    def show(Long id){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def paymentMethodInstance = PaymentMethod.get(id)

                    if (paymentMethodInstance) {
                        [paymentMethodInstance: paymentMethodInstance]
                    } else {
                        redirect(action: "list")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }

    }
    def edit(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def paymentMethodInstance = PaymentMethod.get(params.id)

                    if (paymentMethodInstance) {
                        [paymentMethodInstance: paymentMethodInstance]
                    } else {
                        redirect(action: "list")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }

    }
    def delete(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def paymentMethodInstance=PaymentMethod.get(params.id)



        if(paymentMethodInstance) {

                paymentMethodInstance.delete(flush: true)
                flash.message="Successfully deleted."
            }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")}
            else{
redirect(action: "adminLoginForm",controller: "login")
            }
        }}
        catch (DataIntegrityViolationException e) {
            flash.message = "Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }


}
