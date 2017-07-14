import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.util.regex.Matcher
import java.util.regex.Pattern

class ProductCategoryController {
    final static Pattern PATTERN = Pattern.compile("(.*?)(?:\\((\\d+)\\))?(\\.[^.]*)?");

    def list() {
def productCategoryList=ProductCategory.list()
        render(view: "list",model: [productCategoryList:productCategoryList])
    }
    def create(){

    }
    def save(){
        if(!params.id){
            def productCategoryInstance=new ProductCategory()
            productCategoryInstance.categoryName=params.categoryName
            productCategoryInstance.statusShow=params.statusShow as boolean
            productCategoryInstance.coverImageName=uploadCoverImage()
            productCategoryInstance.shoppingImageName=uploadShoppingImage()
            productCategoryInstance.menuImage1=uploadMenuImage1()
            productCategoryInstance.menuImage2=uploadMenuImage2()
            productCategoryInstance.menuImage3=uploadMenuImage3()

            productCategoryInstance.save(flush: true)
            redirect(action: "show" ,id:productCategoryInstance.id)
        }
        else{
            def productCategoryInstance=ProductCategory.get(params.id)

            productCategoryInstance.categoryName=params.categoryName
            productCategoryInstance.statusShow=params.statusShow as boolean
            productCategoryInstance.coverImageName=editCoverImage(productCategoryInstance.coverImageName)
            productCategoryInstance.shoppingImageName=editShopImage(productCategoryInstance.shoppingImageName)
            productCategoryInstance.menuImage1=editMenu1Image(productCategoryInstance.menuImage1)
            productCategoryInstance.menuImage2=editMenu2Image(productCategoryInstance.menuImage2)
            productCategoryInstance.menuImage3=editMenu3Image(productCategoryInstance.menuImage3)

            productCategoryInstance.save(flush: true)

            redirect(action: "show" ,id:productCategoryInstance.id)
        }
    }
    def uploadMenuImage1(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage1")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName

    }
    def uploadMenuImage2(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage2")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName

    }
    def uploadMenuImage3(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage3")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName

    }
    def editMenu1Image(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage1")
        if(file.size>0){
            File fileOld= new File("web-app/images/categoryImage/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName}
        else{
            return imageNameOld
        }

    }
    def editMenu2Image(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage2")
        if(file.size>0){
            File fileOld= new File("web-app/images/categoryImage/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName}
        else{
            return imageNameOld
        }

    }
    def editMenu3Image(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("menuImage3")
        if(file.size>0){
            File fileOld= new File("web-app/images/categoryImage/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName}
        else{
            return imageNameOld
        }

    }

    def uploadShoppingImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("shoppingImageName")
        String fileName = file.originalFilename
        abc:
        boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
        def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
        file.transferTo(new File(realFilePath))
        def imageName = fileName
        return imageName

    }
    def uploadCoverImage(){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName

    }
    def editShopImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("shoppingImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/categoryImage/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName}
        else{
            return imageNameOld
        }

    }

    def editCoverImage(String imageNameOld){
        def mp = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mp.getFile("coverImageName")
        if(file.size>0){
            File fileOld= new File("web-app/images/categoryImage/${imageNameOld}")
            fileOld.delete();
            String fileName = file.originalFilename
            abc:
            boolean check = new File("web-app/images/categoryImage", fileName).exists()
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
            def realFilePath = grailsApplication.mainContext.servletContext.getRealPath("/images/categoryImage/${fileName}")
            file.transferTo(new File(realFilePath))
            def imageName = fileName
            return imageName}
        else{
            return imageNameOld
        }

    }
    def show(Long id){
        def productCategoryInstance=ProductCategory.get(id)

        if(productCategoryInstance){
            [productCategoryInstance:productCategoryInstance]}
        else{
            redirect(action: "list")
        }
    }
    def edit(){
        def productCategoryInstance=ProductCategory.get(params.id)

        if(productCategoryInstance){
            [productCategoryInstance:productCategoryInstance]
        }
        else{
            redirect(action: "list")
        }
    }
    def delete(){
        def productCategoryInstance=ProductCategory.get(params.id)



        if(productCategoryInstance) {
            try{
                File coverImage= new File("web-app/images/categoryImage/${productCategoryInstance.coverImageName}")
                File shopImage= new File("web-app/images/categoryImage/${productCategoryInstance.shoppingImageName}")
                File menuImage1= new File("web-app/images/categoryImage/${productCategoryInstance.menuImage1}")
                File menuImage2= new File("web-app/images/categoryImage/${productCategoryInstance.menuImage2}")
                File menuImage3= new File("web-app/images/categoryImage/${productCategoryInstance.menuImage3}")

                coverImage.delete();
                shopImage.delete();
                menuImage1.delete()
                menuImage2.delete()
                menuImage3.delete()
                productCategoryInstance.delete(flush: true)
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
