import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class CompanyInformationController {

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
        def companyInformationInstance=CompanyInformation.get(params.id)
        companyInformationInstance.companyName=params.companyName
        companyInformationInstance.emailAddress=params.emailAddress
        companyInformationInstance.location1=params.location1
        companyInformationInstance.location2=params.location2
        companyInformationInstance.location3=params.location3
        companyInformationInstance.location4=params.location4

        companyInformationInstance.mobileNUmber=params.mobileNumber
        companyInformationInstance.proprietorName=params.proprietorName
        companyInformationInstance.phoneNumber=params.phoneNumber
        companyInformationInstance.descriptionWhereWeAre=params.descriptionWhereWeAre

        companyInformationInstance.logoImageName=editLogoImage(companyInformationInstance.logoImageName)
        companyInformationInstance.coverImageName=editcoverImage(companyInformationInstance.coverImageName)
        companyInformationInstance.shopInsideViewImageName=editshopInsideViewImage(companyInformationInstance.shopInsideViewImageName)
        companyInformationInstance.mapImageName=editMapImage(companyInformationInstance.mapImageName)

        companyInformationInstance.save(flush: true)
        redirect(action: "show",id:companyInformationInstance.id)

    }
    def editcoverImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/companyInformation/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/companyInformation", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/companyInformation/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }
    def editshopInsideViewImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("shopInsideViewImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/companyInformation/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/companyInformation", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/companyInformation/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }
    def editMapImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("mapImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/companyInformation/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/companyInformation", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/companyInformation/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }

    def editLogoImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("logoImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/companyInformation/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/companyInformation", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/companyInformation/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }
    def show(Long id){
        def companyInformationInstance=CompanyInformation.get(id)


            [companyInformationInstance:companyInformationInstance]}

    def edit(){
        def companyInformationInstance=CompanyInformation.get(params.id)


            [companyInformationInstance:companyInformationInstance]


    }


}
