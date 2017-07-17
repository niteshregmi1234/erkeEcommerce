<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 7/16/17
  Time: 7:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta name="layout" content="userYarsaa">
</head>

<body>
<div id="content">
    <div class="container">
        <div class="col-md-12">
            <div id="main-slider">
                <div class="item coverUp">
                    <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.coverImage}")}" alt="" class="img-responsive">
                </div>
            </div>
            <!-- /#main-slider -->
        </div>
    </div>
    <style>
    .coverUp img{
        height:520px;
        width: 1108px;
    }
    </style>

    <div class="container">

        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>About</li>
            </ul>
        </div>
        <div class="col-md-6" data-animate="fadeInUp">

            <div class="row">
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>


            </div>
            <!-- /#blog-homepage -->
        </div>
        <div class="col-md-6" data-animate="fadeInUp">
                <div class="box same-height clickable">

                    <h1>ABOUT US</h1>
                    <p>${aboutUsInstance.aboutUsDescription}</p>
                </div>


        </div>
        </div>
    <div class="container">
        <div class="col-md-12">
            &nbsp;
            </div>

        <div class="col-md-12" data-animate="fadeInUp">

            <div class="row">
                <div class="col-sm-5">
                    <div class="imgwrapper quote">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.quoteLeftImage}")}">


                    </div>

                </div>

                <div class="col-sm-2">
                    <div class="box same-height clickable">

                        <h3>"${aboutUsInstance.quote}"</h3>
                        <h4>― ${CompanyInformation.list()[0].proprietorName}</h4>

                    </div>

                </div>
                <div class="col-sm-5">
                    <div class="imgwrapper quote">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.quoteRightImage}")}">


                    </div>

                </div>

            </div>
            <!-- /#blog-homepage -->
        </div>
        <div class="col-md-12">
            &nbsp;
        </div>

        <div class="col-md-12" data-animate="fadeInUp">

            <div class="row">
                <div class="col-sm-6">
                    <div class="box">
                    <h2>SHOPPING VIDEO</h2>
                    <p>${aboutUsInstance.videoDescription}</p>
                    <p>Check out our latest commercial, teaser and behind the scenes film.</p>
                        <p class="read-more"><a href="#small-dialog4" class="popup-with-zoom-anim btn btn-primary">WATCH NOW</a></p>

                    </div>
                </div>
                <div id="small-dialog4" class="mfp-hide agileinfo">
                    <div class="pop_up">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/${aboutUsInstance.videoName}" frameborder="0" allowfullscreen></iframe>

                    </div>
                </div>




                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.videoDescrptionImage}")}" width="645" height="431">


                    </div>

                </div>

            </div>
            <!-- /#blog-homepage -->
        </div>

    </div>
    <!-- /#content -->
</div>

<style>
    .quote img{
        height:600px;
        width: 525px;
    }
</style>
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
<script src="${resource(dir: 'js', file: 'yarsaa/jquery.magnific-popup.js')}" type="text/javascript"
        charset="utf-8"></script>
</body>
</html>