import grails.converters.JSON

class EndUserController {

    def endUserHome() {
        def upCoverImageList=CoverImage.findAllByStatusShowAndSlidePlace(true,"UP")
        def downCoverImageList=CoverImage.findAllByStatusShowAndSlidePlace(true,"DOWN")
        def latestProductList=Product.findAllByIsLatest(true)
        def specialBrandInstance=SpecialBrand.list()[0]
        def backgroundImageInstance=BackgroundImage.list()
        [backgroundImageInstance:backgroundImageInstance,upCoverImageList:upCoverImageList,downCoverImageList:downCoverImageList,latestProductList:latestProductList,specialBrandInstance:specialBrandInstance]
    }
    def fetchUrl(){
        def seasonManagementInstance=SeasonManagement.list()[0].seasons.imageName
        def backgroundImage1=BackgroundImage.list()[0].imageName
        def backgroundImage2=BackgroundImage.list()[1].imageName
        def imageUrl1="../images/seasonsImage/"+seasonManagementInstance;
        def imageUrl2="images/seasonsImage/"+seasonManagementInstance;
        def imageUrl3="../images/otherStuffs/"+backgroundImage1;
        def imageUrl4="images/otherStuffs/"+backgroundImage1;
        def imageUrl5="../images/otherStuffs/"+backgroundImage2;
        def imageUrl6="images/otherStuffs/"+backgroundImage2;

        def totalImageUrl=[imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5,imageUrl6]
render totalImageUrl as JSON
    }
    def productDetails(Long id){
        def productInstance=Product.get(id)
        render(view:"single_Product",model: [productInstance:productInstance])
    }
}
