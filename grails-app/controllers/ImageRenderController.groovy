import liquibase.util.file.FilenameUtils
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import javax.mail.internet.InternetAddress
import java.awt.image.BufferedImage
import java.util.regex.Matcher
import java.util.regex.Pattern


class ImageRenderController {
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");
    def renderImage() {
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
 }
        catch (Exception e){

        }
    }


}