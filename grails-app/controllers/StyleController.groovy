

class StyleController {
    def save() {
        def styleManagementInstance=StyleManagement.get(params.id)
        styleManagementInstance.style=Style.get(params.style)
        styleManagementInstance.save(flush: true)
        redirect(action: "show",id:styleManagementInstance.id)
    }

    def show(Long id){
        def styleManagementInstance=StyleManagement.get(id)

        [styleManagementInstance:styleManagementInstance]}

    def edit(){
        def styleManagementInstance=StyleManagement.get(params.id)

        [styleManagementInstance:styleManagementInstance]
    }
}
