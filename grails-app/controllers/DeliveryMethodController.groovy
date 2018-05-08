import org.springframework.dao.DataIntegrityViolationException

class DeliveryMethodController extends BaseController{
static  allowedMethods = [save: 'POST']
    def list() {
        try {
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
                def deliveryMethodList = DeliveryMethod.list()
                render(view: "list", model: [deliveryMethodList: deliveryMethodList])
            }
else{
                redirect(action: "adminLoginForm",controller: "login")
            }
        }}        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){
        if(session.adminUser){
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
render(view: "create")
    }
        else{
            redirect(action: "notfound",controller: "errorPage")

        }}
    }
    def save(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
                if(!params.id){
            def deliveryMethodInstance=new DeliveryMethod()
            deliveryMethodInstance.briefDescribe=params.briefDescribe
            deliveryMethodInstance.detailDescribe=params.detailDescribe
            deliveryMethodInstance.isShowStatus=params.isShowStatus as byte
            deliveryMethodInstance.save(flush: true)
            redirect(action: "show" ,id:deliveryMethodInstance.id)
        }
        else{
            def deliveryMethodInstance=DeliveryMethod.get(params.id)
            if(deliveryMethodInstance) {
                deliveryMethodInstance.briefDescribe = params.briefDescribe
                deliveryMethodInstance.detailDescribe = params.detailDescribe
                deliveryMethodInstance.isShowStatus=params.isShowStatus as byte
                deliveryMethodInstance.save(flush: true)
                redirect(action: "show", id: deliveryMethodInstance.id)
            }
        else {
           redirect(action: "notfound",controller: "errorPage")
        }}}
            else{
                redirect(action: "adminLoginForm",controller: "login")
            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }


    def show(Long id){
        try {
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
                def deliveryMethodInstance=DeliveryMethod.get(id)
                if(deliveryMethodInstance){
            [deliveryMethodInstance:deliveryMethodInstance]}
        else{
            redirect(action: "list")
        }       }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
catch (Exception e){
    redirect(action: "notfound",controller: "errorPage")

}
    }
    def edit(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
                def deliveryMethodInstance=DeliveryMethod.get(params.id)
            if(deliveryMethodInstance){
            [deliveryMethodInstance:deliveryMethodInstance]
        }
        else{
            redirect(action: "list")
        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")
            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD") {
                def deliveryMethodInstance=DeliveryMethod.get(params.id)
        if(deliveryMethodInstance) {

            deliveryMethodInstance.delete(flush: true)
                flash.message="Successfully deleted."
            redirect(action: "list")


        }
        else{
            flash.message="Unable to delete the already deleted item."
            redirect(action: "list")


        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
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
