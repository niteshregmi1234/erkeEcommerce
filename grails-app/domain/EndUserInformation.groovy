

class EndUserInformation {
    CustomerPersonalDetails customerPersonalDetails
    String email
    String password
    static constraints = {
        email unique: true
    }
}
