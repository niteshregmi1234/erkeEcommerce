

class OtherCostsController extends BaseController{
static  allowedMethods = [save: 'POST']


    def save(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def otherCostsInstance=OtherCosts.get(params.otherCostId)
        if(otherCostsInstance){
        otherCostsInstance.shippingAndHandlingPercentage=params.shippingAndHandlingPercentage as int
        otherCostsInstance.taxPercentage=params.taxPercentage as int
        otherCostsInstance.save(flush: true)
            redirect(action: "show")}
        else {
            redirect(action: "notfound", controller: "errorPage")
        }        }
        else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }


    def show(){
        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def otherCostsInstance = OtherCosts.list()[0]

                if (otherCostsInstance) {
                    [otherCostsInstance: otherCostsInstance]
                } else {
                    redirect(action: "notfound", controller: "errorPage")
                }
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }
    def edit(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def otherCostsInstance = OtherCosts.get(params.id)

                if (otherCostsInstance) {
                    [otherCostsInstance: otherCostsInstance]
                } else {
                    redirect(action: "notfound", controller: "errorPage")

                }

            }
        else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

}
