import org.springframework.dao.DataIntegrityViolationException

class ProductSizeController extends BaseController{
    static allowedMethods = [save: 'POST']

    def list() {

        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productSizeList = ProductSize.list()
                render(view: "list", model: [productSizeList: productSizeList])
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")
        }
    }

    def create() {
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {
        render(view: "create")
        }
        else {
            redirect(action: "adminLoginForm",controller: "login")

        }
    }

    def save() {
        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                if (!params.id) {
                def productSizeInstance = new ProductSize()
                productSizeInstance.sizeName = params.sizeName
                productSizeInstance.statusShow = params.statusShow as byte
                productSizeInstance.sizeDetails = params.sizeDetails
                productSizeInstance.save(flush: true)
                redirect(action: "show", id: productSizeInstance.id)
            } else {
                def productSizeInstance = ProductSize.get(params.id)
                if (productSizeInstance) {
                    productSizeInstance.sizeName = params.sizeName
                    productSizeInstance.statusShow = params.statusShow as byte
                    productSizeInstance.sizeDetails = params.sizeDetails
                    productSizeInstance.save(flush: true)
                    redirect(action: "show", id: productSizeInstance.id)
                } else {
                    redirect(action: "notfound", controller: "errorPage")

                }
            }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")
        }
    }

    def show(Long id) {
        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productSizeInstance = ProductSize.get(id)
            if (productSizeInstance) {
                [productSizeInstance: productSizeInstance]
            } else {
                redirect(action: "list")
            }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }

    def edit() {
        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productSizeInstance = ProductSize.get(params.id)

            if (productSizeInstance) {
                [productSizeInstance: productSizeInstance]
            } else {
                redirect(action: "list")
            }
        }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }

    def delete() {
        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                def productSizeInstance = ProductSize.get(params.id)


                if (productSizeInstance) {

                    productSizeInstance.delete(flush: true)
                    flash.message = "Successfully deleted."


                } else {
                    flash.message = "Unable to delete the already deleted item."


                }
                redirect(action: "list")
            }
        else{
                redirect(action: "adminLoginForm",controller: "login")
            }
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
