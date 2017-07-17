

class ProductSubCategorySpecifyController {

    def list() {
        def productSubCategorySpecifyList=ProductSubCategorySpecify.list()
        render(view: "list",model: [productSubCategorySpecifyList:productSubCategorySpecifyList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productSubCategorySpecifyInstance=new ProductSubCategorySpecify()
            productSubCategorySpecifyInstance.specificationName=params.specificationName


            productSubCategorySpecifyInstance.save(flush: true)
            redirect(action: "show" ,id:productSubCategorySpecifyInstance.id)
        }
        else{
            def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(params.id)
            productSubCategorySpecifyInstance.specificationName=params.specificationName


            productSubCategorySpecifyInstance.save(flush: true)

            redirect(action: "show" ,id:productSubCategorySpecifyInstance.id)
        }
    }

    def show(Long id){
        def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(id)

        if(productSubCategorySpecifyInstance){
            [productSubCategorySpecifyInstance:productSubCategorySpecifyInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(params.id)

        if(productSubCategorySpecifyInstance){
            [productSubCategorySpecifyInstance:productSubCategorySpecifyInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(params.id)


        if(productSubCategorySpecifyInstance) {
            try{
                productSubCategorySpecifyInstance.delete(flush: true)
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
