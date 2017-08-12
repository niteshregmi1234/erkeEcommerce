import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductSubCategoryController extends BaseController{
    static allowedMethods = [save: "POST",uploadCoverImage:"POST",editCoverImage: "POST",renderImage: "POST"]
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");

    def list() {
        try{
        def productSubCategoryList=ProductSubCategory.list()
        render(view: "list",model: [productSubCategoryList:productSubCategoryList])
    }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){
            def productSubCategoryInstance=new ProductSubCategory()
            productSubCategoryInstance.subCategoryName=params.subCategoryName
            productSubCategoryInstance.productSubCategorySpecify=ProductSubCategorySpecify.get(params.productSubCategorySpecify)
            productSubCategoryInstance.statusShow=params.statusShow as boolean
            productSubCategoryInstance.subCategoryDescription=params.subCategoryDescription

            productSubCategoryInstance.coverImageName=uploadCoverImage()
            productSubCategoryInstance.save(flush: true)
            redirect(action: "show" ,id:productSubCategoryInstance.id)
        }
        else{
            def productSubCategoryInstance=ProductSubCategory.get(params.id)
if(productSubCategoryInstance){
            productSubCategoryInstance.subCategoryName=params.subCategoryName
            productSubCategoryInstance.productSubCategorySpecify=ProductSubCategorySpecify.get(params.productSubCategorySpecify)

            productSubCategoryInstance.statusShow=params.statusShow as boolean
    productSubCategoryInstance.subCategoryDescription=params.subCategoryDescription

    productSubCategoryInstance.coverImageName=editCoverImage(productSubCategoryInstance.coverImageName)

            productSubCategoryInstance.save(flush: true)

            redirect(action: "show" ,id:productSubCategoryInstance.id)}
            else {
    redirect(action: "notfound",controller: "errorPage")

}
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def uploadCoverImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        def fileName=file.originalFilename
        def homeDir = new File(System.getProperty("user.home"))
        File theDir = new File(homeDir,"yarsaa");
        if (! theDir.exists()){
            theDir.mkdir();
        }

        abc:
        boolean check = new File(homeDir, "yarsaa/"+fileName).exists()
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
        File fileDest = new File(homeDir,"yarsaa/${fileName}")
        file.transferTo(fileDest)
        return fileName

    }
    def editCoverImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        def homeDir = new File(System.getProperty("user.home"))
        File theDir = new File(homeDir,"yarsaa");
        if (! theDir.exists()){
            theDir.mkdir();
            print"yes"
        }
        if(file.size>0){
            File fileOld= new File(homeDir,"yarsaa/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File(homeDir, "yarsaa/"+fileName).exists()
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
            File fileDest = new File(homeDir,"yarsaa/${fileName}")
            file.transferTo(fileDest)
            return fileName

        }
        else{
            return imageNameOld
        }
    }
    def renderImage = {
        def validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

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
        try{
        def productSubCategoryInstance=ProductSubCategory.get(id)

        if(productSubCategoryInstance){
            [productSubCategoryInstance:productSubCategoryInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def edit(){
        try{
        def productSubCategoryInstance=ProductSubCategory.get(params.id)

        if(productSubCategoryInstance){
            [productSubCategoryInstance:productSubCategoryInstance]
        }
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def delete(){
        try{

            def productSubCategoryInstance=ProductSubCategory.get(params.id)


        if(productSubCategoryInstance) {
                productSubCategoryInstance.delete(flush: true)
            def imageName=productSubCategoryInstance.coverImageName
            def homeDir = new File(System.getProperty("user.home"))
            File file= new File(homeDir,"yarsaa/${imageName}")
            file.delete();
                flash.message="Successfully deleted."


        }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")

    }
        catch (DataIntegrityViolationException e){
            flash.message="Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch ( Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

}
