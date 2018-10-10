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
    <g:link action="create" controller="Product" class="btn btn-primary navbar-btn">New</g:link>
</nav>
<h6 style="color: #761c19;">${flash.message}</h6>
<caption><h3>List</h3></caption>

<table id="example" class="display nowrap" cellspacing="0" width="100%">

    <thead>
    <tr>
        <th>SN</th>
        <th>View</th>
        <th>Name</th>
        <th>Priority Number</th>
        <th style="display: none;">Edit</th>
        <th>Action</th>
        <th>Category</th>
        <th>Sub-Category</th>
        <th>Color</th>
        <th>IsLatest</th>
        <th>IsFeatured</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>SN</th>
        <th>View</th>
        <th>Name</th>
        <th>Priority Number</th>
        <th style="display: none;">Edit</th>
        <th>Action</th>
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
            <td> <g:link action="show" id="${list?.id}" controller="Product" class="btn btn-primary btn-sm">view</g:link></td>
            <td>${list.productDetails.productNameWithBrand}</td>
            <td id="pnText${i+1}" ondblclick="myFunction(${i+1});">${list.priorityNumber}</td>
            <td id="pnEdit${i+1}" style="display: none;"><g:textField name="priorityNumber${i+1}" id="priorityNumber${i+1}" class="form-control" value="${list.priorityNumber}" onkeypress="return isNumber(event)" /></td>
            <td><div class="btn btn-primary btn-sm" id="buttons${i+1}" onclick="updatePriorityNumber(${list.id},${i+1});" disabled>Ok</div></td>
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
    function myFunction(sn){
document.getElementById("pnText"+sn).style.display="none";
        document.getElementById("pnEdit"+sn).style.display="block";
        $('#buttons'+sn).removeAttr('disabled');
    }
    function updatePriorityNumber(id,sn) {

var priorityNumber=document.getElementById("priorityNumber"+sn).value;
        $.ajax({
            url: "${createLink(controller:'product', action:'updatePriorityNumber')}",
            type: "POST",
            data: {"priorityNumber":priorityNumber,"id":id},
            cache: false,
            async: false,
            success: function (result) {
                if(result=="notOk"){
                    bootbox.alert({
                        message: "cannot update priority number",
                        size: 'small'
                    });

                }
                else{
                    bootbox.alert({
                        message: "successfully updated priority number",
                        size: 'small'
                    });
                    document.getElementById("pnText"+sn).innerHTML=result;
                    document.getElementById("pnEdit"+sn).value=result;
                    document.getElementById("pnText"+sn).style.display="block";
                    document.getElementById("pnEdit"+sn).style.display="none";
                    $('#buttons'+sn).attr('disabled','disabled');


                    // DataTable


                }

            }
        });
    }
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;

        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            bootbox.alert({
                message: "not allowed must be number",
                size: 'small'
            });
            return false;
        }
        return true;
    }
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