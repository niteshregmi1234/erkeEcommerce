import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductBrandController extends BaseController{
static allowedMethods = [save: 'POST',uploadLogoImage: 'POST',editLogoImage: 'POST']
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");

    def list() {
        try{
        def productBrandList=ProductBrand.list()
        render(view: "list",model: [productBrandList:productBrandList])
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
            def productBrandInstance=new ProductBrand()
            productBrandInstance.brandName=params.brandName
            productBrandInstance.logoName=uploadLogoImage()
            productBrandInstance.isTop=params.isTop as byte

            productBrandInstance.statusShow=params.statusShow as byte
            productBrandInstance.brandDescription=params.brandDescription

            productBrandInstance.save(flush: true)
            redirect(action: "show" ,id:productBrandInstance.id)
        }
        else{
            def productBrandInstance=ProductBrand.get(params.id)
            if(productBrandInstance){
            productBrandInstance.brandName=params.brandName
                productBrandInstance.logoName=editLogoImage(productBrandInstance.logoName)
                productBrandInstance.isTop=params.isTop as byte
                productBrandInstance.statusShow=params.statusShow as byte
                productBrandInstance.brandDescription=params.brandDescription
                productBrandInstance.save(flush: true)
            redirect(action: "show" ,id:productBrandInstance.id)
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
    def uploadLogoImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("logoName")
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
    def editLogoImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("logoName")
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
        def productBrandInstance=ProductBrand.get(id)
        if(productBrandInstance){
            [productBrandInstance:productBrandInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try{
        def productBrandInstance=ProductBrand.get(params.id)

        if(productBrandInstance){
            [productBrandInstance:productBrandInstance]
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
        def productBrandInstance=ProductBrand.get(params.id)


        if(productBrandInstance) {
                productBrandInstance.delete(flush: true)
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
