import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import java.util.regex.Matcher
import java.util.regex.Pattern
class AidsController extends BaseController{
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
    static allowedMethods = [save: 'POST']
    def productService
    def checkForAdSubmit(){
        if(params.id){
            def aids=Aids.findById(params.id)
            def aids1=Aids.findByAdDescribeRawNotEqualAndAdDescribeRaw(aids.adDescribeRaw,params.adDescribe)
        if(aids1){
            render "no"

        }
            else{
            render "yes"

        }
        }
        else{
            def aids=Aids.findByAdDescribeRaw(params.adDescribe)
            if(aids){
                render "no"
            }
            else{
                render "yes"
            }
        }
    }
    def checkFloat(){
        try{
            def isAvailable=productService.checkFloat(params)
            render(contentType: 'text/json') {
                [
                        "valid": isAvailable,
                ]
            }
        }
        catch (Exception e){

        }
    }

    def list(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
        def aidsList=Aids.list()
    [aidsList:aidsList]}
                else{
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller:"errorPage")

        }

}
def create(){
    try{
        if(session.adminUser) {

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
             if(Aids.list().size()<=9){
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
            }
             else{
                 redirect(action: "notfound",controller:"errorPage")

             }
            }

            else {
                redirect(action: "adminLoginForm", controller: "login")

            }
        }    }
    catch (Exception e){
        redirect(action: "notfound",controller:"errorPage")
    }
}
    def save(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
        if(!params.id){
        def aidsInstance=new Aids()
        aidsInstance.aidType=params.group
        aidsInstance.divPosition=DivPosition.list()[Aids.list().size()].divPositionName
        aidsInstance.isDiscountForProduct=params.isDiscountForProduct
        if(aidsInstance.isDiscountForProduct=="discount"){
            aidsInstance.discountType=params.discountType
            if(aidsInstance.discountType=="range"){
                aidsInstance.discountFrom=params.discountFrom as float
                aidsInstance.discountTo=params.discountTo as float
            }
            else{
                aidsInstance.discount=params.discount as float
            }
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
            if(product) {

                    def productIdList = new ArrayList<>(Arrays.asList(product))
                    String productIds = ""
                    for (int i = 0; i < productIdList.size(); i++) {
                        productIds = productIds + productIdList[i] + ","
                    }
                    aidsInstance.productIds = productIds
            }        }
        aidsInstance.imageName=uploadAdImage()
            aidsInstance.adDescribeRaw=params.adDescribe
            aidsInstance.adDescribe = productService.convertToOriginalUrl(params.adDescribe)
            aidsInstance.save(flush: true)
            flash.message="successfully added"
            redirect(action: "edit",params: [id:aidsInstance.id])
        }
        else{
            def aidsInstance=Aids.get(params.id)
            if(aidsInstance){
            aidsInstance.aidType=params.group
            aidsInstance.isDiscountForProduct=params.isDiscountForProduct

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
                else{
                    aidsInstance.categoryIds=null

                }
                if(subCategory){
                    def subCategoryIdList=new ArrayList<>(Arrays.asList(subCategory))
                    String subCategoryIds=""
                    for(int i=0;i<subCategoryIdList.size();i++){
                        subCategoryIds=subCategoryIds + subCategoryIdList[i]+","
                    }
                    aidsInstance.subCategoryIds=subCategoryIds
                }
                else{
                    aidsInstance.subCategoryIds=null

                }
                if(specification){
                    def specificationIdList=new ArrayList<>(Arrays.asList(specification))
                    String specificationIds=""
                    for(int i=0;i<specificationIdList.size();i++){
                        specificationIds=specificationIds + specificationIdList[i]+","
                    }
                    aidsInstance.specificationIds=specificationIds
                }
                else{
                    aidsInstance.specificationIds=null

                }
                if(brand){
                    def brandIdList=new ArrayList<>(Arrays.asList(brand))
                    String brandIds=""
                    for(int i=0;i<brandIdList.size();i++){
                        brandIds=brandIds + brandIdList[i]+","
                    }
                    aidsInstance.brandIds=brandIds
                }
                else {
                    aidsInstance.brandIds=null

                }
                if(aidsInstance.isDiscountForProduct=="discount"){
                    aidsInstance.discountType=params.discountType
                    if(aidsInstance.discountType=="range"){
                        aidsInstance.discountFrom=params.discountFrom as float
                        aidsInstance.discountTo=params.discountTo as float
                        aidsInstance.discount=0

                    }
                    else{
                        aidsInstance.discountFrom=0
                        aidsInstance.discountTo=0
                        aidsInstance.discount=params.discount as float
                    }
                }
                else{
                    aidsInstance.discountType=null
                    aidsInstance.discountFrom=0
                    aidsInstance.discountTo=0
                    aidsInstance.discount=0
                }
                aidsInstance.productIds=null
            }
            else{
                aidsInstance.categoryIds=null
                aidsInstance.subCategoryIds=null
                aidsInstance.specificationIds=null
                aidsInstance.brandIds=null
                def product=params.product
                if(aidsInstance.isDiscountForProduct=="discount"){
                    aidsInstance.discountType=params.discountType
                    if(aidsInstance.discountType=="range"){
                        aidsInstance.discountFrom=params.discountFrom as float
                        aidsInstance.discountTo=params.discountTo as float
                        aidsInstance.discount=0
                    }
                    else{
                        aidsInstance.discountFrom=0
                        aidsInstance.discountTo=0
                        aidsInstance.discount=params.discount as float
                    }
                    aidsInstance.productIds=null
                }
                else{
                    aidsInstance.discountType=null
                    aidsInstance.discountFrom=0
                    aidsInstance.discountTo=0
                    aidsInstance.discount=0
                    def productIdList = new ArrayList<>(Arrays.asList(product))
                    String productIds = ""
                    for (int i = 0; i < productIdList.size(); i++) {
                        productIds = productIds + productIdList[i] + ","
                    }
                    aidsInstance.productIds = productIds

                }
                                }
            aidsInstance.adDescribeRaw=params.adDescribe

            aidsInstance.imageName=editAdImage(aidsInstance.imageName)
            aidsInstance.adDescribe = productService.convertToOriginalUrl(params.adDescribe)
            aidsInstance.save(flush: true)
            flash.message="successfully updated"
            redirect(action: "edit",id: aidsInstance.id)
        }}}
                else{
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller:"errorPage")

        }
    }
   def editAdImage(String imageNameOld){
       if(session.adminUser){

           if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

               def mp = (MultipartHttpServletRequest) request
               CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
               def homeDir = new File(System.getProperty("user.home"))
               File theDir = new File(homeDir, "yarsaa");
               if (!theDir.exists()) {
                   theDir.mkdir();
                   print "yes"
               }
               if (file.size > 0) {
                   File fileOld = new File(homeDir, "yarsaa/${imageNameOld}")
                   fileOld.delete();
                   String fileName = file.originalFilename
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

               } else {
                   return imageNameOld
               }
           }        }

   }
    def uploadAdImage(){
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
def edit(){
    try{
        if(session.adminUser){
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                def aidsInstance = Aids.get(params.id)
                if (aidsInstance) {
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
                    String[] categoryIdsArray=[]
                    String[] brandIdsArray=[]
                    String[] specificationIdsArray=[]
                    String[] productIdsArray=[]
                    String[] subCategoryIdsArray=[]
                    def categoryIds = aidsInstance.categoryIds
                    def brandIds = aidsInstance.brandIds
                    def specificationIds = aidsInstance.specificationIds
                    def productIds = aidsInstance.productIds
                    def subCategoryIds = aidsInstance.subCategoryIds

                    if(categoryIds){
                    categoryIdsArray = categoryIds.split(",");
                    }
                    if(brandIds){
                        brandIdsArray = brandIds.split(",");}
                    if(specificationIds){
                        specificationIdsArray = specificationIds.split(",");
                    }
                    if(productIds){
                        productIdsArray = productIds.split(",");
                    }
if(subCategoryIds){
    subCategoryIdsArray = subCategoryIds.split(",");

}
                    render (view:"create",model:[subCategoryIdsArray:subCategoryIdsArray,specificationIdsArray:specificationIdsArray,productBrandList: productBrandList,productIdsArray:productIdsArray, productCategoryArrayList: productCategoryArrayList, productSubCategorySpecifyArrayList: productSubCategorySpecifyArrayList, productSubCategoryArrayList: productSubCategoryArrayList,aidsInstance: aidsInstance,categoryIdsArray:categoryIdsArray,brandIdsArray:brandIdsArray])
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
}

