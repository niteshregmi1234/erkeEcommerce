class BootStrap {
    def init = { servletContext ->

//new DivPosition(divPositionName: 'side of top brands div').save(flush: true)
        new DivPosition(divPositionName: "below cover image").save(flush: true)
        new DivPosition(divPositionName: "below latest arrivals").save(flush: true)

        new DivPosition(divPositionName: "above top sales").save(flush: true)

//        def coverImageList=CoverImage.list()
//        for(CoverImage coverImage:coverImageList){
//            coverImage.priorityNumber=CoverImage.list().size()
//
//            coverImage.save(flush: true)
//        }
//        def productBrandList=ProductBrand.list()
//        for(ProductBrand productBrand:productBrandList){
//            productBrand.priorityNumber=ProductBrand.list().size()
//            productBrand.save(flush: true)
//        }
    }
    def destroy = {
    }
}
