<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/10/2017
  Time: 12:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
    <title></title>
</head>

<body>
<nav class="navbar">
    <g:link action="create" controller="yarsaaProducts" class="btn btn-primary navbar-btn">New</g:link>
</nav>
<h6 style="color: #761c19;">${flash.message}</h6>
<caption><h3>List</h3></caption>

<table id="example" class="display nowrap" cellspacing="0" width="100%">

    <thead>
    <tr>
<th>Id</th>
        <th>SN</th>
        <th>View</th>
        <th>Name</th>
        <th>Category</th>
        <th>Sub-Category</th>
        <th>Color</th>
        <th>IsLatest</th>
        <th>IsFeatured</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>Id</th>
        <th>SN</th>
        <th>View</th>
        <th>Name</th>
        <th>Category</th>
        <th>Sub-Category</th>
        <th>Color</th>
        <th>IsLatest</th>
        <th>IsFeatured</th>

    </tr>
    </tfoot>
    <tbody>
    <g:each in="${productList}" var="list" status='i'>
        <tr>
            <td>${i+1}</td>
            <td>${list.id}</td>
            <td> <g:link action="show" id="${list?.id}" controller="yarsaaProducts" class="btn btn-primary btn-sm">view</g:link></td>
            <td>${list.productDetails.productNameWithBrand}</td>
            <td>${list.productDetails.productCategory.categoryName}</td>
            <td>${list.productDetails.productSubCategory.subCategoryName}</td>
            <td>${list.productColor.colorName}</td>
            <td>${list.isLatest}</td>
            <td>${list.isFeatured}</td>
        </tr>
    </g:each>
    </tbody>
</table>
<script>
    $(document).ready(function() {

        // Setup - add a text input to each footer cell
        $('#example tfoot th').each( function () {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder='+title+' />' );
        } );

        // DataTable
        var table = $('#example').DataTable( {
            "scrollY": 200,
            "scrollX": true
        } );

        // Apply the search
        table.columns().every( function () {
            var that = this;

            $( 'input', this.footer() ).on( 'keyup change', function () {
                if ( that.search() !== this.value ) {
                    that
                            .search( this.value )
                            .draw();
                }
            } );
        } );
    } );
</script>

<style>
tfoot input {
    width: 100%;
    padding: 3px;
    box-sizing: border-box;
}
</style>
</body>
</html>