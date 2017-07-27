import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductSubCategoryController {
    static allowedMethods = [save: "POST",delete: "DELETE",show: "GET",uploadCoverImage:"POST"]
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");

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
            productSubCategoryInstance.productSubCategorySpecify=ProductSubCategorySpecify.get(params.productSubCategorySpecify)
            productSubCategoryInstance.statusShow=params.statusShow as boolean
            productSubCategoryInstance.coverImageName=uploadCoverImage()
            productSubCategoryInstance.save(flush: true)
            redirect(action: "show" ,id:productSubCategoryInstance.id)
        }
        else{
            def productSubCategoryInstance=ProductSubCategory.get(params.id)

            productSubCategoryInstance.subCategoryName=params.subCategoryName
            productSubCategoryInstance.productSubCategorySpecify=ProductSubCategorySpecify.get(params.productSubCategorySpecify)

            productSubCategoryInstance.statusShow=params.statusShow as boolean
            productSubCategoryInstance.coverImageName=editCoverImage(productSubCategoryInstance.coverImageName)

            productSubCategoryInstance.save(flush: true)

            redirect(action: "show" ,id:productSubCategoryInstance.id)
        }
    }
    def uploadCoverImage(){
        def f = request.getFile('coverImageName')

        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/subCategoryImage", fileName).exists()
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
        def homeDir = new File(System.getProperty("user.home"))
        File fileDest = new File(homeDir,"image/${fileName}")
//        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/subCategoryImage/${fileName}")
//file.transferTo(new File(fileDest))
        f.transferTo(fileDest)

        def imageName = fileName
        return imageName

    }
    def editCoverImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/subCategoryImage/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/subCategoryImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/subCategoryImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName}
        else{
            return imageNameOld
        }

    }
    def renderImage = {

        String profileImagePath = "/home/hemanta/image/"
        String image = params.imageName // or whatever name you saved in your db
        File imageFile =new File(profileImagePath+image);

        BufferedImage originalImage=ImageIO.read(imageFile);

        ByteArrayOutputStream baos=new ByteArrayOutputStream();

        ImageIO.write(originalImage, "png", baos );

        byte[] imageInByte=baos.toByteArray();

//        response.setHeader('Content-length', imageInByte.length.toString())

        response.contentType = 'image/png' // or the appropriate image content type

        response.outputStream << imageInByte
        response.outputStream.flush()

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
