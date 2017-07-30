

class StyleController {
    static allowedMethods =[save: 'POST']
    def save() {
        try{
        def styleManagementInstance=StyleManagement.get(params.id)
        if(styleManagementInstance){
        styleManagementInstance.style=Style.get(params.style)
        styleManagementInstance.save(flush: true)
        redirect(action: "show",id:styleManagementInstance.id)}
        else {
            redirect(action: "notfound",controller: "errorPage")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def show(){
        try{
        def styleManagementInstance=StyleManagement.list()[0]
        if(styleManagementInstance){

        [styleManagementInstance:styleManagementInstance]}
        else {
            redirect(action: "notfound",controller: "errorPage")

        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def edit(){
        try{
        def styleManagementInstance=StyleManagement.get(params.id)
if(styleManagementInstance){
        [styleManagementInstance:styleManagementInstance]}
        else{
    redirect(action: "notfound",controller: "errorPage")

}}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
}
