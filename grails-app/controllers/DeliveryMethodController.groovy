

class DeliveryMethodController {

    def list() {
        def deliveryMethodList=DeliveryMethod.list()
        render(view: "list",model: [deliveryMethodList:deliveryMethodList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def deliveryMethodInstance=new DeliveryMethod()
            deliveryMethodInstance.briefDescribe=params.briefDescribe
            deliveryMethodInstance.detailDescribe=params.detailDescribe
            deliveryMethodInstance.isShowStatus=params.isShowStatus

            deliveryMethodInstance.save(flush: true)
            redirect(action: "show" ,id:deliveryMethodInstance.id)
        }
        else{
            def deliveryMethodInstance=DeliveryMethod.get(params.id)
            deliveryMethodInstance.briefDescribe=params.briefDescribe
            deliveryMethodInstance.detailDescribe=params.detailDescribe
            deliveryMethodInstance.isShowStatus=params.isShowStatus
            deliveryMethodInstance.save(flush: true)
            redirect(action: "show" ,id:deliveryMethodInstance.id)
        }
    }


    def show(Long id){
        def deliveryMethodInstance=DeliveryMethod.get(id)

        if(deliveryMethodInstance){
            [deliveryMethodInstance:deliveryMethodInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def deliveryMethodInstance=DeliveryMethod.get(params.id)

        if(deliveryMethodInstance){
            [deliveryMethodInstance:deliveryMethodInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def deliveryMethodInstance=DeliveryMethod.get(params.id)



        if(deliveryMethodInstance) {
            try{

                deliveryMethodInstance.delete(flush: true)
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
