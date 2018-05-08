import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class AboutUsController extends BaseController {
    static allowedMethods = [checkPhoto: 'POST', save: 'POST', updateAboutUs1Image: 'POST', updateAboutUs2Image: 'POST', updateAboutUs3Image: 'POST', updateAboutUs4Image: 'POST', updateBackgroundImage: 'POST', updateCoverImage: 'POST', updateQuoteLeftImage: 'POST', updateQuoteRightImage: 'POST', updateSpecialProductSubCategoryImage: 'POST', updateVideoDescriptionImage: 'POST']
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");

    def checkPhoto() {
        try{
            if(session.adminUser){
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def Image = request.getFile('Image')

        def checkFile
        Image trueImage = ImageIO.read(Image.getInputStream());

        if (trueImage == null) {

            checkFile = "Photo bad format"
            render checkFile
        } else {
            checkFile = "perfect"
            render checkFile
        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch (Exception e){

        }
    }


    def save() {
        try{
            if(session.adminUser){
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def aboutUsInstance = AboutUs.get(params.id)
        if (aboutUsInstance) {
            aboutUsInstance.aboutUsDescription = params.aboutUsDescription
            aboutUsInstance.quote = params.quote

            aboutUsInstance.videoDescription = params.videoDescription
//            aboutUsInstance.specialProduct1 = Product.get(params.specialProduct1)
//            aboutUsInstance.specialProduct2 = Product.get(params.specialProduct2)
            aboutUsInstance.specialProductSubCategory = ProductSubCategory.get(params.specialProductSubCategory)
            aboutUsInstance.coverImage = updateCoverImage(aboutUsInstance.coverImage)
            aboutUsInstance.aboutUs1Image = updateAboutUs1Image(aboutUsInstance.aboutUs1Image)
            aboutUsInstance.aboutUs2Image = updateAboutUs2Image(aboutUsInstance.aboutUs2Image)
            aboutUsInstance.aboutUs3Image = updateAboutUs3Image(aboutUsInstance.aboutUs3Image)
            aboutUsInstance.aboutUs4Image = updateAboutUs4Image(aboutUsInstance.aboutUs4Image)
            aboutUsInstance.quoteLeftImage = updateQuoteLeftImage(aboutUsInstance.quoteLeftImage)
            aboutUsInstance.quoteRightImage = updateQuoteRightImage(aboutUsInstance.quoteRightImage)
            aboutUsInstance.videoName = params.videoName
            aboutUsInstance.videoDescrptionImage = updateVideoDescriptionImage(aboutUsInstance.videoDescrptionImage)
            aboutUsInstance.specialProductSubCategoryImage = updateSpecialProductSubCategoryImage(aboutUsInstance.specialProductSubCategoryImage)
            aboutUsInstance.backgroundImage = updateBackgroundImage(aboutUsInstance.backgroundImage)
            aboutUsInstance.save(flush: true)
            redirect(action: "show")
        } else {
            redirect(action: "notfound", controller: "errorPage")

        }}
            else{
                redirect(action: "adminLoginForm",controller: "login")

            }
        }}
        catch(Exception e){
            redirect(action: "notfound", controller: "errorPage")

        }

    }

    def updateCoverImage(String imageNameOld) {
        if (session.adminUser) {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImage")
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
            }
        }
    }
    def updateAboutUs1Image(String imageNameOld) {
        if(session.adminUser){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("aboutUs1Image")
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
        }
    }}

    def updateAboutUs2Image(String imageNameOld) {
        if (session.adminUser) {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("aboutUs2Image")
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
            }
        }
    }
    def updateAboutUs3Image(String imageNameOld) {
        if(session.adminUser){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("aboutUs3Image")
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
        }    }}

    def updateAboutUs4Image(String imageNameOld) {
        if (session.adminUser) {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("aboutUs4Image")
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
            }
        }
    }
    def updateQuoteLeftImage(String imageNameOld) {
        if (session.adminUser) {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("quoteLeftImage")
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
            }
        }
    }
    def updateQuoteRightImage(String imageNameOld) {
        if (session.adminUser) {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("quoteRightImage")
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
            }
        }
    }
    def updateVideoDescriptionImage(String imageNameOld) {
     if(session.adminUser){
        if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

            def mp = (MultipartHttpServletRequest) request
            CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("videoDescrptionImage")
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
        }    }}

    def updateSpecialProductSubCategoryImage(String imageNameOld) {
        if (session.adminUser) {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("specialProductSubCategoryImage")
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
            }
        }
    }
    def updateBackgroundImage(String imageNameOld) {
        if (session.adminUser) {
            if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                def mp = (MultipartHttpServletRequest) request
                CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("backgroundImage")
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
            }
        }
    }
    def show() {
        try{
            if(session.adminUser) {
                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def aboutUsInstance = AboutUs.list()[0]
                    if (aboutUsInstance) {

                        render(view: "show", model: [aboutUsInstance: aboutUsInstance])
                    } else {
                        redirect(action: "notfound", controller: "errorPage")
                    }
                } else {
                    redirect(action: "adminLoginForm", controller: "login")

                }
            }        }
        catch (Exception e){
            redirect(action: "notfound", controller: "errorPage")

        }
    }

    def edit() {
        try{
            if(session.adminUser) {

                if (session.adminUser.role == "CEO" || session.adminUser.role == "MD" || session.adminUser.role == "Content Manager") {

                    def aboutUsInstance = AboutUs.get(params.id)
                    if (aboutUsInstance) {
                        [aboutUsInstance: aboutUsInstance]
                    } else {
                        redirect(action: "notfound", controller: "errorPage")
                    }

                } else {
                    redirect(action: "adminLoginForm", controller: "login")
                }
            }        }
        catch (Exception e){
            redirect(action: "notfound", controller: "errorPage")

        }
    }

}