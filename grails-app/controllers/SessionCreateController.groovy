
class SessionCreateController {


    def beforeInterceptor = [action: this.&sessionCreate]
//    def beforeInterceptor=[action: this.&auth,except:"adminLoginForm"]
    def sessionCreate() {
        if (session.cart == null) {
            List<CartWithoutEndUser> cartWithoutEndUserList = new ArrayList<>()
            session.cart = cartWithoutEndUserList
        }

    }
}