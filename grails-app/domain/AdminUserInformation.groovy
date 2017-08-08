
class AdminUserInformation {
    String email
    String password
    String firstName
    String lastName
    static constraints = {
        email unique: true
    }
}