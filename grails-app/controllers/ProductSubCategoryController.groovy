

class ProductSubCategoryController {

    def list() {
        def productSubCategoryList=ProductSubCategory.list()
        render(view: "list",model: [productSubCategoryList:productSubCategoryList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productSubCategoryInstance=new ProductSubCategory()
            productSubCategoryInstance.subCategoryName=params.subCategoryName
            productSubCategoryInstance.statusShow=params.statusShow as boolean
            productSubCategoryInstance.save(flush: true)
            redirect(action: "show" ,id:productSubCategoryInstance.id)
        }
        else{
            def productSubCategoryInstance=ProductSubCategory.get(params.id)

            productSubCategoryInstance.subCategoryName=params.subCategoryName
            productSubCategoryInstance.statusShow=params.statusShow as boolean
            productSubCategoryInstance.save(flush: true)

            redirect(action: "show" ,id:productSubCategoryInstance.id)
        }
    }
    def show(Long id){
        def productSubCategoryInstance=ProductSubCategory.get(id)

        if(productSubCategoryInstance){
            [productSubCategoryInstance:productSubCategoryInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productSubCategoryInstance=ProductSubCategory.get(params.id)

        if(productSubCategoryInstance){
            [productSubCategoryInstance:productSubCategoryInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productSubCategoryInstance=ProductSubCategory.get(params.id)


        if(productSubCategoryInstance) {
            try{
                productSubCategoryInstance.delete(flush: true)
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
