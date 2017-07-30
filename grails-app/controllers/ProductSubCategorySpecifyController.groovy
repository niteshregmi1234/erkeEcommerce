import org.springframework.dao.DataIntegrityViolationException

class ProductSubCategorySpecifyController {
static allowedMethods = [save: 'POST']
    def list() {
        try{
        def productSubCategorySpecifyList=ProductSubCategorySpecify.list()
        render(view: "list",model: [productSubCategorySpecifyList:productSubCategorySpecifyList])}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){
            def productSubCategorySpecifyInstance=new ProductSubCategorySpecify()
            productSubCategorySpecifyInstance.specificationName=params.specificationName


            productSubCategorySpecifyInstance.save(flush: true)
            redirect(action: "show" ,id:productSubCategorySpecifyInstance.id)
        }
        else{
            def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(params.id)
            if(productSubCategorySpecifyInstance){
            productSubCategorySpecifyInstance.specificationName=params.specificationName


            productSubCategorySpecifyInstance.save(flush: true)

            redirect(action: "show" ,id:productSubCategorySpecifyInstance.id)
        }
            else {
                redirect(action: "notfound",controller: "errorPage")
            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def show(Long id){
        try{
        def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(id)

        if(productSubCategorySpecifyInstance){
            [productSubCategorySpecifyInstance:productSubCategorySpecifyInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
        def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(params.id)

        if(productSubCategorySpecifyInstance){
            [productSubCategorySpecifyInstance:productSubCategorySpecifyInstance]
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

            def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(params.id)


        if(productSubCategorySpecifyInstance) {
                productSubCategorySpecifyInstance.delete(flush: true)
                flash.message="Successfully deleted."
            }

        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")

    }
        catch (DataIntegrityViolationException e){
            flash.message="Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch ( Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }

}
