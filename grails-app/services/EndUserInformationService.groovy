import grails.converters.JSON
import grails.transaction.Transactional
import javax.crypto.SecretKeyFactory
import javax.crypto.spec.PBEKeySpec
import java.security.NoSuchAlgorithmException
import java.security.SecureRandom
import java.security.spec.InvalidKeySpecException

@Transactional
class EndUserInformationService {
    def getOrderId(List<CartWithoutEndUser> cartList,Map params){
       try{
           def customerPersonalDetails=new CustomerPersonalDetails()
           customerPersonalDetails.firstName=params.firstNameBilling
           customerPersonalDetails.lastName=params.lastNameBilling
           customerPersonalDetails.companyName=params.companyNameBilling
           customerPersonalDetails.country="Nepal"
           customerPersonalDetails.cumpolsoryAddress=params.cumpolsoryAddressBilling
           customerPersonalDetails.optionalAddress=params.optionalAddressBilling
           customerPersonalDetails.townOrCity=params.cityBilling
           customerPersonalDetails.mobileOrPhoneCumpolsory=params.mobileOrPhoneCumpolsoryBilling
           customerPersonalDetails.mobileOrPhoneOptional=params.mobileOrPhoneOptionalBilling
           customerPersonalDetails.save(flush: true)
           if(params.isCreateAccount){
               saveEndUser(customerPersonalDetails,params)
           }
           def date=new Date()
        def orderIdInstance=new OrderId()
        orderIdInstance.email=params.email
           orderIdInstance.orderId="yarsaa/"
        orderIdInstance.save(flush: true)
           def orderId=orderIdInstance.orderId+orderIdInstance.id
           orderIdInstance.orderId=orderId
           orderIdInstance.save(flush: true)
           if(params.isShipping){
               saveShipping(params,orderIdInstance)

           }
           for(CartWithoutEndUser cart:cartList){
            def cartHistoryWithoutEndUserInstance=new CartHistoryWithoutEndUser()
               cartHistoryWithoutEndUserInstance.isFakeOrder=false
               cartHistoryWithoutEndUserInstance.orderId=orderIdInstance
               cartHistoryWithoutEndUserInstance.date=date
               cartHistoryWithoutEndUserInstance.isDelivered=false
               cartHistoryWithoutEndUserInstance.successfulOrderDelFlag=false
               cartHistoryWithoutEndUserInstance.product=cart.product
               cartHistoryWithoutEndUserInstance.quantity=cart.quantity
               cartHistoryWithoutEndUserInstance.productSize=cart.productSize
               cartHistoryWithoutEndUserInstance.customerPersonalDetails=customerPersonalDetails
               cartHistoryWithoutEndUserInstance.save(flush: true)
           }
        return orderId
    }
       catch (Exception e){

       }
    }

    def saveShipping(Map params,OrderId orderId){
        def shippingDetails=new ShippingDetails()
        shippingDetails.firstNameShipping=params.firstNameShipping
        shippingDetails.lastNameShipping=params.lastNameShipping
        shippingDetails.companyNameShipping=params.companyNameShipping
        shippingDetails.cumpolsoryAddressShipping=params.cumpolsoryAddressShipping
        shippingDetails.optionalAddressShipping=params.optionalAddressShipping
        shippingDetails.cityShipping=params.cityShipping
        shippingDetails.orderId=orderId
        shippingDetails.save(flush: true)
    }
//    def cartList(List<CartWithoutEndUser> cartWithoutEndUserList){
//        try{
//        def cartList=Cart.findAllByEndUserInformation(endUserInformation)
//        return cartList
//    }
//        catch (Exception e){
//
//        }
//    }
    def getTotalPriceOfCartList(List<CartWithoutEndUser> cartList){
        try{
        def totalPrice=0
        for(CartWithoutEndUser cart:cartList){
            totalPrice=totalPrice+((cart.productDetails.price*cart.quantity)-(cart.productDetails.discountPercentage*(cart.productDetails.price*cart.quantity)/100))
        }
            return totalPrice
        }
        catch (Exception e){

        }
    }
    def checkLogin(Map params){
        try{
        def obj= JSON.parse(params.array)

        def endUserInformationInstance = EndUserInformation.findByEmail(obj[0])
        def status=false
        if (endUserInformationInstance) {
            status = decryptPassword(obj[1], endUserInformationInstance.password)
        }
        def totalArray=[endUserInformationInstance,status]
return totalArray}
        catch (Exception e){

        }
    }
    def checkEmail(Map params){
        try {
            def isAvailable = false
            def endUserInstance = EndUserInformation.findByEmail(params.email)
            if (!endUserInstance) {
                isAvailable = true

            }
            return isAvailable
        }
        catch (Exception e){

        }
    }
    def saveEndUser(CustomerPersonalDetails customerPersonalDetails,Map params){
        try{
            def endUserInformationInstance = new EndUserInformation()
            endUserInformationInstance.email=params.email
            endUserInformationInstance.password=encryptedPassword(params.password)
            endUserInformationInstance.customerPersonalDetails=customerPersonalDetails
            endUserInformationInstance.save(flush: true)
            return endUserInformationInstance
//            if (endUserInformationInstance.validate()) {
//                endUserInformationInstance.save(flush: true)
//                def message1="you are successfully registered"
//                return message1
//            } else {
//                def message = "Please don't enter already used email "
//                return message
//            }
        }
        catch (Exception e){
        }
    }
    def editEndUserPassword(Map params,EndUserInformation endUserInformation){
        try{
            def status=false
            if(endUserInformation){
                endUserInformation.password = encryptedPassword(params.newPassword)
                status=true
                return status
            }
            else{
                return status
            }
        }
        catch (Exception e){

            return  "serverError"
        }
    }
def editEndUserPersonalDetails(Map params,EndUserInformation endUserInformation){
    try{
        def status=false
        def obj= JSON.parse(params.array)
        if(endUserInformation){
            endUserInformation.firstName =obj[0]
            endUserInformation.lastName =obj[1]
            endUserInformation.phone =obj[2]
            endUserInformation.address =obj[3]
            endUserInformation.city =obj[4]
            status=true
            return status
        }
        else{
            return status
        }
    }
    catch (Exception e){

        return "serverError"
    }
}
    def checkPassword(Map params,EndUserInformation endUserInformation){
        try{
            def status=false
            if (endUserInformation) {
                status = decryptPassword(params.oldPassword, endUserInformation.password)
                return status
            }
            else{
                return status
            }
        }
        catch (Exception e){

        }
    }
    def encryptedPassword(String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String originalPassword = password;
        String generatedSecuredPasswordHash = generateStorngPasswordHash(originalPassword);
        return generatedSecuredPasswordHash
    }

    private static String generateStorngPasswordHash(String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        int iterations = 1000;
        char[] chars = password.toCharArray();
        byte[] salt = getSalt();

        PBEKeySpec spec = new PBEKeySpec(chars, salt, iterations, 64 * 8);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] hash = skf.generateSecret(spec).getEncoded();
        return iterations + ":" + toHex(salt) + ":" + toHex(hash);
    }

    private static byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }

    private static String toHex(byte[] array) throws NoSuchAlgorithmException {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0) {
            return String.format("%0" + paddingLength + "d", 0) + hex;
        } else {
            return hex;
        }


    }
    def decryptPassword(String inputPassword,String encryptedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException{
        String  originalPassword = inputPassword;
        boolean matched = validatePassword(originalPassword, encryptedPassword);
        return matched



    }
    private static boolean validatePassword(String originalPassword, String storedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException
    {
        String[] parts = storedPassword.split(":");
        int iterations = Integer.parseInt(parts[0]);
        byte[] salt = fromHex(parts[1]);
        byte[] hash = fromHex(parts[2]);

        PBEKeySpec spec = new PBEKeySpec(originalPassword.toCharArray(), salt, iterations, hash.length * 8);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] testHash = skf.generateSecret(spec).getEncoded();

        int diff = hash.length ^ testHash.length;
        for(int i = 0; i < hash.length && i < testHash.length; i++)
        {
            diff |= hash[i] ^ testHash[i];
        }
        return diff == 0;
    }
    private static byte[] fromHex(String hex) throws NoSuchAlgorithmException
    {
        byte[] bytes = new byte[hex.length() / 2];
        for(int i = 0; i<bytes.length ;i++)
        {
            bytes[i] = (byte)Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        return bytes;
    }
}
