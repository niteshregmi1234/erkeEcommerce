class CustomerPersonalDetails {
String firstName
    String lastName
    String companyName
    String country
    String cumpolsoryAddress
    String optionalAddress
    String townOrCity
    String mobileOrPhoneCumpolsory
    String mobileOrPhoneOptional
    static constraints = {
        companyName nullable: true
        optionalAddress nullable: true
        mobileOrPhoneOptional nullable: true
    }
}
