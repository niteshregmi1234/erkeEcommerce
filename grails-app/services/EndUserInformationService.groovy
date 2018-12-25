import grails.converters.JSON
import grails.transaction.Transactional
import javax.crypto.SecretKeyFactory
import javax.crypto.spec.PBEKeySpec
import java.security.NoSuchAlgorithmException
import java.security.SecureRandom
import java.security.spec.InvalidKeySpecException

@Transactional
class EndUserInformationService {
    def saveCustomerPersonalDetails(Map params){
        CustomerPersonalDetails customerPersonalDetails=new CustomerPersonalDetails()
        customerPersonalDetails.firstName=params.firstNameBilling
        customerPersonalDetails.lastName=params.lastNameBilling
        customerPersonalDetails.companyName=params.companyNameBilling
        customerPersonalDetails.country="Nepal"
        customerPersonalDetails.cumpolsoryAddress=params.cumpolsoryAddressBilling
        customerPersonalDetails.optionalAddress=params.optionalAddressBilling
        customerPersonalDetails.townOrCity=params.cityBilling
        customerPersonalDetails.mobileOrPhoneCumpolsory=params.mobileOrPhoneCumpolsoryBilling
        customerPersonalDetails.mobileOrPhoneOptional=params.mobileOrPhoneOptionalBilling
        return customerPersonalDetails
    }
    def getOrderId(List<CartWithoutEndUser> cartList,Map params,EndUserInformation endUserInformation){
       try{
           def billingInfo= JSON.parse(params.billingInfo)
               def customerPersonalDetails=new CustomerPersonalDetails()
           customerPersonalDetails.firstName=billingInfo[0]
           customerPersonalDetails.lastName=billingInfo[1]
           customerPersonalDetails.companyName=billingInfo[2]
           customerPersonalDetails.country="Nepal"
           customerPersonalDetails.cumpolsoryAddress=billingInfo[6]
           customerPersonalDetails.optionalAddress=billingInfo[7]
           customerPersonalDetails.townOrCity=billingInfo[8]
           customerPersonalDetails.mobileOrPhoneCumpolsory=billingInfo[3]
           customerPersonalDetails.mobileOrPhoneOptional=billingInfo[4]
           customerPersonalDetails.save(flush: true)
           if(params.isCreateAccount){
               saveEndUser(customerPersonalDetails,billingInfo[5],params.isCreateAccount)
           }
           def date=new Date()
        def orderIdInstance=new OrderId()
        orderIdInstance.email=billingInfo[5]
           orderIdInstance.orderId="erke/"
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
               cartHistoryWithoutEndUserInstance.orderNotes=params.orderNotes
               cartHistoryWithoutEndUserInstance.productBrand=cart.productBrand
               cartHistoryWithoutEndUserInstance.deliveryMethod=DeliveryMethod.findByIsShowStatusAndId(true,params.delivery as long)
               cartHistoryWithoutEndUserInstance.paymentMethod=PaymentMethod.findByIsShowStatusAndId(true,params.payment as long)
               if(endUserInformation){
               cartHistoryWithoutEndUserInstance.customerType="Returning or logged in Customer"
               }
               else {

                   cartHistoryWithoutEndUserInstance.customerType = "new customer or not logged in Customer"
               }
                   cartHistoryWithoutEndUserInstance.customerPersonalDetails=customerPersonalDetails
               cartHistoryWithoutEndUserInstance.save(flush: true)
           }
        return orderId
    }
       catch (Exception e){

       }
    }
    def getOrderIdQuick(List<CartWithoutEndUser> cartList,Map params){
        try{

            def date=new Date()
            def orderIdInstance=new OrderId()
            orderIdInstance.orderId="Erke/"
            orderIdInstance.save(flush: true)
            def orderId=orderIdInstance.orderId+orderIdInstance.id
            orderIdInstance.orderId=orderId
            orderIdInstance.save(flush: true)

            for(CartWithoutEndUser cart:cartList){
                def quickCheckOutWithCart=new QuickCheckOutWithCart()
                quickCheckOutWithCart.mobileNumber=params.mobileNumberQuick as long
                quickCheckOutWithCart.isFakeOrder=false
                quickCheckOutWithCart.orderId=orderIdInstance
                quickCheckOutWithCart.date=date
                quickCheckOutWithCart.isDelivered=false
                quickCheckOutWithCart.successfulOrderDelFlag=false
                quickCheckOutWithCart.product=cart.product
                quickCheckOutWithCart.quantity=cart.quantity
                quickCheckOutWithCart.productSize=cart.productSize
                quickCheckOutWithCart.productBrand=cart.productBrand
                quickCheckOutWithCart.save(flush: true)
            }
            return orderId
        }
        catch (Exception e){

        }
    }

    def saveShipping(Map params,OrderId orderId){
        def shippingInfo= JSON.parse(params.isShipping)
        def shippingDetails=new ShippingDetails()
        shippingDetails.firstNameShipping=shippingInfo[0]
        shippingDetails.lastNameShipping=shippingInfo[1]
        shippingDetails.companyNameShipping=shippingInfo[2]
        shippingDetails.cumpolsoryAddressShipping=shippingInfo[4]
        shippingDetails.optionalAddressShipping=shippingInfo[5]
        shippingDetails.cityShipping=shippingInfo[6]
        shippingDetails.orderId=orderId
        shippingDetails.mobileOrPhoneShipping=shippingInfo[3]
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
    def saveEndUser(CustomerPersonalDetails customerPersonalDetails,String email,String password){
        try{
            def endUserInformationInstance = new EndUserInformation()
            endUserInformationInstance.email=email
            endUserInformationInstance.password=encryptedPassword(password)
            endUserInformationInstance.customerPersonalDetails=customerPersonalDetails
            endUserInformationInstance.save(flush: true)
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
    def editEndUserPassword(Map params,Long id){
        try{
            EndUserInformation endUserInformation=EndUserInformation.findById(id)
            if(endUserInformation){
                endUserInformation.password =encryptedPassword(params.newPassword)
                endUserInformation.save(flush: true)
                return endUserInformation
            }

        }
        catch (Exception e){

        }
    }
def editEndUserPersonalDetails(Map params,CustomerPersonalDetails customerPersonalDetails){
    try{
        customerPersonalDetails.firstName=params.firstNameBilling
        customerPersonalDetails.lastName=params.lastNameBilling
        customerPersonalDetails.companyName=params.companyNameBilling
        customerPersonalDetails.cumpolsoryAddress=params.cumpolsoryAddressBilling
        customerPersonalDetails.optionalAddress=params.optionalAddressBilling
        customerPersonalDetails.townOrCity=params.cityBilling
        customerPersonalDetails.mobileOrPhoneCumpolsory=params.mobileOrPhoneCumpolsoryBilling
        customerPersonalDetails.mobileOrPhoneOptional=params.mobileOrPhoneOptionalBilling
        customerPersonalDetails.save(flush: true)
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
        String  originalPassword = inputPassword
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
