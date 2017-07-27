

class OtherCostsController {
static  allowedMethods = [save: 'POST']


    def save(){


        def otherCostsInstance=OtherCosts.get(params.otherCostId)
        otherCostsInstance.shippingAndHandlingPercentage=params.shippingAndHandlingPercentage as int
        otherCostsInstance.taxPercentage=params.taxPercentage as int
        otherCostsInstance.save(flush: true)
            redirect(action: "show" ,id:otherCostsInstance.id)
    }


    def show(Long id){
        def otherCostsInstance=OtherCosts.get(id)

        if(otherCostsInstance){
            [otherCostsInstance:otherCostsInstance]}

    }
    def edit(){
        def otherCostsInstance=OtherCosts.get(params.id)

        if(OtherCosts){
            [otherCostsInstance:otherCostsInstance]
        }

    }

}
