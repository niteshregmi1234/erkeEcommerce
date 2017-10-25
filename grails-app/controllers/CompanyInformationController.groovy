import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class CompanyInformationController extends BaseController{
static  allowedMethods = [save:'POST',checkPhoto: 'POST',editcoverImage: 'POST',editLogoImage: 'POST',editshopInsideViewImage: 'POST']
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
    def checkPhoto(){
        try{
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
        catch (Exception e){

        }
    }


    def save() {
        try{
        def companyInformationInstance=CompanyInformation.get(params.id)
        if(companyInformationInstance){
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
            companyInformationInstance.offer=params.offer
            companyInformationInstance.logoImageName=editLogoImage(companyInformationInstance.logoImageName)
        companyInformationInstance.coverImageName=editcoverImage(companyInformationInstance.coverImageName)
        companyInformationInstance.shopInsideViewImageName=editshopInsideViewImage(companyInformationInstance.shopInsideViewImageName)
            companyInformationInstance.save(flush: true)
        redirect(action: "show")}
        else{
            redirect(action: "notfound",controller: "errorPage")
        }}
        catch (Exception e){
            print e
            redirect(action: "notfound",controller: "errorPage")

        }

    }
    def editLogoImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("logoImageName")
        def homeDir = new File(System.getProperty("user.home"))
        File theDir = new File(homeDir,"yarsaa");
        if (! theDir.exists()){
            theDir.mkdir();
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

    def editcoverImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        def homeDir = new File(System.getProperty("user.home"))
        File theDir = new File(homeDir,"yarsaa");
        if (! theDir.exists()){
            theDir.mkdir();
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
    def editshopInsideViewImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("shopInsideViewImageName")
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

    def show(){
        try{
        def companyInformationInstance=CompanyInformation.list()[0]
        if(companyInformationInstance){
            render(view: "show",model:[companyInformationInstance:companyInformationInstance] )

        }
    else{
            redirect(action: "notfound",controller: "errorPage")
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }

    def edit(){
        try {

        def companyInformationInstance=CompanyInformation.get(params.id)

if(companyInformationInstance){
            [companyInformationInstance:companyInformationInstance]}
        else{
    redirect(action: "notfound",controller: "errorPage")



    }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }



}
