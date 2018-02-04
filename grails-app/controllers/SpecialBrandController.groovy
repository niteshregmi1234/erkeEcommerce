import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class SpecialBrandController extends BaseController{
static allowedMethods = [checkPhoto: "POST",save: "POST",editBrandMainImage: "POST",editBrandSub1Image: "POST",editBrandSub2Image: "POST"]
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
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

        else {
            checkFile = "perfect"
            render checkFile
        }        }
        else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){

        }
    }


    def save() {
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def specialBrandInstance=SpecialBrand.get(params.id)
        if(specialBrandInstance){
        specialBrandInstance.productBrand=ProductBrand.get(params.productBrand)
        specialBrandInstance.brandMainImageName=editBrandMainImage(specialBrandInstance.brandMainImageName)
        specialBrandInstance.descriptionMainImage=params.descriptionMainImage
        specialBrandInstance.brandSub1ImageName=editBrandSub1Image(specialBrandInstance.brandSub1ImageName)
        specialBrandInstance.titleForSub1Image=params.titleForSub1Image
        specialBrandInstance.descriptionSub1Image=params.descriptionSub1Image
        specialBrandInstance.brandSub2ImageName=editBrandSub2Image(specialBrandInstance.brandSub2ImageName)
        specialBrandInstance.titleForSub2Image=params.titleForSub2Image
        specialBrandInstance.descriptionSub2Image=params.descriptionSub2Image
        specialBrandInstance.save(flush: true)
        redirect(action: "show")}
        else {
            redirect(action: "notfound", controller: "errorPage")
        }        }
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }

    }
    def editBrandSub1Image(String imageNameOld){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("brandSub1ImageName")
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
    def editBrandMainImage(String imageNameOld){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("brandMainImageName")
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

    def editBrandSub2Image(String imageNameOld){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("brandSub2ImageName")
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
    def show(){
        try{
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def specialBrandInstance=SpecialBrand.list()[0]
        if(specialBrandInstance) {
            [specialBrandInstance: specialBrandInstance]
        }
        else {
            redirect(action: "notfound",controller: "errorPage")
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
try{
    if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

        def specialBrandInstance=SpecialBrand.get(params.id)
        if(specialBrandInstance) {

            [specialBrandInstance: specialBrandInstance]
        }
    else {
            redirect(action: "notfound",controller: "errorPage")

        }}
    else{
        redirect(action: "adminLoginForm",controller: "login")
    }
}
    catch (Exception e){
        redirect(action: "notfound",controller: "errorPage")

    }
    }
}
