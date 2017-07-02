import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class SeasonsController {

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
        def seasonsList=Seasons.list()
        render(view: "list",model: [seasonsList:seasonsList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def seasonsInstance=new Seasons()
            seasonsInstance.seasonName=params.seasonName
            seasonsInstance.greetings=params.greetings
            seasonsInstance.descriptionOfSeason=params.descriptionOfSeason
            seasonsInstance.askingForShopping=params.askingForShopping
            seasonsInstance.imageName=uploadSeasonImage()
            seasonsInstance.save(flush: true)
            redirect(action: "show" ,id:seasonsInstance.id)
        }
        else{
            def seasonsInstance=Seasons.get(params.id)
            seasonsInstance.seasonName=params.seasonName
            seasonsInstance.greetings=params.greetings
            seasonsInstance.descriptionOfSeason=params.descriptionOfSeason
            seasonsInstance.askingForShopping=params.askingForShopping
            seasonsInstance.imageName=editSeasonImage(seasonsInstance.imageName)
            seasonsInstance.save(flush: true)
            redirect(action: "show" ,id:seasonsInstance.id)        }
    }
    def uploadSeasonImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/seasonsImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/seasonsImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName
    }
    def editSeasonImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/seasonsImage/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/seasonsImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/seasonsImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName
        }
        else{
            return imageNameOld
        }
    }
    def show(Long id){
        def seasonsInstance=Seasons.get(id)


        if(seasonsInstance){
            [seasonsInstance:seasonsInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def seasonsInstance=Seasons.get(params.id)


        if(seasonsInstance){
            [seasonsInstance:seasonsInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def seasonsInstance=Seasons.get(params.id)


        if(seasonsInstance) {
            try{
                def imageName=seasonsInstance.imageName
                File file= new File("web-app/images/seasonsImage/${imageName}")
                file.delete();
                seasonsInstance.delete(flush: true)
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
