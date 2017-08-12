
/**
 * Created by hemanta on 8/12/17.
 */
class HomeContentController extends BaseController{
static allowedMethods = [save: 'POST']
    def save() {
        try{
            def homeContentInstance=HomeContent.get(params.id)
            if(homeContentInstance){
                homeContentInstance.box1Title=params.box1Title
                homeContentInstance.box2Title=params.box2Title
                homeContentInstance.box3Title=params.box3Title
                homeContentInstance.box1Description=params.box1Description
                homeContentInstance.box2Description=params.box2Description
                homeContentInstance.box3Description=params.box3Description
                homeContentInstance.coverDownImageTitle=params.coverDownImageTitle
                homeContentInstance.coverDownImageDescription=params.coverDownImageDescription
                homeContentInstance.specialBrandImageDescriptionUp=params.specialBrandImageDescriptionUp
                homeContentInstance.specialBrandImageDescriptionDown=params.specialBrandImageDescriptionDown
                homeContentInstance.save(flush: true)
                redirect(action: "show")}
            else{
                print "a"
                redirect(action: "notfound",controller: "errorPage")
            }}
        catch (Exception e){
            print "b"
            redirect(action: "notfound",controller: "errorPage")

        }

    }

    def show(){
        try{
            def homeContentInstance=HomeContent.list()[0]
            if(homeContentInstance){
                render(view: "show",model:[homeContentInstance:homeContentInstance] )

            }
            else{
                redirect(action: "notfound",controller: "errorPage")
            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def edit(){
        try {

            def homeContentInstance=HomeContent.get(params.id)

            if(homeContentInstance){
                [homeContentInstance:homeContentInstance]}
            else{
                redirect(action: "notfound",controller: "errorPage")



            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
}
