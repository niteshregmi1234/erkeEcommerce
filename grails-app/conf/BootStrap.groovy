class BootStrap {
    def init = { servletContext ->
        def productList=Product.list()
        for(Product product:productList){
            product.soldNumbers=0
            product.save(flush: true)
        }
    }
    def destroy = {
    }
}
