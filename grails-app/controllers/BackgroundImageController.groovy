import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class BackgroundImageController {
static allowedMethods = [checkPhoto: 'POST',save: 'POST',editBackgroundImage: 'POST']
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

def list(){
    try {
        def backgroundImageList= BackgroundImage.list()
        [backgroundImageList:backgroundImageList]
    }
  catch (Exception e){
      redirect(action: "notfound", controller: "errorPage")
  }
}
    def save() {
        try{
        def backgroundImageInstance=BackgroundImage.get(params.id)
        if(backgroundImageInstance){
        backgroundImageInstance.imageName=editBackgroundImage(backgroundImageInstance.imageName)
        backgroundImageInstance.save(flush: true)
        redirect(action: "show",id:backgroundImageInstance.id)}
        else{
            redirect(action: "notfound", controller: "errorPage")

        }}
        catch (Exception e){
            redirect(action: "notfound", controller: "errorPage")

        }

    }
    def editBackgroundImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("imageName")
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
           try{
        def backgroundImageInstance=BackgroundImage.get(id)
           if(backgroundImageInstance){
        [backgroundImageInstance:backgroundImageInstance]}
    else{
        redirect(action: "notfound", controller: "errorPage")

    }}
           catch (Exception e){
               redirect(action: "notfound", controller: "errorPage")

           }
           }

    def edit(Long id){
        try {

        def backgroundImageInstance=BackgroundImage.get(id)
        if(backgroundImageInstance){
        [backgroundImageInstance:backgroundImageInstance]}
        else{
            redirect(action: "notfound", controller: "errorPage")

        }
        }
        catch (Exception e){
            redirect(action: "notfound", controller: "errorPage")

        }

    }
}

