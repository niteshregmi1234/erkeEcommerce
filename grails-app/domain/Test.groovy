

class Test {
    String testId = UUID.randomUUID().toString()



String name
    String role
    String imageName
    static constraints = {
    }
    static mapping = {
        testId generator:'assigned'
    }
}
