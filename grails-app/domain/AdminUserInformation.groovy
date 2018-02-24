
class AdminUserInformation {
    String email
    String password
    String firstName
    String lastName
    String role
    static constraints = {
        email unique: true
        role nullable: true
    }
    static mapping = {
        sort id: "desc"
    }

}
