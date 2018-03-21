<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 7/13/17
  Time: 6:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="userYarsaa">
    <title></title>
</head>

<body>
<div id="content">
    <div class="container">

        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>All Brands</li>
            </ul>




        <!-- /.container -->
    </div>
</div>
    <div class="container">
        <div class="col-md-12">
            <div class="box">

                <div class="social">
                    <h2 style="color: #4fbfa8; margin-left: 8px;">Top Brands</h2>
                    <g:each in="${brandsList}" var="list">
                        <g:if test="${Product.findByProductDetails(ProductDetails.findByProductBrand(list))}">
                            <div class="col-sm-2 col-sm-4 col-xs-4 "style="margin-bottom: 10px;">
                                <g:link action="topBrand" controller="endUser" params="[brandNames:list.urlName]">

                                    <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.logoName])}" class="img-responsive lazy">
                                </g:link>
                            </div>
                        </g:if>
                    </g:each>

                %{--<p>--}%
                %{--<a id="btn_shareFacebook" class="facebook customer share" title="Facebook share" data-animate-hover="pulse" target="_blank"><i class="fa fa-facebook"></i></a>--}%
                %{--<a id="btn_shareTWI" class="twitter customer share" href="" title="Twitter share" data-animate-hover="pulse" target="_blank"><i class="fa fa-twitter"></i></a>--}%
                %{--<a id="btn_shareExternalGplus" class="gplus google_plus customer share" data-animate-hover="pulse" href="" title="Google Plus Share" target="_blank"><i class="fa fa-google-plus"></i></a>--}%
                %{--<a id="btn_shareLinkedIn" class="a btn btn-linkedin customer share" href="" title="linkedin Share" target="_blank" data-animate-hover="pulse"><i class="fa fa-linkedin"></i>--}%
                %{--</a>--}%
                %{--<a id="btn_shareInstagram" title="instagram Share" class="btn btn-instagram a" data-animate-hover="pulse" href="">--}%
                %{--<i class="fa fa-instagram"></i>--}%
                %{--</a>--}%
                %{--</p>--}%
                </div>
            </div>
        </div>
    </div>


</div>    <!-- /.container -->

</body>
</html>