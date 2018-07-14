class BootStrap {
    def init = { servletContext ->
        DivPosition divPosition1=new DivPosition()
        divPosition1.divPositionName="side of top brands div"
        divPosition1.save(flush: true)
        DivPosition divPosition2=new DivPosition()
        divPosition2.divPositionName="side of hot this week div"
        divPosition2.save(flush: true)
        DivPosition divPosition3=new DivPosition()
        divPosition3.divPositionName="side of top sales div"
        divPosition3.save(flush: true)
        DivPosition divPosition4=new DivPosition()
        divPosition4.divPositionName="below of top sales div:first Ad"
        divPosition4.save(flush: true)
        DivPosition divPosition5=new DivPosition()
        divPosition5.divPositionName="below of top sales div:second Ad"
        divPosition5.save(flush: true)
        DivPosition divPosition6=new DivPosition()
        divPosition6.divPositionName="below of top sales div:third Ad"
        divPosition6.save(flush: true)
        DivPosition divPosition7=new DivPosition()
        divPosition7.divPositionName="below of top sales div:fourth Ad"
        divPosition7.save(flush: true)
        DivPosition divPosition8=new DivPosition()
        divPosition8.divPositionName="below of top sales div:fifth Ad"
        divPosition8.save(flush: true)
        DivPosition divPosition9=new DivPosition()
        divPosition9.divPositionName="below of top sales div:sixth Ad"
        divPosition9.save(flush: true)
    }
    def destroy = {
    }
}
