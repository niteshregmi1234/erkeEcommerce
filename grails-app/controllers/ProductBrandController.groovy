

class ProductBrandController {

    def list() {
        def productBrandList=ProductBrand.list()
        render(view: "list",model: [productBrandList:productBrandList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productBrandInstance=new ProductBrand()
            productBrandInstance.brandName=params.brandName
            productBrandInstance.statusShow=params.statusShow as boolean
            productBrandInstance.save(flush: true)
            redirect(action: "show" ,id:productBrandInstance.id)
        }
        else{
            def productBrandInstance=ProductBrand.get(params.id)
            productBrandInstance.brandName=params.brandName
            productBrandInstance.statusShow=params.statusShow as boolean
            productBrandInstance.save(flush: true)
            redirect(action: "show" ,id:productBrandInstance.id)
        }
    }
    def show(Long id){
        def productBrandInstance=ProductBrand.get(id)
        if(productBrandInstance){
            [productBrandInstance:productBrandInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productBrandInstance=ProductBrand.get(params.id)

        if(productBrandInstance){
            [productBrandInstance:productBrandInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productBrandInstance=ProductBrand.get(params.id)


        if(productBrandInstance) {
            try{
                productBrandInstance.delete(flush: true)
                flash.message="Successfully deleted."
            }
            catch (Exception e){
                flash.message="Sorry! cannot delete this data. It is used as foreign key in another table."
            }
        }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")

    }

}
