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
    <g:if test="${Aids.list().size()<=9}">
    <g:link action="create" controller="aids" class="btn btn-primary navbar-btn">New</g:link>
    </g:if>
        </nav>
<caption><h3>List</h3></caption>
<table id="example" class="display nowrap" cellspacing="0" width="100%">

    <thead>
    <tr>
        <th>SN</th>
        <th>View</th>
        <th>Position of Div</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>SN</th>
        <th>View</th>
        <th>Position of Ad</th>
    </tr>

    </tfoot>
    <tbody>
    <g:each in="${aidsList}" var="list" status='i'>
        <tr>
            <td>${i+1}</td>
            <td> <g:link action="edit" id="${list?.id}" controller="aids" class="btn btn-primary btn-sm">view</g:link></td>
            <td>${list.divPosition}</td>
        </tr>
    </g:each>
    </tbody>
</table>
<script>
    $(document).ready(function() {

        // Setup - add a text input to each footer cell
        $('#example tfoot th').each( function () {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
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