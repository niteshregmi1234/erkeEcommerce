import org.springframework.dao.DataIntegrityViolationException

class ProductColorController extends BaseController{
static allowedMethods = [save: 'POST']
    def list() {
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                    def productColorList = ProductColor.list()
                    render(view: "list", model: [productColorList: productColorList])
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {
        render(view:"create")
        }
        else {
                redirect(action: "adminLoginForm", controller: "login")

            }        }
    }
    def save(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    if (!params.id) {
                        def productColorInstance = new ProductColor()
                        productColorInstance.colorName = params.colorName
                        productColorInstance.statusShow = params.statusShow as byte
                        productColorInstance.save(flush: true)
                        redirect(action: "show", id: productColorInstance.id)
                    } else {
                        def productColorInstance = ProductColor.get(params.id)
                        if (productColorInstance) {
                            productColorInstance.colorName = params.colorName
                            productColorInstance.statusShow = params.statusShow as byte

                            productColorInstance.save(flush: true)

                            redirect(action: "show", id: productColorInstance.id)
                        } else {
                            redirect(action: "notfound", controller: "errorPage")

                        }
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }            }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def show(Long id){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productColorInstance=ProductColor.get(id)

        if(productColorInstance){
            [productColorInstance:productColorInstance]}
        else{
            redirect(action: "list")
        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def edit(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productColorInstance = ProductColor.get(params.id)

                    if (productColorInstance) {
                        [productColorInstance: productColorInstance]
                    } else {
                        redirect(action: "list")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }            }
    catch (Exception e){
        redirect(action: "notfound",controller: "errorPage")
    }
    }
    def delete() {
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productColorInstance = ProductColor.get(params.id)


        if (productColorInstance) {

            productColorInstance.delete(flush: true)
            flash.message = "Successfully deleted."
        } else {
            flash.message = "Unable to delete the already deleted item."


        }
        redirect(action: "list")
    }
            else{
             redirect(action: "adminLoginForm",controller: "login")
            }
        }}
    catch (DataIntegrityViolationException e) {
        flash.message = "Sorry! cannot delete this data."
        redirect(action: "list")
    }
    catch (Exception e) {
        redirect(action: "notfound", controller: "errorPage")

    }
    }

}
