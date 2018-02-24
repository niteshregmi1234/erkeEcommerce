import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductController extends BaseController {
    static allowedMethods = [checkPhoto: 'POST',save: 'POST',uploadSpecialImage: 'POST',editSpecialImage: 'POST',upLoadFrontImage: 'POST',editFrontImage: 'POST',uploadSideImage: 'POST',editSideImage: 'POST',uploadBackImage: 'POST',editBackImage: 'POST',changeDiscount: 'POST',changeIsLatest: 'POST']
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
    def productService
    def changeIsLatest(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def productList=Product.findAllByDelFlag(false)
        for(Product product:productList) {
            product.isLatest = params.isLatest as byte
            product.save(flush: true)
        }
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")
            }
            }
        catch (Exception e){

        }
    }
    def latestShortcut(){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
            render(view: "setUpIsLatest")
        }
        else{
            redirect(action: "adminLoginForm",controller: "login")

        }
    }
    def changeDiscount(){
    try{
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
            def brandIds=params.brand
    def categoryIds=params.category
    def specificationIds=params.specification
    def subCategoryIds=params.subCategory
    if(brandIds){
    brandIds=new ArrayList<>(Arrays.asList(brandIds))
    }
    if(categoryIds){

    categoryIds=new ArrayList<>(Arrays.asList(categoryIds))
    }
        if(specificationIds){

    specificationIds=new ArrayList<>(Arrays.asList(specificationIds))
        }
            if(subCategoryIds){

    subCategoryIds=new ArrayList<>(Arrays.asList(subCategoryIds))
            }
            def discountPercentage=params.discountPercentage as float
            if(brandIds && categoryIds && specificationIds && subCategoryIds ){
        productService.changeDiscountIfAll(brandIds,categoryIds,specificationIds,subCategoryIds,discountPercentage)

    }
    else if(brandIds && specificationIds && subCategoryIds){
        productService.changeDiscountIfBrandAndSpecificationAndSubCategory(brandIds,specificationIds,subCategoryIds,discountPercentage)
    }
    else if(categoryIds && specificationIds && subCategoryIds){
       productService.changeDiscountIfCategoryAndSpecificationAndSubCategory(specificationIds, categoryIds,subCategoryIds,discountPercentage)
    }
    else if(brandIds && categoryIds && subCategoryIds){
                productService.changeDiscountIfBrandAndCategoryAndSubCategory(brandIds,categoryIds,subCategoryIds,discountPercentage)

    }
    else if(brandIds && categoryIds && specificationIds){
                productService.changeDiscountIfBrandAndSpecificationAndCategory(brandIds,categoryIds ,specificationIds,discountPercentage)
            }
    else if(brandIds && categoryIds){
                productService.changeDiscountIfBrandAndCategory(brandIds,categoryIds,discountPercentage)
         }
    else if(brandIds && specificationIds){
                productService.changeDiscountIfBrandAndSpecification(brandIds,specificationIds,discountPercentage)
    }
    else if(brandIds && subCategoryIds){
                productService.changeDiscountIfBrandAndSubCategory(brandIds,subCategoryIds,discountPercentage)
    }
    else if(categoryIds && specificationIds){
                productService.changeDiscountIfSpecificationAndCategory(categoryIds,specificationIds,discountPercentage)
    }
    else if(subCategoryIds && specificationIds){
                productService.changeDiscountIfSpecificationAndSubCategory(subCategoryIds,specificationIds,discountPercentage)

    }
    else if(subCategoryIds && categoryIds){
                productService.changeDiscountIfCategoryAndSubCategory(subCategoryIds,categoryIds,discountPercentage)
    }
    else if(brandIds){
                productService.changeDiscountIfBrand(brandIds,discountPercentage)
    }
    else if(categoryIds){
                productService.changeDiscountIfCategory(categoryIds,discountPercentage)


    }
    else if(specificationIds){
                productService.changeDiscountIfSpecification(specificationIds,discountPercentage)

    }
    else if(subCategoryIds){
                productService.changeDiscountIfSubCategory(subCategoryIds,discountPercentage)
    }
redirect(action: "list",controller: "productDetails")}
    else{
            redirect(action: "adminLoginForm",controller: "login")
        }
    }
    catch (Exception e){

    }
}
    def discountShortcut(){
    try{
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
List<ProductBrand> productBrandList=new ArrayList<>()
            def brandList=ProductBrand.findAllByStatusShow(true)
            for(ProductBrand productBrand:brandList){
               def Product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(productBrand),false)
                if(Product){
                    productBrandList.add(productBrand)
                }
            }
            List<ProductCategory> productCategoryArrayList=new ArrayList<>()
            def categoryList=ProductCategory.findAllByStatusShow(true)
            for(ProductCategory productCategory:categoryList){
                def Product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductCategory(productCategory),false)
                if(Product){
                    productCategoryArrayList.add(productCategory)
                }
            }
            List<ProductSubCategorySpecify> productSubCategorySpecifyArrayList=new ArrayList<>()
            def specifyListSubCategory=ProductSubCategorySpecify.list()
            for(ProductSubCategorySpecify productSubCategorySpecify:specifyListSubCategory){
                def Product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategory(ProductSubCategory.findByProductSubCategorySpecify(productSubCategorySpecify)),false)
                if(Product){
                    productSubCategorySpecifyArrayList.add(productSubCategorySpecify)
                }
            }
            List<ProductSubCategory> productSubCategoryArrayList=new ArrayList<>()
            def subCategoryList=ProductSubCategory.findAllByStatusShow(true)
            for(ProductSubCategory productSubCategory:subCategoryList){
                def Product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategory(productSubCategory),false)
                if(Product){
                    productSubCategoryArrayList.add(productSubCategory)
                }
            }
            render(view: "setUpDiscount",model: [productBrandList:productBrandList,productCategoryArrayList:productCategoryArrayList,productSubCategorySpecifyArrayList:productSubCategorySpecifyArrayList,productSubCategoryArrayList:productSubCategoryArrayList])
            }
        else{
            redirect(action: "adminLoginForm",controller: "login")

        }
    }
    catch (Exception e){
        redirect(action: "notfound",controller:"errorPage")
    }
}
def checkPhoto(){
    try{
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def Image = request.getFile('Image')

    def checkFile
    Image trueImage = ImageIO.read(Image.getInputStream());

    if (trueImage == null) {

        checkFile = "Photo bad format"
        render checkFile
    }

    else{
        checkFile="perfect"
        render checkFile
    }}
        else{
            redirect(action: "adminLoginForm",controller: "login")

        }
    }
    catch (Exception e){

    }
}
    def list() {
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def productList=Product.findAllByDelFlag(false)
        render(view: "list",model: [productList:productList])}
        else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller:"errorPage")
        }
    }
    def create(){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
        render(view: "create")
        }
        else{
            redirect(action: "adminLoginForm",controller: "login")

        }
    }
    def save(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                if (!params.id) {
                    def product = new Product()
                    product.productColor = ProductColor.get(params.productColor)
                    product.productDetails = ProductDetails.get(params.productDetails)
                    product.isFeatured = params.isFeatured as byte
                    product.isLatest = params.isLatest as byte
                    product.seasons = SeasonManagement.list()[1].seasons
                    product.productSpecificationName = product.productDetails.productCategory.categoryName + "-" + product.productColor.colorName + " " + product.productDetails.productBrand.brandName + " " + product.productDetails.productName
                    product.frontImageName = upLoadFrontImage()
                    product.sideImageName = uploadSideImage()
                    product.backImageName = uploadBackImage()
                    product.specialImageName = uploadSpecialImage()
                    product.delFlag = false
                    product.soldNumbers=0
                    product.save(flush: true)
                    redirect(action: "show", id: product.id)
                } else {
                    def product = Product.get(params.id)
                    if (product) {
                        product.productColor = ProductColor.get(params.productColor)
                        product.productDetails = ProductDetails.get(params.productDetails)
                        product.isFeatured = params.isFeatured as byte
                        product.isLatest = params.isLatest as byte
                        product.productSpecificationName = product.productDetails.productCategory.categoryName + "-" + product.productColor.colorName + " " + product.productDetails.productBrand.brandName + " " + product.productDetails.productName
                        product.seasons = SeasonManagement.list()[1].seasons
                        product.frontImageName = editFrontImage(product.frontImageName)
                        product.sideImageName = editSideImage(product.sideImageName)
                        product.backImageName = editBackImage(product.backImageName)
                        product.specialImageName = editSpecialImage(product.specialImageName)
                        product.save(flush: true)
                        redirect(action: "show", id: product.id)
                    } else {
                        redirect(action: "notfound", controller: "errorPage")
                    }
                }
            }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
//    def bloodHound(){
//        def criteria = ProductDetails.createCriteria();
//        def productDetails = criteria.list {
//            or {
//
//                like("productName", "%" + params.keyCode + "%")
//                like("briefDescription", "%" + params.keyCode + "%")
//
//            }
//        }
//        print productDetails
//        def productNameList=[]
//        for(int i=0;i<productDetails.size();i++){
//            productNameList.add(productDetails[i].productName)
//        }
//        print productNameList
//
//    }

    def uploadSpecialImage(){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("specialImageName")
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

        }    }
    def editSpecialImage(String imageNameOld){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("specialImageName")
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
        }    }

    def editFrontImage(String imageNameOld){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("frontImageName")
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

        }    }
    def editBackImage(String imageNameOld){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("backImageName")
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
        }    }
    def editSideImage(String imageNameOld){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("sideImageName")
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
        }    }
    def upLoadFrontImage(){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("frontImageName")
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

        }    }
    def uploadSideImage(){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("sideImageName")
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
        }    }
    def uploadBackImage(){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("backImageName")
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

        }    }
    def show(Long id){
        try {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                def productInstance=Product.get(id)
            if(productInstance){
            [productInstance:productInstance]}
        else{
            redirect(action: "list")
        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
            }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try {

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

        def productInstance=Product.get(params.id)

        if(productInstance){
            [productInstance:productInstance]
        }
        else {
            redirect(action: "list")
        }        }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def productInstance=Product.get(params.id)
            if(productInstance) {
                if (!productInstance.delFlag) {
                    productInstance.delFlag = true
                    productInstance.save(flush: true)
                                flash.message="Successfully deleted."

                } else {
                    flash.message = "Unable to delete the already deleted item."
                }
            }
            else{
                flash.message = "Unable to delete unexisted item."

            }
                        redirect(action: "list")}
            else{
         redirect(action: "adminLoginForm",controller: "login")
            }

        }
        catch (Exception e){
            redirect(action: "notfound", controller: "errorPage")
        }
//        try{
//        def productInstance=Product.get(params.id)
//
//
//        if(productInstance) {
//            productInstance.delete(flush: true)
//            def homeDir = new File(System.getProperty("user.home"))
//            File frontImage= new File(homeDir,"yarsaa/${productInstance.frontImageName}")
//                File backImage= new File(homeDir,"yarsaa/${productInstance.backImageName}")
//                File sideImage= new File(homeDir,"yarsaa/${productInstance.sideImageName}")
//            File specialImage= new File(homeDir,"yarsaa/${productInstance.specialImageName}")
//
//            frontImage.delete();
//                backImage.delete();
//                sideImage.delete();
//            specialImage.delete()
//            flash.message="Successfully deleted."
//        }
//        else{
//            flash.message="Unable to delete the already deleted item."
//
//
//        }
//        redirect(action: "list")
//
//    }
//        catch (DataIntegrityViolationException e) {
//            flash.message = "Sorry! cannot delete this data."
//            redirect(action: "list")
//        }
//        catch (Exception e) {
//            redirect(action: "notfound", controller: "errorPage")
//
//        }
    }
}


