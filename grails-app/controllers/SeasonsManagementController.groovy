
class SeasonsManagementController {

    def save() {
        def seasonsManagementInstance=SeasonManagement.get(params.id)
        seasonsManagementInstance.seasons=Seasons.get(params.season)
        seasonsManagementInstance.save(flush: true)
        redirect(action: "show",id:seasonsManagementInstance.id)
    }

    def show(Long id){
        def seasonsManagementInstance=SeasonManagement.get(id)

        [seasonsManagementInstance:seasonsManagementInstance]}

    def edit(){
        def seasonsManagementInstance=SeasonManagement.get(params.id)

        [seasonsManagementInstance:seasonsManagementInstance]
    }
}
