import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class CoverImageController {
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
    def list() {
        def coverImageList=CoverImage.list()
        render(view: "list",model: [coverImageList:coverImageList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def coverImageInstance=new CoverImage()
            coverImageInstance.imageName=uploadCoverImage()
            coverImageInstance.statusShow=params.statusShow as boolean
            coverImageInstance.slidePlace=params.slidePlace
            coverImageInstance.save(flush: true)
            redirect(action: "show" ,id:coverImageInstance.id)
        }
        else{
            def coverImageInstance=CoverImage.get(params.id)
            coverImageInstance.imageName=editCoverImage(coverImageInstance.imageName)
            coverImageInstance.statusShow=params.statusShow as boolean
            coverImageInstance.slidePlace=params.slidePlace
            coverImageInstance.save(flush: true)
            redirect(action: "show" ,id:coverImageInstance.id)
        }
    }
    def uploadCoverImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/coverImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/coverImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName
    }
    def editCoverImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
        if(file.size>0){
        File fileOld= new File("web-app/images/coverImage/${imageNameOld}")
        fileOld.delete();
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/coverImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/coverImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName
        }
        else{
            return imageNameOld
        }
    }
    def show(Long id){
        def coverImageInstance=CoverImage.get(id)


        if(coverImageInstance){
            [coverImageInstance:coverImageInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def coverImageInstance=CoverImage.get(params.id)

        if(coverImageInstance){
            [coverImageInstance:coverImageInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def coverImageInstance=CoverImage.get(params.id)


        if(coverImageInstance) {
            try{
                def imageName=coverImageInstance.imageName
                File file= new File("web-app/images/coverImage/${imageName}")
                file.delete();
                coverImageInstance.delete(flush: true)
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
