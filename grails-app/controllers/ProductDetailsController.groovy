import org.springframework.dao.DataIntegrityViolationException
class ProductDetailsController extends BaseController{
static allowedMethods = [checkProductName: 'POST', save: 'POST']
    def checkProductName(){
        try{
            if(!params.id){
        def productDetailsInstance=ProductDetails.findByProductName(params.productName)
        if(productDetailsInstance){
            render "notOk"
        }
        else{
            render "ok"
        }}
            else{
                def productDetailsName=ProductDetails.findById(params.id as long).productName
                def productDetailsInstance=ProductDetails.findByProductNameAndProductNameNotEqual(params.productName,productDetailsName)
                if(productDetailsInstance){
                    render "notOk"
                }
                else{
                    render "ok"
                }
            }
        }
        catch (Exception e){

        }

    }
    def list() {
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productDetailsList = ProductDetails.list()
                    render(view: "list", model: [productDetailsList: productDetailsList])
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
render(view: "create")
        }
        else {
                redirect(action: "adminLoginForm", controller: "login")

            }        }
    }
    def save(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                if(!params.id){
            def productDetails=new ProductDetails()
            def productSizeId1=params.productSizeId
            def productSizeId=new ArrayList<>(Arrays.asList(productSizeId1))
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
            productDetails.productNameWithBrand=productDetails.productCategory.categoryName+"-"+productDetails.productBrand.brandName+" "+productDetails.productName
            productDetails.save(flush: true)
            redirect(action: "show" ,id:productDetails.id)
        }
        else{
            def productDetails=ProductDetails.get(params.id)
            if(productDetails){
                def productSizeId1=params.productSizeId
                def productSizeId=new ArrayList<>(Arrays.asList(productSizeId1))
                String productSizes=""
                for(int i=0;i<productSizeId.size();i++){
                    print productSizeId[i]
                    productSizes=productSizes+productSizeId[i]+","
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
                productDetails.productNameWithBrand=productDetails.productCategory.categoryName+"-"+productDetails.productBrand.brandName+" "+productDetails.productName
                productDetails.save(flush: true)
                redirect(action: "show" ,id:productDetails.id)
        }
            else {
                redirect(action: "notfound",controller: "errorPage")

            }
        }
        }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }


    def show(Long id){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                    def productDetailsInstance=ProductDetails.get(id)

        if(productDetailsInstance){
            def sizeString=productDetailsInstance.productSizes
            String[] stringArraySize= sizeString.split(",")
            List<ProductSize> productSizeList=new ArrayList<>()
            for(int i=0;i<stringArraySize.size();i++){
                def sizeId=stringArraySize[i] as long
                if(ProductSize.get(sizeId)){
                productSizeList.add(ProductSize.get(sizeId))}
            }
            [productDetailsInstance:productDetailsInstance,productSizeList:productSizeList]
        }
        else{
            redirect(action: "list")
        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
            if(session.adminUser){
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def productDetailsInstance = ProductDetails.get(params.id)

                if (productDetailsInstance) {
                    def sizeString = productDetailsInstance.productSizes
                    String[] stringArray = sizeString.split(",");

                    [productDetailsInstance: productDetailsInstance, stringArray: stringArray]
                } else {
                    redirect(action: "list")
                }
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try {
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productDetailsInstance = ProductDetails.get(params.id)


                    if (productDetailsInstance) {

                        productDetailsInstance.delete(flush: true)
                        flash.message = "Successfully deleted."


                    } else {
                        flash.message = "Unable to delete the already deleted item."


                    }
                    redirect(action: "list")
                } else {
                    redirect(action: "adminLoginForm", controller: "login")
                }
            }        }
        catch (DataIntegrityViolationException e) {
            flash.message = "Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }
}
