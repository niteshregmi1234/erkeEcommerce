import org.springframework.dao.DataIntegrityViolationException

class PaymentMethodController {
static allowedMethods = [save: 'POST']
    def list() {
        try{
        def paymentMethodList=PaymentMethod.list()
        render(view: "list",model: [paymentMethodList:paymentMethodList])}
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){
            def paymentMethodInstance=new PaymentMethod()
            paymentMethodInstance.briefDescribe=params.briefDescribe
            paymentMethodInstance.detailDescribe=params.detailDescribe
            paymentMethodInstance.isShowStatus=params.isShowStatus

            paymentMethodInstance.save(flush: true)
            redirect(action: "show" ,id:paymentMethodInstance.id)
        }
        else{
            def paymentMethodInstance=PaymentMethod.get(params.id)
            if(paymentMethodInstance){
            paymentMethodInstance.briefDescribe=params.briefDescribe
            paymentMethodInstance.detailDescribe=params.detailDescribe
            paymentMethodInstance.isShowStatus=params.isShowStatus
            paymentMethodInstance.save(flush: true)
            redirect(action: "show" ,id:paymentMethodInstance.id)}
            else{
                redirect(action: "notfound", controller: "errorPage")

            }
        }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }


    def show(Long id){
        try{
        def paymentMethodInstance=PaymentMethod.get(id)

        if(paymentMethodInstance){
            [paymentMethodInstance:paymentMethodInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }

    }
    def edit(){
        try{
        def paymentMethodInstance=PaymentMethod.get(params.id)

        if(paymentMethodInstance){
            [paymentMethodInstance:paymentMethodInstance]
        }
        else{
            redirect(action: "list")
        }}
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }

    }
    def delete(){
        try{
        def paymentMethodInstance=PaymentMethod.get(params.id)



        if(paymentMethodInstance) {

                paymentMethodInstance.delete(flush: true)
                flash.message="Successfully deleted."
            }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")}
        catch (DataIntegrityViolationException e) {
            flash.message = "Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }


}
