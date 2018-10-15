

class SeoOptimizationController extends  BaseController{


    static allowedMethods = [save: 'POST']
    def list() {
        try {
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def seoOptimizationList = SeoOptimization.list()
                    render(view: "list", model: [seoOptimizationList: seoOptimizationList])
                }
                else{
                    redirect(action: "adminLoginForm",controller: "login")

                }
            }}
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }
    def create(){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {
                if(!SeoOptimization.list()){
                    render(view:"create")
                }
                else{
                    redirect(action: "adminHome",controller: "adminHome")
                }
            }
            else {
                redirect(action: "adminLoginForm", controller: "login")

            }        }
    }
    def save(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role=="Content Manager") {

                    if(!params.id){
                      if(!SeoOptimization.list()){
                        def seoOptimizationInstance=new SeoOptimization()
                        seoOptimizationInstance.keywords=params.keywords
                        seoOptimizationInstance.author=params.author
                        seoOptimizationInstance.description=params.description
                        seoOptimizationInstance.robots=params.robots
                          seoOptimizationInstance.googleBots=params.googleBots
                          seoOptimizationInstance.title=params.title

                        seoOptimizationInstance.save(flush: true)
                        redirect(action: "show" ,id:seoOptimizationInstance.id)}
                    }
                    else{
                        def seoOptimizationInstance=SeoOptimization.get(params.id)
                        if(seoOptimizationInstance){
                            seoOptimizationInstance.keywords=params.keywords
                            seoOptimizationInstance.author=params.author
                            seoOptimizationInstance.description=params.description
                            seoOptimizationInstance.robots=params.robots
                            seoOptimizationInstance.googleBots=params.googleBots
                            seoOptimizationInstance.title=params.title
                            seoOptimizationInstance.save(flush: true)

                            redirect(action: "show" ,id:seoOptimizationInstance.id)}
                        else{
                            redirect(action: "notfound", controller: "errorPage")

                        }
                    }}
                else{
                    redirect(action: "adminLoginForm",controller: "login")

                }}
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }


    def show(Long id){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def seoOptimizationInstance=SeoOptimization.get(id)


                    if (seoOptimizationInstance) {
                        [seoOptimizationInstance: seoOptimizationInstance]
                    } else {
                        redirect(action: "list")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }

    }
    def edit(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def seoOptimizationInstance=SeoOptimization.get(params.id)


                    if (seoOptimizationInstance) {
                        [seoOptimizationInstance: seoOptimizationInstance]
                    } else {
                        redirect(action: "list")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }

    }

}
