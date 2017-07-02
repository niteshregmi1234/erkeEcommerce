import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class SpecialBrandController {

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


    def save() {
        def specialBrandInstance=SpecialBrand.get(params.id)
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
        redirect(action: "show",id:specialBrandInstance.id)

    }
    def editBrandSub1Image(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("brandSub1ImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/otherStuffs/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/otherStuffs", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/otherStuffs/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }
    def editBrandMainImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("brandMainImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/otherStuffs/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/otherStuffs", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/otherStuffs/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }

    def editBrandSub2Image(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("brandSub2ImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/otherStuffs/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/otherStuffs", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/otherStuffs/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }
    def show(Long id){
        def specialBrandInstance=SpecialBrand.get(id)
        [specialBrandInstance:specialBrandInstance]}

    def edit(){

        def specialBrandInstance=SpecialBrand.get(params.id)
        [specialBrandInstance:specialBrandInstance]
    }
}
