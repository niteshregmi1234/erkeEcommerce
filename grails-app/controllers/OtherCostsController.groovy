

class OtherCostsController {
static  allowedMethods = [save: 'POST']


    def save(){
        try{
        def otherCostsInstance=OtherCosts.get(params.otherCostId)
        if(otherCostsInstance){
        otherCostsInstance.shippingAndHandlingPercentage=params.shippingAndHandlingPercentage as int
        otherCostsInstance.taxPercentage=params.taxPercentage as int
        otherCostsInstance.save(flush: true)
            redirect(action: "show")}
        else{
            redirect(action: "notfound",controller: "errorPage")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }


    def show(){
        try{
        def otherCostsInstance=OtherCosts.list()[0]

        if(otherCostsInstance){
            [otherCostsInstance:otherCostsInstance]}
        else{
            redirect(action: "notfound",controller: "errorPage")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }
    def edit(){
        try{
        def otherCostsInstance=OtherCosts.get(params.id)

        if(otherCostsInstance){
            [otherCostsInstance:otherCostsInstance]
        }
        else{
            redirect(action: "notfound",controller: "errorPage")

        }

    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

}
