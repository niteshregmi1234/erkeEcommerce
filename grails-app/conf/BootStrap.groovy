class BootStrap {
    def init = { servletContext ->

//new DivPosition(divPositionName: 'side of top brands div').save(flush: true)
//        new DivPosition(divPositionName: "side of hot this week div").save(flush: true)
//        new DivPosition(divPositionName: "side of top sales div").save(flush: true)
//        new DivPosition(divPositionName: "below of top sales div:first Ad").save(flush: true)
//        new DivPosition(divPositionName: "below of top sales div:second Ad").save(flush: true)
//        new DivPosition(divPositionName: "below of top sales div:third Ad").save(flush: true)
//        new DivPosition(divPositionName: 'below of top sales div:fourth Ad').save(flush: true)
//        new DivPosition(divPositionName: "below of top sales div:fifth Ad").save(flush: true)
//        new DivPosition(divPositionName: "below of top sales div:sixth Ad").save(flush: true)
//        new DivPosition(divPositionName: "above top brand div 1400 x 100").save(flush: true)
//        new DivPosition(divPositionName: "above hot this week div 1400 x 100").save(flush: true)
//        new DivPosition(divPositionName: "above top sales div 1400 x 100").save(flush: true)
//        new DivPosition(divPositionName: "at the bottom 1400 x 100").save(flush: true)
        def productList=Product.list()
        for(Product product:productList){
            product.priorityNumber=Product.list()[Product.list().size()-1].id
            product.save(flush: true)
        }
    }
    def destroy = {
    }
}
