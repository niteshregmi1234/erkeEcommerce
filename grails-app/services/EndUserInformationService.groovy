import grails.converters.JSON
import grails.transaction.Transactional
import javax.crypto.SecretKeyFactory
import javax.crypto.spec.PBEKeySpec
import java.security.NoSuchAlgorithmException
import java.security.SecureRandom
import java.security.spec.InvalidKeySpecException

@Transactional
class EndUserInformationService {
    def getOrderId(List<Cart> cartList,EndUserInformation endUserInformation,Map params){
       try{
        def date=new Date()
        def orderIdInstance=new OrderId()
        orderIdInstance.endUserInformation=endUserInformation
        orderIdInstance.save(flush: true)
        def orderId="yarsaa/"+orderIdInstance.id
        for(Cart cart:cartList){
            def cartHistoryInstance=new CartHistory()
            cartHistoryInstance.productSize=cart.productSize
            cartHistoryInstance.quantity=cart.quantity
            cartHistoryInstance.endUserInformation=cart.endUserInformation
            cartHistoryInstance.product=cart.product
            cartHistoryInstance.isDelivered=false
            cartHistoryInstance.date=date
            cartHistoryInstance.deliveryAddress=params.address
            cartHistoryInstance.mobileNumber=params.phone
            cartHistoryInstance.deliveryMethod=DeliveryMethod.get(params.delivery)
            cartHistoryInstance.paymentMethod=PaymentMethod.get(params.payment)
            cartHistoryInstance.orderId=orderId
            cartHistoryInstance.isFakeOrder=false
            cartHistoryInstance.successfulOrderDelFlag=false
            cartHistoryInstance.save(flush: true)
            cart.delete(flush: true)
        }
        return orderIdInstance.id
    }
       catch (Exception e){

       }
    }
    def cartList(EndUserInformation endUserInformation){
        try{
        def cartList=Cart.findAllByEndUserInformation(endUserInformation)
        return cartList
    }
        catch (Exception e){

        }
    }
    def getTotalPriceOfCartList(List<Cart> cartList){
        try{
        def totalPrice=0
        for(Cart cart:cartList){
            totalPrice=totalPrice+((cart.product.productDetails.price*cart.quantity)-(cart.product.productDetails.discountPercentage*(cart.product.productDetails.price*cart.quantity)/100))
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
    def saveEndUser(Map params){
        try{
            def endUserInformationInstance = new EndUserInformation()
            endUserInformationInstance.firstName = params.first_name
            endUserInformationInstance.lastName = params.last_name
            endUserInformationInstance.phone = params.phone
            endUserInformationInstance.address = params.address
            endUserInformationInstance.city = params.city
            endUserInformationInstance.email = params.email
            endUserInformationInstance.password = encryptedPassword(params.password)
            if (endUserInformationInstance.validate()) {
                endUserInformationInstance.save(flush: true)
                def message1="you are successfully registered"
                return message1
            } else {
                def message = "Please don't enter already used email "
                return message
            }
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