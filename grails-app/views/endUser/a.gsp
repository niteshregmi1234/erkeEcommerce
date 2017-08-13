<!DOCTYPE html>
<html lang="en">
<head>


    <meta name="layout" content="userYarsaa">

</head>
<body>



<div class="container">

        <div class="bootbox modal fade bootbox-confirm in" id="confirmModel" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
                    <div class="bootbox-body">Are you sure want to place your order?</div>
                </div><div class="modal-footer">
                <button data-bb-handler="cancel" type="button" class="btn btn-default"><i class="fa fa-times"></i> Cancel</button>
                <button data-bb-handler="confirm" type="button" class="btn btn-primary"><i class="fa fa-check"></i> Confirm</button>
            </div>
            </div>
        </div>
    </div>
    <h2>Bootstrap 3.3.7 - Modal Demo</h2>

    <div class="row text-center">
        <h3>The Basic Modal</h3>
        <a href="#" class="btn btn-lg btn-success" data-toggle="modal" data-target="#basicModal">Click to open Modal</a>
    </div>
    <hr>
    <div class="row text-center">
        <h3>The Confirm Modal</h3>
        <a href="#" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#confirmModel">Click to open Modal</a>
    </div>
    <hr>
    <%int i=0;
        %>
    <div class="row text-center">
        <h3>The Small Modal</h3>
        <a href="#" class="btn btn-lg btn-danger" data-toggle="modal" data-target="#smallModal${i}">Click to open Modal</a>
    </div>

</div>

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Basic Modal</h4>
            </div>
            <div class="modal-body">
                <h3>Modal Body</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                Are you sure want to place order?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="smallModal${i}" tabindex="-1" role="dialog" aria-labelledby="smallModal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Small Modal</h4>
            </div>
            <div class="modal-body">
                <h3>Modal Body</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<p class="p">Demo by Syed Fazle Rahman. <a href="http://www.sitepoint.com/understanding-bootstrap-modals/" target="_blank">See article</a>.</p>
<style>
h2 {
    text-align: center;
}

.p {
    text-align: center;
    padding-top: 130px;
}
</style>
</body>
</html>