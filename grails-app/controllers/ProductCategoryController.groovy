import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductCategoryController extends BaseController{
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
static allowedMethods = [save: 'POST',uploadCoverImage: 'POST',editCoverImage: 'POST',uploadMenuImage1: 'POST',editMenu1Image: 'POST',uploadMenuImage2: 'POST',editMenu2Image: 'POST']
    def list() {
        try{
def productCategoryList=ProductCategory.list()
        render(view: "list",model: [productCategoryList:productCategoryList])}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){
            def productCategoryInstance=new ProductCategory()
            productCategoryInstance.categoryName=params.categoryName
            productCategoryInstance.statusShow=params.statusShow as byte
            productCategoryInstance.categoryDescription=params.categoryDescription

            productCategoryInstance.coverImageName=uploadCoverImage()
            productCategoryInstance.menuImage1=uploadMenuImage1()
            productCategoryInstance.menuImage2=uploadMenuImage2()

            productCategoryInstance.save(flush: true)
            redirect(action: "show" ,id:productCategoryInstance.id)
        }
        else{
            def productCategoryInstance=ProductCategory.get(params.id)
if(productCategoryInstance){
            productCategoryInstance.categoryName=params.categoryName
            productCategoryInstance.statusShow=params.statusShow as byte
    productCategoryInstance.categoryDescription=params.categoryDescription
    productCategoryInstance.coverImageName=editCoverImage(productCategoryInstance.coverImageName)
            productCategoryInstance.menuImage1=editMenu1Image(productCategoryInstance.menuImage1)
            productCategoryInstance.menuImage2=editMenu2Image(productCategoryInstance.menuImage2)

            productCategoryInstance.save(flush: true)

            redirect(action: "show" ,id:productCategoryInstance.id)
        }
        else{
    redirect(action: "notfound",controller: "errorPage")

}
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def uploadMenuImage1(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage1")
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
    def uploadMenuImage2(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage2")
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
    def editMenu1Image(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage1")
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
    def editMenu2Image(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage2")
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
    def show(Long id){
        try{
        def productCategoryInstance=ProductCategory.get(id)

        if(productCategoryInstance){
            [productCategoryInstance:productCategoryInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
        def productCategoryInstance=ProductCategory.get(params.id)

        if(productCategoryInstance){
            [productCategoryInstance:productCategoryInstance]
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

            def productCategoryInstance=ProductCategory.get(params.id)

            if(productCategoryInstance) {
                productCategoryInstance.delete(flush: true)
                def homeDir = new File(System.getProperty("user.home"))
                File coverImage= new File(homeDir,"yarsaa/${productCategoryInstance.coverImageName}")
                File menuImage1=  new File(homeDir,"yarsaa/${productCategoryInstance.menuImage1}")
                File menuImage2=  new File(homeDir,"yarsaa/${productCategoryInstance.menuImage2}")
                coverImage.delete();
                menuImage1.delete()
                menuImage2.delete()
                flash.message="Successfully deleted."
            }
        else{
            flash.message="Unable to delete the already deleted item."


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
