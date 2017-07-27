

class EndUserInformation {
String firstName
    String lastName
    String phone
    String address
    String city
    String email
    String password
    static constraints = {
        email unique: true
    }
}
