import liquibase.util.file.FilenameUtils
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import javax.mail.internet.InternetAddress
import java.awt.image.BufferedImage
import java.util.regex.Matcher
import java.util.regex.Pattern


class AdminHomeController {
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");

    def adminHome() {

    }
    def edit(Long id){
      def test=Test.get(id)
        [test:test]
    }


    def save() {
        if(!params.id){
        def test = new Test()
        test.name=params.name
        test.role=params.role
        test.imageName=uploadImage()
        test.save(flush: true)
        redirect(action: "show", params: [testId:test.testId])
    }
        else{
            def test = Test.get(params.id)
            test.name=params.name
            test.role=params.role
            test.imageName=editImage(test.imageName)
            test.save(flush: true)
            redirect(action: "show", params: [testId:test.testId])
        }
    }
    def renderImage = {
        try {


if(params.imageName!=null) {
    def homeDir = new File(System.getProperty("user.home"))
    String profileImagePath = "/" + homeDir + "/yarsaa/"
    String image = params.imageName // or whatever name you saved in your db
    String extension = FilenameUtils.getExtension(image)
    File imageFile = new File(profileImagePath + image);

    BufferedImage originalImage = ImageIO.read(imageFile);

    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    if (extension.equalsIgnoreCase("jpg")) {
        ImageIO.write(originalImage, "jpg", baos);
    } else if (extension.equalsIgnoreCase("jpeg")) {
        ImageIO.write(originalImage, "jpeg", baos);

    } else if (extension.equalsIgnoreCase("bmp")) {
        ImageIO.write(originalImage, "bmp", baos);

    } else if (extension.equalsIgnoreCase("png")) {
        ImageIO.write(originalImage, "png", baos);

    } else if (extension.equalsIgnoreCase("gif")) {
        ImageIO.write(originalImage, "gif", baos);

    } else {
        ImageIO.write(originalImage, "jpg", baos);

    }

    byte[] imageInByte = baos.toByteArray();

    if (extension.equalsIgnoreCase("jpg")) {
        response.contentType = 'image/jpg'
    } else if (extension.equalsIgnoreCase("jpeg")) {
        response.contentType = 'image/jpeg'
    } else if (extension.equalsIgnoreCase("bmp")) {
        response.contentType = 'image/bmp'
    } else if (extension.equalsIgnoreCase("png")) {
        response.contentType = 'image/png'
    } else if (extension.equalsIgnoreCase("gif")) {
        response.contentType = 'image/gif'
    } else {
        ImageIO.write(originalImage, "jpg", baos);

    }

    response.outputStream << imageInByte
    response.outputStream.flush()
}
        else{
    redirect(action: "notfound",controller: "errorPage")
}}
        catch (Exception e){

        }
    }

    def editImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("image")
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
def uploadImage(){
    def mp = (MultipartHttpServletRequest) request
    CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("image")
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
    def show(String testId) {
        def test = Test.findByTestId(testId)
        render(view: "show", model: [test: test])
    }

    def formTest() {

    }
    def list(){
        def testList=Test.list()
        [testList:testList]
    }
    def showNow(Long id4,String id3){
        def test=Test.findByTestIdAndId(id3,id4)
        render(view: "show", model: [test: test])

    }
    def test(){
        boolean isValid=false
        try {
            InternetAddress internetAddress=new InternetAddress("rockingguyhemansdasadsadasdsadsa.hg@gmail.com")
            internetAddress.validate()
            isValid=true
            print "yes"
        }
        catch (Exception e){
            isValid=false
            println "no"
        }
    }
}