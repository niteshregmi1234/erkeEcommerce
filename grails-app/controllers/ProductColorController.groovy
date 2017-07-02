

class ProductColorController {

    def list() {
        def productColorList=ProductColor.list()
        render(view: "list",model: [productColorList:productColorList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productColorInstance=new ProductColor()
            productColorInstance.colorName=params.colorName
            productColorInstance.statusShow=params.statusShow as boolean
            productColorInstance.save(flush: true)
            redirect(action: "show" ,id:productColorInstance.id)
        }
        else{
            def productColorInstance=ProductColor.get(params.id)

            productColorInstance.colorName=params.colorName
            productColorInstance.statusShow=params.statusShow as boolean

            productColorInstance.save(flush: true)

            redirect(action: "show" ,id:productColorInstance.id)
        }
    }
    def show(Long id){
        def productColorInstance=ProductColor.get(id)

        if(productColorInstance){
            [productColorInstance:productColorInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productColorInstance=ProductColor.get(params.id)

        if(productColorInstance){
            [productColorInstance:productColorInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productColorInstance=ProductColor.get(params.id)


        if(productColorInstance) {
            try{
                productColorInstance.delete(flush: true)
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
