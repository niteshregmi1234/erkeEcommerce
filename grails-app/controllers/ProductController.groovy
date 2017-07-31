import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import java.awt.Image
import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductController {
    static allowedMethods = [checkPhoto: 'POST',save: 'POST',uploadSpecialImage: 'POST',editSpecialImage: 'POST',upLoadFrontImage: 'POST',editFrontImage: 'POST',uploadSideImage: 'POST',editSideImage: 'POST',uploadBackImage: 'POST',editBackImage: 'POST']
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
    def list() {
        try{
        def productList=Product.list()
        render(view: "list",model: [productList:productList])}
        catch (Exception e){
            redirect(action: "notfound",controller:"errorPage")
        }
    }
    def create(){

    }
    def save(){
        try{
        if(!params.id){
            def product=new Product()
                      product.productColor=ProductColor.get(params.productColor)
            product.productDetails=ProductDetails.get(params.productDetails)
            product.isFeatured=params.isFeatured as boolean
            product.isLatest=params.isLatest as boolean
            product.seasons=SeasonManagement.list()[1].seasons
            product.productSpecificationName=product.productDetails.productName+"-"+product.productColor.colorName
            product.frontImageName=upLoadFrontImage()
            product.sideImageName=uploadSideImage()
            product.backImageName=uploadBackImage()
            product.specialImageName=uploadSpecialImage()
            product.save(flush: true)
            redirect(action: "show" ,id:product.id)
        }
        else{
            def product=Product.get(params.id)
            if(product){
            product.productColor=ProductColor.get(params.productColor)
            product.productDetails=ProductDetails.get(params.productDetails)
            product.isFeatured=params.isFeatured as boolean
            product.isLatest=params.isLatest as boolean
            product.productSpecificationName=product.productDetails.productName+"-"+product.productColor.colorName

            product.frontImageName=editFrontImage(product.frontImageName)
            product.sideImageName=editSideImage(product.sideImageName)
            product.backImageName=editBackImage(product.backImageName)
            product.specialImageName=editSpecialImage( product.specialImageName)

            product.save(flush: true)
            redirect(action: "show" ,id:product.id)}
            else{
         redirect(action: "notfound",controller: "errorPage")
            }
        }
        }
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")
        }
    }
    def bloodHound(){
        def criteria = ProductDetails.createCriteria();
        def productDetails = criteria.list {
            or {

                like("productName", "%" + params.keyCode + "%")
                like("briefDescription", "%" + params.keyCode + "%")

            }
        }
        print productDetails
        def productNameList=[]
        for(int i=0;i<productDetails.size();i++){
            productNameList.add(productDetails[i].productName)
        }
        print productNameList

    }

    def uploadSpecialImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("specialImageName")
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
    def editSpecialImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("specialImageName")
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

    def editFrontImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("frontImageName")
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
    def editBackImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("backImageName")
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
    def editSideImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("sideImageName")
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
    def upLoadFrontImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("frontImageName")
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
    def uploadSideImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("sideImageName")
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
    def uploadBackImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("backImageName")
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
    def show(Long id){
        try {


        def productInstance=Product.get(id)

        if(productInstance){
            [productInstance:productInstance]}
        else{
            redirect(action: "list")
        }}
        catch (Exception e){
            redirect(action: "notfound",controller: "errorPage")

        }
    }
    def edit(){
        try {


        def productInstance=Product.get(params.id)

        if(productInstance){
            [productInstance:productInstance]
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
        def productInstance=Product.get(params.id)


        if(productInstance) {
            productInstance.delete(flush: true)
            def homeDir = new File(System.getProperty("user.home"))
            File frontImage= new File(homeDir,"yarsaa/${productInstance.frontImageName}")
                File backImage= new File(homeDir,"yarsaa/${productInstance.backImageName}")
                File sideImage= new File(homeDir,"yarsaa/${productInstance.sideImageName}")
            File specialImage= new File(homeDir,"yarsaa/${productInstance.specialImageName}")

            frontImage.delete();
                backImage.delete();
                sideImage.delete();
            specialImage.delete()
            flash.message="Successfully deleted."
        }
        else{
            flash.message="Unable to delete the already deleted item."


        }
        redirect(action: "list")

    }
        catch (DataIntegrityViolationException e) {
            flash.message = "Sorry! cannot delete this data."
            redirect(action: "list")
        }
        catch (Exception e) {
            redirect(action: "notfound", controller: "errorPage")

        }
    }
}


