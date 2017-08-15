import org.springframework.dao.DataIntegrityViolationException

class DeliveryMethodController extends BaseController{
static  allowedMethods = [save: 'POST']
    def list() {
        try{
        def deliveryMethodList=DeliveryMethod.list()
        render(view: "list",model: [deliveryMethodList:deliveryMethodList])}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
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
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }


    def show(Long id){
        try {

        def deliveryMethodInstance=DeliveryMethod.get(id)

        if(deliveryMethodInstance){
            [deliveryMethodInstance:deliveryMethodInstance]}
        else{
            redirect(action: "list")
        }        }
catch (Exception e){
    redirect(action: "notfound",controller: "errorPage")

}
    }
    def edit(){
        try{
        def deliveryMethodInstance=DeliveryMethod.get(params.id)

        if(deliveryMethodInstance){
            [deliveryMethodInstance:deliveryMethodInstance]
        }
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try{

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
        catch (DataIntegrityViolationException e){
            flash.message="Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }

    }

}
