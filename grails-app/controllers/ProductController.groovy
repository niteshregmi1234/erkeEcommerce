import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductController {
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");

def checkPhoto(){
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
    }
}
    def list() {
        def productList=Product.list()
        render(view: "list",model: [productList:productList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def product=new Product()
            product.productCategory=ProductCategory.get(params.productCategory)
            product.productSubCategory=ProductSubCategory.get(params.productSubCategory)
            product.productColor=ProductColor.get(params.productColor)
            product.productSize=ProductSize.get(params.productSize)
            product.frontImageName=upLoadFrontImage()
            product.sideImageName=uploadSideImage()
            product.backImageName=uploadBackImage()
            product.name=params.name
            product.productBrand=ProductBrand.get(params.productBrand)
            product.price=params.price as float
            product.isSale=params.isSale as boolean
            if(product.isSale==true){
                product.discountPercentage=params.discountPercentage as float
            }
            else{
                product.discountPercentage=0
            }
            product.isFeatured=params.isFeatured as boolean
            product.isLatest=params.isLatest as boolean
            product.isMenuBar=params.isMenuBar as boolean
            product.description=params.description
            product.save(flush: true)
            redirect(action: "show" ,id:product.id)
        }
        else{
            def product=Product.get(params.id)
            product.productCategory=ProductCategory.get(params.productCategory)
            product.productSubCategory=ProductSubCategory.get(params.productSubCategory)
            product.productColor=ProductColor.get(params.productColor)
            product.productSize=ProductSize.get(params.productSize)
            product.frontImageName=editFrontImage(product.frontImageName)
            product.sideImageName=editSideImage(product.sideImageName)
            product.backImageName=editBackImage(product.backImageName)
            product.name=params.name
            product.productBrand=ProductBrand.get(params.productBrand)
            product.price=params.price as float
            product.isSale=params.isSale as boolean
            if(product.isSale==true){
                product.discountPercentage=params.discountPercentage as float
            }
            else{
                product.discountPercentage=0
            }
            product.isFeatured=params.isFeatured as boolean
            product.isLatest=params.isLatest as boolean
            product.description=params.description
            print params.isMenuBar
            product.isMenuBar=params.isMenuBar as boolean
            product.save(flush: true)
            redirect(action: "show" ,id:product.id)
        }
    }
    def editFrontImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("frontImageName")
if(file.size>0){
        File fileOld= new File("web-app/images/allProducts/frontImage/${imageNameOld}")
        fileOld.delete();
                String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/allProducts/frontImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/allProducts/frontImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName}
        else{
    return imageNameOld
}

    }
    def editBackImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("backImageName")
if(file.size>0){
        File fileOld= new File("web-app/images/allProducts/backImage/${imageNameOld}")
        fileOld.delete();
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/allProducts/backImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/allProducts/backImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName
    }
    else{
    return imageNameOld
}}
    def editSideImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("sideImageName")
if(file.size>0){
        File fileOld= new File("web-app/images/allProducts/sideImage/${imageNameOld}")
        fileOld.delete();
               String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/allProducts/sideImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/allProducts/sideImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName}
        else{
    return imageNameOld
}
    }
    def upLoadFrontImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("frontImageName")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/allProducts/frontImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/allProducts/frontImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName

    }
    def uploadSideImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("sideImageName")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/allProducts/sideImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/allProducts/sideImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName
    }
    def uploadBackImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("backImageName")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/allProducts/backImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/allProducts/backImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName
    }
    def show(Long id){
        def productInstance=Product.get(id)

        if(productInstance){
            [productInstance:productInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productInstance=Product.get(params.id)

        if(productInstance){
            [productInstance:productInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productInstance=Product.get(params.id)


        if(productInstance) {
            try{
                File frontImage= new File("web-app/images/allProducts/frontImage/${productInstance.frontImageName}")
                File backImage= new File("web-app/images/allProducts/backImage/${productInstance.backImageName}")
                File sideImage= new File("web-app/images/allProducts/sideImage/${productInstance.sideImageName}")
                frontImage.delete();
                backImage.delete();
                sideImage.delete();
                productInstance.delete(flush: true)
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
