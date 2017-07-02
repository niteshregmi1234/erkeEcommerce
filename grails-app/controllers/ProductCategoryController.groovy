

class ProductCategoryController {

    def list() {
def productCategoryList=ProductCategory.list()
        render(view: "list",model: [productCategoryList:productCategoryList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productCategoryInstance=new ProductCategory()
            productCategoryInstance.categoryName=params.categoryName
            productCategoryInstance.statusShow=params.statusShow as boolean
            productCategoryInstance.save(flush: true)
            redirect(action: "show" ,id:productCategoryInstance.id)
        }
        else{
            def productCategoryInstance=ProductCategory.get(params.id)

            productCategoryInstance.categoryName=params.categoryName
            productCategoryInstance.statusShow=params.statusShow as boolean
            productCategoryInstance.save(flush: true)

            redirect(action: "show" ,id:productCategoryInstance.id)
        }
    }
    def show(Long id){
        def productCategoryInstance=ProductCategory.get(id)

        if(productCategoryInstance){
            [productCategoryInstance:productCategoryInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productCategoryInstance=ProductCategory.get(params.id)

        if(productCategoryInstance){
            [productCategoryInstance:productCategoryInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productCategoryInstance=ProductCategory.get(params.id)



        if(productCategoryInstance) {
            try{
                productCategoryInstance.delete(flush: true)
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
