import org.springframework.dao.DataIntegrityViolationException

class ProductColorController {
static allowedMethods = [save: 'POST']
    def list() {
        try{
        def productColorList=ProductColor.list()
        render(view: "list",model: [productColorList:productColorList])
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
            def productColorInstance=new ProductColor()
            productColorInstance.colorName=params.colorName
            productColorInstance.statusShow=params.statusShow as boolean
            productColorInstance.save(flush: true)
            redirect(action: "show" ,id:productColorInstance.id)
        }
        else{
            def productColorInstance=ProductColor.get(params.id)
if(productColorInstance){
            productColorInstance.colorName=params.colorName
            productColorInstance.statusShow=params.statusShow as boolean

            productColorInstance.save(flush: true)

            redirect(action: "show" ,id:productColorInstance.id)}
            else{
    redirect(action: "notfound",controller: "errorPage")

}
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def show(Long id){
        try{
        def productColorInstance=ProductColor.get(id)

        if(productColorInstance){
            [productColorInstance:productColorInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def edit(){
        try{
        def productColorInstance=ProductColor.get(params.id)

        if(productColorInstance){
            [productColorInstance:productColorInstance]
        }
        else{
            redirect(action: "list")
        }}
    catch (Exception e){
        redirect(action: "notfound",controller: "errorPage")
    }
    }
    def delete() {
        try{
        def productColorInstance = ProductColor.get(params.id)


        if (productColorInstance) {

            productColorInstance.delete(flush: true)
            flash.message = "Successfully deleted."
        } else {
            flash.message = "Unable to delete the already deleted item."


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
