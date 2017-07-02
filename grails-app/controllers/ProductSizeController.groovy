

class ProductSizeController {

    def list() {
        def productSizeList=ProductSize.list()
        render(view: "list",model: [productSizeList:productSizeList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productSizeInstance=new ProductSize()
            productSizeInstance.sizeName=params.sizeName
            productSizeInstance.statusShow=params.statusShow as boolean
            productSizeInstance.save(flush: true)
            redirect(action: "show" ,id:productSizeInstance.id)
        }
        else{
            def productSizeInstance=ProductSize.get(params.id)

            productSizeInstance.sizeName=params.sizeName
            productSizeInstance.statusShow=params.statusShow as boolean

            productSizeInstance.save(flush: true)
            redirect(action: "show" ,id:productSizeInstance.id)
        }
    }
    def show(Long id){
        def productSizeInstance=ProductSize.get(id)


        if(productSizeInstance){
            [productSizeInstance:productSizeInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productSizeInstance=ProductSize.get(params.id)

        if(productSizeInstance){
            [productSizeInstance:productSizeInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productSizeInstance=ProductSize.get(params.id)


        if(productSizeInstance) {
            try{
                productSizeInstance.delete(flush: true)
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
