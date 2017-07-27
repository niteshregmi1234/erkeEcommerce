

class PaymentMethodController {

    def list() {
        def paymentMethodList=PaymentMethod.list()
        render(view: "list",model: [paymentMethodList:paymentMethodList])
    }
    def create(){

    }
    def save(){
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
            paymentMethodInstance.briefDescribe=params.briefDescribe
            paymentMethodInstance.detailDescribe=params.detailDescribe
            paymentMethodInstance.isShowStatus=params.isShowStatus
            paymentMethodInstance.save(flush: true)
            redirect(action: "show" ,id:paymentMethodInstance.id)
        }
    }


    def show(Long id){
        def paymentMethodInstance=PaymentMethod.get(id)

        if(paymentMethodInstance){
            [paymentMethodInstance:paymentMethodInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def paymentMethodInstance=PaymentMethod.get(params.id)

        if(paymentMethodInstance){
            [paymentMethodInstance:paymentMethodInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def paymentMethodInstance=PaymentMethod.get(params.id)



        if(paymentMethodInstance) {
            try{

                paymentMethodInstance.delete(flush: true)
                flash.message="Successfully deleted."
            }
            catch (Exception e){
                flash.message="Sorry! cannot delete this data. It is used as foreign key in another table."
            }
        }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")

    }

}
