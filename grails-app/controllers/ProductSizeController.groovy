import org.springframework.dao.DataIntegrityViolationException

class ProductSizeController extends BaseController{
    static allowedMethods = [save: 'POST']

    def list() {
        try {
            def productSizeList = ProductSize.list()
            render(view: "list", model: [productSizeList: productSizeList])
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")
        }
    }

    def create() {

    }

    def save() {
        try {
            if (!params.id) {
                def productSizeInstance = new ProductSize()
                productSizeInstance.sizeName = params.sizeName
                productSizeInstance.statusShow = params.statusShow as boolean
                productSizeInstance.sizeDetails = params.sizeDetails
                productSizeInstance.save(flush: true)
                redirect(action: "show", id: productSizeInstance.id)
            } else {
                def productSizeInstance = ProductSize.get(params.id)
                if (productSizeInstance) {
                    productSizeInstance.sizeName = params.sizeName
                    productSizeInstance.statusShow = params.statusShow as boolean
                    productSizeInstance.sizeDetails = params.sizeDetails
                    productSizeInstance.save(flush: true)
                    redirect(action: "show", id: productSizeInstance.id)
                } else {
                    redirect(action: "notfound", controller: "errorPage")

                }
            }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")
        }
    }

    def show(Long id) {
        try {
            def productSizeInstance = ProductSize.get(id)
            if (productSizeInstance) {
                [productSizeInstance: productSizeInstance]
            } else {
                redirect(action: "list")
            }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }

    def edit() {
        try {
            def productSizeInstance = ProductSize.get(params.id)

            if (productSizeInstance) {
                [productSizeInstance: productSizeInstance]
            } else {
                redirect(action: "list")
            }
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }

    def delete() {
        try {
            def productSizeInstance = ProductSize.get(params.id)


            if (productSizeInstance) {

                productSizeInstance.delete(flush: true)
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
