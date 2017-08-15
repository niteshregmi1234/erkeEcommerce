
import org.springframework.dao.DataIntegrityViolationException
class ProductDetailsController extends BaseController{
static allowedMethods = [save: 'POST']
    def list() {
        try{
        def productDetailsList=ProductDetails.list()
        render(view: "list",model: [productDetailsList:productDetailsList])}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){

            def productDetails=new ProductDetails()
            def productSizeId=params.productSizeId
            String productSizes=""
            for(int i=0;i<productSizeId.size();i++){
                productSizes=productSizes + productSizeId[i]+","
            }
            productDetails.productSizes=productSizes
            productDetails.productCategory=ProductCategory.get(params.productCategory)
            productDetails.productSubCategory=ProductSubCategory.get(params.productSubCategory)
            productDetails.productName=params.productName
            productDetails.productBrand=ProductBrand.get(params.productBrand)
            productDetails.price=params.price as float
            productDetails.isSale=params.isSale as byte
            if(productDetails.isSale){
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
            if(productDetails){
                def productSizeId=params.productSizeId
                String productSizes=""
                for(int i=0;i<productSizeId.size();i++){
                    productSizes=productSizes + productSizeId[i]+","
                }
                productDetails.productSizes=productSizes
                productDetails.productCategory=ProductCategory.get(params.productCategory)
            productDetails.productSubCategory=ProductSubCategory.get(params.productSubCategory)
            productDetails.productName=params.productName
            productDetails.productBrand=ProductBrand.get(params.productBrand)
            productDetails.price=params.price as float
            productDetails.isSale=params.isSale as byte
            if(productDetails.isSale){
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
            else {
                redirect(action: "notfound",controller: "errorPage")

            }
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }


    def show(Long id){
        try{
        def productDetailsInstance=ProductDetails.get(id)

        if(productDetailsInstance){
            def sizeString=productDetailsInstance.productSizes
            String[] stringArraySize= sizeString.split(",")
            List<ProductSize> productSizeList=new ArrayList<>()
            for(int i=0;i<stringArraySize.size();i++){
                def sizeId=stringArraySize[i] as long
                productSizeList.add(ProductSize.get(sizeId))
            }
            [productDetailsInstance:productDetailsInstance,productSizeList:productSizeList]
        }
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
        def productDetailsInstance=ProductDetails.get(params.id)

        if(productDetailsInstance){
def sizeString=productDetailsInstance.productSizes
            String[] stringArray = sizeString.split(",");

            [productDetailsInstance:productDetailsInstance,stringArray:stringArray]
        }
        else{
            redirect(action: "list")
        }
    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try {
            def productDetailsInstance = ProductDetails.get(params.id)


            if (productDetailsInstance) {

                productDetailsInstance.delete(flush: true)
                flash.message = "Successfully deleted."


            } else {
                flash.message = "Unable to delete the already deleted item."


            }
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = "Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }
}
