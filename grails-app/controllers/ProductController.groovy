import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductController extends BaseController {
    static allowedMethods = [saveViewOfImages:'POST',checkPhoto: 'POST',save: 'POST',uploadSpecialImage: 'POST',editSpecialImage: 'POST',uploadThumbnailImage: 'POST',uploadMediumImage: 'POST',uploadZoomImage: 'POST',changeDiscount: 'POST',changeIsLatest: 'POST',deleteView: 'POST',editMediumImage: 'POST',editThumbnailImage: 'POST']
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
    def productService
    def create(){

    }
    def updatePriorityNumber(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                    def product=Product.findByDelFlagAndId(false,params.id as long)
                    Product.list().size()


                    if (product){
                        if(params.priorityNumber) {
                            product.priorityNumber = params.priorityNumber as long
                        }
                        else{
                            product.priorityNumber=Product.list().size()
                        }
                        product.save(flush: true)
                        render product.priorityNumber
                    }
                    else{
                        render "notOk"
                    }

                }
            }
        }
        catch (Exception e){
            render "notOk"

        }
    }
    def deleteView(){
        try{
        if(session.adminUser) {

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
          def productView=ProductView.findByDelFlagAndId(false,params.id)
            if(productView){
                productView.delFlag=true
                productView.save(flush: true)
            render "successfully deleted the view"
            }
                else{
                render "unable to delete view"
            }
            }
        }
        }
        catch (Exception e){
            render "server encountered problem"

        }
    }
    def changeIsLatest(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productList = Product.findAllByDelFlag(false)
                    for (Product product : productList) {
                        product.isLatest = params.isLatest as byte
                        product.save(flush: true)
                        render(view: "setUpIsLatest")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")
                }
            }            }
        catch (Exception e){

        }
    }
    def latestShortcut(){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
            render(view: "setUpIsLatest")
        }
        else {
                redirect(action: "adminLoginForm", controller: "login")

            }        }
    }
    def changeDiscount(){
    try{
        if(session.adminUser) {

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                def brandIds = params.brand
                def categoryIds = params.category
                def specificationIds = params.specification
                def subCategoryIds = params.subCategory
                if (brandIds) {
                    brandIds = new ArrayList<>(Arrays.asList(brandIds))
                }
                if (categoryIds) {

                    categoryIds = new ArrayList<>(Arrays.asList(categoryIds))
                }
                if (specificationIds) {

                    specificationIds = new ArrayList<>(Arrays.asList(specificationIds))
                }
                if (subCategoryIds) {

                    subCategoryIds = new ArrayList<>(Arrays.asList(subCategoryIds))
                }
                def discountPercentage = params.discountPercentage as float
                if (brandIds && categoryIds && specificationIds && subCategoryIds) {
                    productService.changeDiscountIfAll(brandIds, categoryIds, specificationIds, subCategoryIds, discountPercentage)

                } else if (brandIds && specificationIds && subCategoryIds) {
                    productService.changeDiscountIfBrandAndSpecificationAndSubCategory(brandIds, specificationIds, subCategoryIds, discountPercentage)
                } else if (categoryIds && specificationIds && subCategoryIds) {
                    productService.changeDiscountIfCategoryAndSpecificationAndSubCategory(specificationIds, categoryIds, subCategoryIds, discountPercentage)
                } else if (brandIds && categoryIds && subCategoryIds) {
                    productService.changeDiscountIfBrandAndCategoryAndSubCategory(brandIds, categoryIds, subCategoryIds, discountPercentage)

                } else if (brandIds && categoryIds && specificationIds) {
                    productService.changeDiscountIfBrandAndSpecificationAndCategory(brandIds, categoryIds, specificationIds, discountPercentage)
                } else if (brandIds && categoryIds) {
                    productService.changeDiscountIfBrandAndCategory(brandIds, categoryIds, discountPercentage)
                } else if (brandIds && specificationIds) {
                    productService.changeDiscountIfBrandAndSpecification(brandIds, specificationIds, discountPercentage)
                } else if (brandIds && subCategoryIds) {
                    productService.changeDiscountIfBrandAndSubCategory(brandIds, subCategoryIds, discountPercentage)
                } else if (categoryIds && specificationIds) {
                    productService.changeDiscountIfSpecificationAndCategory(categoryIds, specificationIds, discountPercentage)
                } else if (subCategoryIds && specificationIds) {
                    productService.changeDiscountIfSpecificationAndSubCategory(subCategoryIds, specificationIds, discountPercentage)

                } else if (subCategoryIds && categoryIds) {
                    productService.changeDiscountIfCategoryAndSubCategory(subCategoryIds, categoryIds, discountPercentage)
                } else if (brandIds) {
                    productService.changeDiscountIfBrand(brandIds, discountPercentage)
                } else if (categoryIds) {
                    productService.changeDiscountIfCategory(categoryIds, discountPercentage)


                } else if (specificationIds) {
                    productService.changeDiscountIfSpecification(specificationIds, discountPercentage)

                } else if (subCategoryIds) {
                    productService.changeDiscountIfSubCategory(subCategoryIds, discountPercentage)
                }
                redirect(action: "list", controller: "productDetails")
            } else {
                redirect(action: "adminLoginForm", controller: "login")
            }
        }    }
    catch (Exception e){

    }
}
    def discountShortcut(){
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
                render(view: "setUpDiscount", model: [productBrandList: productBrandList, productCategoryArrayList: productCategoryArrayList, productSubCategorySpecifyArrayList: productSubCategorySpecifyArrayList, productSubCategoryArrayList: productSubCategoryArrayList])
            } else {
                redirect(action: "adminLoginForm", controller: "login")

            }
        }    }
    catch (Exception e){
        redirect(action: "notfound",controller:"errorPage")
    }
}
def checkPhoto(){
    try{
        if(session.adminUser) {

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                def Image = request.getFile('Image')

                def checkFile
                Image trueImage = ImageIO.read(Image.getInputStream());

                if (trueImage == null) {

                    checkFile = "Photo bad format"
                    render checkFile
                } else {
                    checkFile = "perfect"
                    render checkFile
                }
            } else {
                redirect(action: "adminLoginForm", controller: "login")

            }
        }    }
    catch (Exception e){

    }
}
    def list(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productList = Product.findAllByDelFlag(false)
                    render(view: "list", model: [productList: productList])
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e){
            redirect(action: "notfound",controller:"errorPage")
        }
    }
    def save() {
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
        if(!params.id) {
            def product = new Product()
            product.productColor = ProductColor.get(params.productColor)
            product.productDetails = ProductDetails.get(params.productDetails)
            product.isFeatured = params.isFeatured as byte
            product.isLatest = params.isLatest as byte
            product.productSpecificationName = productService.convertToOriginalUrl(product.productDetails.productBrand.urlName + "-" + product.productColor.colorName + "-" + product.productDetails.briefDescription)
            if(params.priorityNumber) {
                product.priorityNumber = params.priorityNumber as long
            }
            else{
                product.priorityNumber=Product.list().size()

            }
            product.specialImageName = uploadSpecialImage()
            product.delFlag = false
            product.soldNumbers = 0
            product.save(flush: true)
            product.productSpecificationName = product.productSpecificationName + "-" + product.id
            product.save(flush: true)

            redirect(action: "show", id: product.id)
            def numberOfImageSets = params.numberOfImageSets as int
            for (int i = 0; i < numberOfImageSets; i++) {
                def productView = new ProductView()
                productView.thumbnailImageName = uploadThumbnailImage(i)
                productView.mediumImageName = uploadMediumImage(i)
                productView.zoomImageName = uploadZoomImage(i)
                productView.product = product
                product.delFlag = false
                productView.save()
            }
        }
        else {
            def product = Product.findByDelFlagAndId(false,params.id)
            if (product) {
                product.productColor = ProductColor.get(params.productColor)
                product.productDetails = ProductDetails.get(params.productDetails)
                product.isFeatured = params.isFeatured as byte
                product.isLatest = params.isLatest as byte
                product.productSpecificationName = product.productDetails.productCategory.categoryName + "-" + product.productColor.colorName + " " + product.productDetails.productBrand.brandName + " " + product.productDetails.productName
                product.productSpecificationName = productService.convertToOriginalUrl(product.productDetails.productBrand.urlName + "-" + product.productColor.colorName+ "-" + product.productDetails.briefDescription + "-" + product.id)
                if(params.priorityNumber) {
                    product.priorityNumber = params.priorityNumber as long
                }
                else{
                    product.priorityNumber=Product.list().size()

                }
                product.specialImageName = editSpecialImage(product.specialImageName)
                product.save(flush: true)
                redirect(action: "show", id: product.id)
            } else {
                redirect(action: "notfound", controller: "errorPage")
            }
        }}}}
        catch (Exception e){
            redirect(action: "notfound", controller: "errorPage")

        }
    }
    def saveViewOfImages(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
        if(params.id){
                    def numberOfImageSets = params.numberOfImageSets as int
        def product=Product.findByDelFlagAndId(false,params.id as long)
        if(product){
        for (int i = 0; i < numberOfImageSets; i++) {
            def productView=new ProductView()
            productView.thumbnailImageName=uploadThumbnailImage(i)
            productView.mediumImageName=uploadMediumImage(i)
            productView.zoomImageName=uploadZoomImage(i)
            productView.product=product
            productView.save()
        }
        redirect(action: "show",id: product.id)}
        else{
            redirect(action: "notfound",controller: "errorPage")

        }}
                    else if(params.viewId){
            def productView=ProductView.get(params.viewId)
            if(productView) {
                productView.thumbnailImageName = editThumbnailImage(productView.thumbnailImageName)
                productView.mediumImageName = editMediumImage(productView.mediumImageName)
                productView.zoomImageName = editZoomImage(productView.zoomImageName)
                productView.save(flush: true)
                render "successfully edited the view"
            }

        }
                }}}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def editThumbnailImage(String imageNameOld){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("editThumbnailImage")
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
            }        }    }
    def editMediumImage(String imageNameOld){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("editMediumImage")
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
            }        }    }
    def editZoomImage(String imageNameOld){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("editZoomImage")
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
            }        }    }

    def edit(){
        try {
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productInstance = Product.findByDelFlagAndId(false,params.id)

                    if (productInstance) {
                        [productInstance: productInstance]
                    } else {
                        redirect(action: "list")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def show(Long id){
        try {
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {
                    def productInstance = Product.findByDelFlagAndId(false,id)
                    if (productInstance) {
                        [productInstance: productInstance]
                    } else {
                        redirect(action: "list")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }            }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def uploadMediumImage(int i){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("mediumImageName"+i)
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
    def editSpecialImage(String imageNameOld){
        if(session.adminUser){

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
            }        }
    }


    def uploadZoomImage(int i){
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("zoomImageName"+i)
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



    def uploadThumbnailImage(i) {
        if(session.adminUser){

            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("thumbnailImageName"+i)
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
    def uploadSpecialImage(){
        if(session.adminUser){

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

            }        }    }
    def delete(){
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def productInstance = Product.findByDelFlagAndId(false,params.id)
                    if (productInstance) {
                            productInstance.delFlag = true
                            productInstance.save(flush: true)
                            flash.message = "Successfully deleted."

                    } else {
                        flash.message = "Unable to delete unexisted item."
                    }
                    redirect(action: "list")
                } else {
                    redirect(action: "adminLoginForm", controller: "login")
                }
            }
        }
        catch (Exception e){
            redirect(action: "notfound", controller: "errorPage")
        }
    }
}


