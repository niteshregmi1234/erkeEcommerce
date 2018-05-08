

class StyleController extends BaseController{
    static allowedMethods =[save: 'POST']
    def save() {
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def styleManagementInstance = StyleManagement.get(params.id)
                    if (styleManagementInstance) {
                        styleManagementInstance.style = Style.get(params.style)
                        styleManagementInstance.save(flush: true)
                        redirect(action: "show", id: styleManagementInstance.id)
                    } else {
                        redirect(action: "notfound", controller: "errorPage")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")
                }
            }        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }

    def show(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def styleManagementInstance = StyleManagement.list()[0]
                    if (styleManagementInstance) {

                        [styleManagementInstance: styleManagementInstance]
                    } else {
                        redirect(action: "notfound", controller: "errorPage")

                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")
                }
            }        }

        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def edit(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def styleManagementInstance = StyleManagement.get(params.id)
                    if (styleManagementInstance) {
                        [styleManagementInstance: styleManagementInstance]
                    } else {
                        redirect(action: "notfound", controller: "errorPage")

                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
}
