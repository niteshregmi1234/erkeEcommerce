import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class CoverImageController extends BaseController{
    static allowedMethods = [checkPhoto: 'POST',editCoverImage: 'POST',uploadCoverImage: 'POST',save: 'POST']
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
    catch (Exception  e){

    }
}
    def list() {
        try {


        def coverImageList=CoverImage.list()
        render(view: "list",model: [coverImageList:coverImageList])}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){
            def coverImageInstance=new CoverImage()
            coverImageInstance.imageName=uploadCoverImage()
            coverImageInstance.statusShow=params.statusShow as byte
            coverImageInstance.slidePlace=params.slidePlace
            coverImageInstance.save(flush: true)
            redirect(action: "show" ,id:coverImageInstance.id)
        }
        else{
            def coverImageInstance=CoverImage.get(params.id)
            if(coverImageInstance){
            coverImageInstance.imageName=editCoverImage(coverImageInstance.imageName)
            coverImageInstance.statusShow=params.statusShow as byte
            coverImageInstance.slidePlace=params.slidePlace
            coverImageInstance.save(flush: true)
            redirect(action: "show" ,id:coverImageInstance.id)}
            else{
                redirect(action: "notfound",controller: "errorPage")

            }
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def uploadCoverImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
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
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
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
        def coverImageInstance=CoverImage.get(id)
        if(coverImageInstance){
            [coverImageInstance:coverImageInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def edit(){
        try{
        def coverImageInstance=CoverImage.get(params.id)
        if(coverImageInstance){
            [coverImageInstance:coverImageInstance]
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
        def coverImageInstance=CoverImage.get(params.id)
        if(coverImageInstance) {
            coverImageInstance.delete(flush: true)

            def imageName=coverImageInstance.imageName
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
