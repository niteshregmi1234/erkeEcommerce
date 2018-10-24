<%-- Created by IntelliJ IDEA. User: hemanta Date: 7/16/17 Time: 7:15 PM --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="userYarsaa">
</head>
<body>
<div id="content">
    <div class="container-fluid">
            <div class="col-md-12">
                <div id="main-slider">
                    <div class="item">
                        <img src="${resource(dir: 'images', file: 'spinner-cover.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.coverImage])}" class="img-responsive lazy">
                    </div>
                </div>
                <!-- /#main-slider -->
            </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li>
                        <g:link action="userHome" controller="endUser">Home</g:link>
                    </li>
                    <li>About</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="row">
                    <div class="col-sm-6 col-xs-6">
                        <div class="imgwrapper">
                            <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs1Image])}" class="img-responsive lazy">
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                        <div class="imgwrapper">
                            <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs2Image])}" class="img-responsive lazy">
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-6 col-xs-6">
                        <div class="imgwrapper">
                            <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs3Image])}" class="img-responsive lazy">
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-6 ">
                        <div class="imgwrapper">
                            <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs4Image])}" class="img-responsive lazy">
                        </div>
                    </div>
                </div>
                <!-- /#blog-homepage -->
            </div>

            <div class="col-md-6">
                <div class="box">
                    <h1>ABOUT US</h1>
                    <p>${aboutUsInstance.aboutUsDescription}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                &nbsp;
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="col-sm-5">
                    <div class="imgwrapper">
                        <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.quoteLeftImage])}" class="img-responsive lazy">
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="box">
                        <h3>"${aboutUsInstance.quote}"</h3>
                        <h4>― ${CompanyInformation.list()[0].proprietorName}</h4>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="imgwrapper">
                        <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.quoteRightImage])}" class="img-responsive lazy">
                    </div>
                </div>
            </div>
            <!-- /#blog-homepage -->
        </div>
    </div>
    <div class="container-fluid">
        <div class="col-md-12">
            &nbsp;
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="box">
                        <h2>COMMERCIAL VIDEO</h2>
                        <p class="box-text">${aboutUsInstance.videoDescription}.</p>
                        <p class="box-text">Watch our commercial videos</p>
                        <p class="read-more"><a href="#small-dialog4" class="popup-with-zoom-anim btn btn-primary">WATCH NOW</a>
                        </p>
                    </div>
                </div>
                <div id="small-dialog4" class="mfp-hide agileinfo">
                    <div class="pop_up">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/${aboutUsInstance.videoName}" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.videoDescrptionImage])}" class="img-responsive lazy">
                    </div>
                </div>
            </div>
            <!-- /#blog-homepage -->
        </div>

        <div class="row">
            <div class="col-md-12">
                &nbsp;
            </div>
        </div>

    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="imgwrapper">
                    <img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProductSubCategoryImage])}" class="img-responsive lazy">
                    <div class="w3lsshoesaits-info">
                        <h3>${aboutUsInstance.specialProductSubCategory.subCategoryName} TO DIE FOR</h3>
                        <p>${aboutUsInstance.specialProductSubCategory.subCategoryDescription}</p>
                        <div class="wthreeshop-a a-buttonsize">
                            <g:link action="subCategory" controller="endUser" params="[subCategory:aboutUsInstance.specialProductSubCategory.urlName]">SHOP ${aboutUsInstance.specialProductSubCategory.subCategoryName}</g:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
            <div class="col-md-12 ">
                <div class="agilenwew3lsfashions about-background lazy" style="background-image:url('${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.backgroundImage])}');background-size:contain;">
                </div>
            </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });
    });
</script>
<script src="${resource(dir: 'js', file: 'yarsaa/jquery.magnific-popup.js')}" type="text/javascript" charset="utf-8"></script>

</body>
</html>