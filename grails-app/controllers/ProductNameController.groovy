

class ProductNameController {

    def list() {
        def productNameList=ProductName.list()
        render(view: "list",model: [productNameList:productNameList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productNameInstance=new ProductName()
            productNameInstance.productName=params.productName
            productNameInstance.save(flush: true)
            redirect(action: "show" ,id:productNameInstance.id)
        }
        else{
            def productNameInstance=ProductName.get(params.id)
            productNameInstance.productName=params.productName
            productNameInstance.save(flush: true)
            redirect(action: "show" ,id:productNameInstance.id)
        }
    }
    def show(Long id){
        def productNameInstance=ProductName.get(id)
        if(productNameInstance){
            [productNameInstance:productNameInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productNameInstance=ProductName.get(params.id)

        if(productNameInstance){
            [productNameInstance:productNameInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productNameInstance=ProductName.get(params.id)
        if(productNameInstance) {
            try{
                productNameInstance.delete(flush: true)
                flash.message="Successfully deleted."
            }
            catch (Exception e){
                print "error is"+e
                flash.message="Sorry! cannot delete this data. It is used as foreign key in another table."
            }
        }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")

    }
}
