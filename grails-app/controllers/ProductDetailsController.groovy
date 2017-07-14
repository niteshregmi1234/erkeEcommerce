

class ProductDetailsController {

    def list() {
        def productDetailsList=ProductDetails.list()
        render(view: "list",model: [productDetailsList:productDetailsList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productDetails=new ProductDetails()
            productDetails.productCategory=ProductCategory.get(params.productCategory)
            productDetails.productSubCategory=ProductSubCategory.get(params.productSubCategory)
            productDetails.productName=params.productName
            productDetails.productBrand=ProductBrand.get(params.productBrand)
            productDetails.price=params.price as float
            productDetails.isSale=params.isSale
            if(productDetails.isSale==true){
                productDetails.discountPercentage=params.discountPercentage as float
            }
            else{
                productDetails.discountPercentage=0
            }
                       productDetails.briefDescription=params.briefDescription
            productDetails.detailDescription=params.detailDescription
            productDetails.save(flush: true)
            redirect(action: "show" ,id:productDetails.id)
        }
        else{
            def productDetails=ProductDetails.get(params.id)
            productDetails.productCategory=ProductCategory.get(params.productCategory)
            productDetails.productSubCategory=ProductSubCategory.get(params.productSubCategory)
            productDetails.productName=params.productName
            productDetails.productBrand=ProductBrand.get(params.productBrand)
            productDetails.price=params.price as float
            productDetails.isSale=params.isSale
            if(productDetails.isSale==true){
                productDetails.discountPercentage=params.discountPercentage as float
            }
            else{
                productDetails.discountPercentage=0
            }
                        productDetails.briefDescription=params.briefDescription
            productDetails.detailDescription=params.detailDescription
            productDetails.save(flush: true)
            redirect(action: "show" ,id:productDetails.id)
        }
    }


    def show(Long id){
        def productDetailsInstance=ProductDetails.get(id)

        if(productDetailsInstance){
            [productDetailsInstance:productDetailsInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productDetailsInstance=ProductDetails.get(params.id)

        if(productDetailsInstance){
            [productDetailsInstance:productDetailsInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productDetailsInstance=ProductDetails.get(params.id)


        if(productDetailsInstance) {
            try{
                productDetailsInstance.delete(flush: true)
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
