import org.springframework.dao.DataIntegrityViolationException

class ProductSubCategorySpecifyController extends BaseController{
def productService
    static allowedMethods = [save: 'POST']
    def list() {
        try {
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productSubCategorySpecifyList = ProductSubCategorySpecify.list()
                    render(view: "list", model: [productSubCategorySpecifyList: productSubCategorySpecifyList])
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
        render(view: "create")
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
                        def productSubCategorySpecifyInstance = new ProductSubCategorySpecify()
                        productSubCategorySpecifyInstance.specificationName = params.specificationName
                        productSubCategorySpecifyInstance.urlName = productService.convertToOriginalUrl(productSubCategorySpecifyInstance.specificationName)
                        productSubCategorySpecifyInstance.save(flush: true)
                        redirect(action: "show", id: productSubCategorySpecifyInstance.id)
                    } else {
                        def productSubCategorySpecifyInstance = ProductSubCategorySpecify.get(params.id)
                        if (productSubCategorySpecifyInstance) {
                            productSubCategorySpecifyInstance.specificationName = params.specificationName
                            productSubCategorySpecifyInstance.urlName = productService.convertToOriginalUrl(productSubCategorySpecifyInstance.specificationName)
                            productSubCategorySpecifyInstance.save(flush: true)
                            redirect(action: "show", id: productSubCategorySpecifyInstance.id)
                        } else {
                            redirect(action: "notfound", controller: "errorPage")
                        }
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }

            }        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def show(Long id){
        try{
            if(session.adminUser){

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productSubCategorySpecifyInstance=ProductSubCategorySpecify.get(id)

        if(productSubCategorySpecifyInstance){
            [productSubCategorySpecifyInstance:productSubCategorySpecifyInstance]}
        else{
            redirect(action: "list")
        }}
            else {
                    redirect(action: "adminLoginForm", controller: "login")

                }            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productSubCategorySpecifyInstance = ProductSubCategorySpecify.get(params.id)

                if (productSubCategorySpecifyInstance) {
                    [productSubCategorySpecifyInstance: productSubCategorySpecifyInstance]
                } else {
                    redirect(action: "list")
                }
            }
        else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

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
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (DataIntegrityViolationException e){
            flash.message="Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch ( Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }

}
