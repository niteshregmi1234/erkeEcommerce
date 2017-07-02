<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/10/2017
  Time: 12:02 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery-ui.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap.min.css')}" type="text/css"
          media="all"/>

    <script src="${resource(dir: 'js', file: 'yamsaa/jquery.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yamsaa/jquery-ui.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrap.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yamsaa/bootbox.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yamsaa/jquery.dataTables.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery.dataTables.min.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap-datepicker.min.css')}" type="text/css">
    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrap-datepicker.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap-select.min.css')}" type="text/css">
    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrap-select.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <title>Yamsaa</title>
    <style>
    li a:focus, .active {
        background-color: rgba(15, 13, 16, 0.99);
    }
    </style>

</head>
<body>
<noscript>

    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Java-Script not found!</h4>
            </div>
            <div class="modal-body">
                <p>Our page does not function properly without java-script.So,You must enable java-script to view this web-page.</p>
            </div>

        </div>
</div>


        <style type="text/css">

    #content {
        display: none;
    }
    </style>

</noscript>
<div id="content">
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">Yamsaa</a>
        </div>
        <ul class="nav navbar-nav">
            <li><g:link action="adminHome" controller="adminHome">Home</g:link></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Set Up<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link action="list" controller="productCategory">Product Category</g:link></li>
                    <li><g:link action="list" controller="productSubCategory">Product SubCategory</g:link></li>
                    <li><g:link action="list" controller="productColor">Product Color</g:link></li>
                    <li><g:link action="list" controller="productSize">Product Size</g:link></li>
                    <li><g:link action="list" controller="productBrand">Product Brand</g:link></li>
                    <li><g:link action="list" controller="seasons">Season</g:link></li>

                </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Items<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link action="list" controller="product">Product</g:link></li>
                    <li><g:link action="list" controller="coverImage">Cover Image</g:link></li>
                    <li><g:link action="show" controller="specialBrand" id="${SpecialBrand.list()[0].id}">Special Brand</g:link></li>
                    <li><g:link action="list" controller="backgroundImage" >Other Images</g:link></li>

                </ul>
            </li>
            <li><g:link action="show" controller="companyInformation" id="${CompanyInformation.list()[0].id}">Company Information</g:link></li>
            <li><g:link action="show" controller="seasonsManagement" id="${SeasonManagement.list()[0].id}">Manage Season</g:link></li>



        </ul>
    </div>
</nav>
<script>
    $(function () {

        var url = window.location.pathname;
        var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");// now grab every link from the navigation
        $('li a').each(function () {
            // and test its normalized href against the url pathname regexp
            if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
                $(this).addClass('active');
            }
        });

    });
</script>

<div class="container">
    <g:layoutBody/>
</div>
</div>
</body>
</html>