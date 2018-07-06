import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.util.regex.Matcher
import java.util.regex.Pattern

class AidsController extends BaseController{
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
def list(){
    def aidsList=Aids.list()
    [aidsList:aidsList]
}
def create(){
    try{
        if(session.adminUser) {

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                List<ProductBrand> productBrandList = new ArrayList<>()
                def brandList = ProductBrand.findAllByStatusShow(true)
                for (ProductBrand productBrand : brandList) {
                    def Product = Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(productBrand), false)
                    if (Product) {
                        productBrandList.add(productBrand)
                    }
                }
                List<ProductCategory> productCategoryArrayList = new ArrayList<>()
                def categoryList = ProductCategory.findAllByStatusShow(true)
                for (ProductCategory productCategory : categoryList) {
                    def Product = Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductCategory(productCategory), false)
                    if (Product) {
                        productCategoryArrayList.add(productCategory)
                    }
                }
                List<ProductSubCategorySpecify> productSubCategorySpecifyArrayList = new ArrayList<>()
                def specifyListSubCategory = ProductSubCategorySpecify.list()
                for (ProductSubCategorySpecify productSubCategorySpecify : specifyListSubCategory) {
                    def Product = Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategory(ProductSubCategory.findByProductSubCategorySpecify(productSubCategorySpecify)), false)
                    if (Product) {
                        productSubCategorySpecifyArrayList.add(productSubCategorySpecify)
                    }
                }
                List<ProductSubCategory> productSubCategoryArrayList = new ArrayList<>()
                def subCategoryList = ProductSubCategory.findAllByStatusShow(true)
                for (ProductSubCategory productSubCategory : subCategoryList) {
                    def Product = Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategory(productSubCategory), false)
                    if (Product) {
                        productSubCategoryArrayList.add(productSubCategory)
                    }
                }
                render(view: "create", model: [productBrandList: productBrandList, productCategoryArrayList: productCategoryArrayList, productSubCategorySpecifyArrayList: productSubCategorySpecifyArrayList, productSubCategoryArrayList: productSubCategoryArrayList])
            } else {
                redirect(action: "adminLoginForm", controller: "login")

            }
        }    }
    catch (Exception e){
        redirect(action: "notfound",controller:"errorPage")
    }
}
    def save(){
        def aidsInstance=new Aids()
        aidsInstance.aidType=params.group
        aidsInstance.divPosition="side of top brand"
        aidsInstance.discountType=params.discountType
        if(params.discountType=="range"){
            aidsInstance.discountFrom=params.discountFrom as float
            aidsInstance.discountTo=params.discountTo as float
        }
        else{
            aidsInstance.discount=params.discount as float

        }
        if(params.group=="customize"){
        def category=params.category
            def subCategory=params.subCategory
            def specification=params.specification
            def brand=params.brand
            if(category){
        def categoryIdList=new ArrayList<>(Arrays.asList(category))
        String categoryIds=""
        for(int i=0;i<categoryIdList.size();i++){
            categoryIds=categoryIds + categoryIdList[i]+","
        }
            aidsInstance.categoryIds=categoryIds
    }
            if(subCategory){
                def subCategoryIdList=new ArrayList<>(Arrays.asList(subCategory))
                String subCategoryIds=""
                for(int i=0;i<subCategoryIdList.size();i++){
                    subCategoryIds=subCategoryIds + subCategoryIdList[i]+","
                }
                aidsInstance.subCategoryIds=subCategoryIds
            }
            if(specification){
                def specificationIdList=new ArrayList<>(Arrays.asList(specification))
                String specificationIds=""
                for(int i=0;i<specificationIdList.size();i++){
                    specificationIds=specificationIds + specificationIdList[i]+","
                }
                aidsInstance.specificationIds=specificationIds
            }
            if(brand){
                def brandIdList=new ArrayList<>(Arrays.asList(brand))
                String brandIds=""
                for(int i=0;i<brandIdList.size();i++){
                    brandIds=brandIds + brandIdList[i]+","
                }
                aidsInstance.brandIds=brandIds
            }
        }
        else{
            def product=params.product
            if(product){
                def productIdList=new ArrayList<>(Arrays.asList(product))
                String productIds=""
                for(int i=0;i<productIdList.size();i++){
                    productIds=productIds + productIdList[i]+","
                }
                aidsInstance.productIds=productIdList
            }
        }
        aidsInstance.imageName=uploadImage()
        aidsInstance.save(flush: true)
    }
    def uploadImage(){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
                def fileName = file.originalFilename
                def homeDir = new File(System.getProperty("user.home"))
                File theDir = new File(homeDir, "yarsaa");
                if (!theDir.exists()) {
                    theDir.mkdir();
                }

                abc:
                boolean check = new File(homeDir, "yarsaa/" + fileName).exists()
                if (check == true) {
                    Matcher m = PATTERN.matcher(fileName);
                    if (m.matches()) {
                        String prefix = m.group(1);
                        String last = m.group(2);
                        String suffix = m.group(3);
                        if (suffix == null) suffix = "";
                        int count = last != null ? Integer.parseInt(last) : 0;
                        count++;
                        fileName = prefix + "(" + count + ")" + suffix;
                        continue abc
                    }
                }
                File fileDest = new File(homeDir, "yarsaa/${fileName}")
                file.transferTo(fileDest)
                return fileName

            }        }    }

}

