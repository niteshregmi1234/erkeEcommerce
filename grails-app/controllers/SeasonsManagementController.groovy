
class SeasonsManagementController {
static allowedMethods = [save: 'POST']
    def save() {
        try{
        def seasonsManagementInstance=SeasonManagement.get(params.id)
        if(seasonsManagementInstance){
        seasonsManagementInstance.seasons=Seasons.get(params.season)
        seasonsManagementInstance.save(flush: true)
        redirect(action: "show",id:seasonsManagementInstance.id)}
        else{
            redirect(action: "notfound",controller: "errorPage")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def show(Long id){
        try{
        def seasonsManagementInstance=SeasonManagement.get(id)
if(seasonsManagementInstance) {
    [seasonsManagementInstance: seasonsManagementInstance]
}
        else{
    redirect(action: "notfound",controller: "errorPage")

}}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
}

    def edit(){
        try {

        def seasonsManagementInstance=SeasonManagement.get(params.id)
if(seasonsManagementInstance){
        [seasonsManagementInstance:seasonsManagementInstance]
    }
        else {
    redirect(action: "notfound",controller: "errorPage")

}
    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
}
