import org.springframework.dao.DataIntegrityViolationException

class ProductBrandController extends BaseController{
static allowedMethods = [save: 'POST']
    def list() {
        try{
        def productBrandList=ProductBrand.list()
        render(view: "list",model: [productBrandList:productBrandList])
    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){
            def productBrandInstance=new ProductBrand()
            productBrandInstance.brandName=params.brandName
            productBrandInstance.statusShow=params.statusShow as byte
            productBrandInstance.brandDescription=params.brandDescription

            productBrandInstance.save(flush: true)
            redirect(action: "show" ,id:productBrandInstance.id)
        }
        else{
            def productBrandInstance=ProductBrand.get(params.id)
            if(productBrandInstance){
            productBrandInstance.brandName=params.brandName
            productBrandInstance.statusShow=params.statusShow as byte
                productBrandInstance.brandDescription=params.brandDescription

                productBrandInstance.save(flush: true)
            redirect(action: "show" ,id:productBrandInstance.id)
        }
            else{
                redirect(action: "notfound",controller: "errorPage")

            }
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def show(Long id){
        try{
        def productBrandInstance=ProductBrand.get(id)
        if(productBrandInstance){
            [productBrandInstance:productBrandInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
        def productBrandInstance=ProductBrand.get(params.id)

        if(productBrandInstance){
            [productBrandInstance:productBrandInstance]
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
        def productBrandInstance=ProductBrand.get(params.id)


        if(productBrandInstance) {
                productBrandInstance.delete(flush: true)
                flash.message="Successfully deleted."

        }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")

    }
        catch (DataIntegrityViolationException e) {
            flash.message = "Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }


}
