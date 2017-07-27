

class Test {
    String testId = UUID.randomUUID().toString()



String name
    String role
    static constraints = {
    }
    static mapping = {
        testId generator:'assigned'
    }
}
