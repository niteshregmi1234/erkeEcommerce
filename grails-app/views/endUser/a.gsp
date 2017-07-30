<!DOCTYPE html>
<html lang="en">
<head>


    <meta name="layout" content="userYarsaa">

</head>
<body>



<div class="container">
    <div class="row">
        <div class="well">
            <form>
                <fieldset>
                    <div class="form-group">
                        <label for="query">Search:</label>
                        <input class="form-control" name="query" id="query" placeholder="Start typing something to search..." type="text">
                    </div>
                    <button type="submit" class="btn btn-primary">Search</button>
                </fieldset>
            </form>
        </div>
    </div>
</div>
<style>
.twitter-typeahead{
    width:100%;
}

.twitter-typeahead .tt-query,
.twitter-typeahead .tt-hint {
    margin-bottom: 0;
}
.tt-dropdown-menu {
    min-width: 160px;
    margin-top: 2px;
    padding: 5px 0;
    background-color: #fff;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.2);
    *border-right-width: 2px;
    *border-bottom-width: 2px;
    -webkit-border-radius: 6px;
    -moz-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
    -moz-box-shadow: 0 5px 10px rgba(0,0,0,.2);
    box-shadow: 0 5px 10px rgba(0,0,0,.2);
    -webkit-background-clip: padding-box;
    -moz-background-clip: padding;
    background-clip: padding-box;
    width:100%;
}

.tt-suggestion {
    display: block;
    padding: 3px 20px;
}

.tt-suggestion.tt-is-under-cursor {
    color: #fff;
    background-color: #0081c2;
    background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
    background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
    background-image: -o-linear-gradient(top, #0088cc, #0077b3);
    background-image: linear-gradient(to bottom, #0088cc, #0077b3);
    background-repeat: repeat-x;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0)
}

.tt-suggestion.tt-is-under-cursor a {
    color: #fff;
}

.tt-suggestion p {
    margin: 0;
}
</style>
<script>
    /*!
     * typeahead.js 0.9.3
     * https://github.com/twitter/typeahead
     * Copyright 2013 Twitter, Inc. and other contributors; Licensed MIT
     */


    $('#query').typeahead({
        local: [
        <g:each in="${productDetails}" var="list">
                '${list.productDetails.productName}',
            </g:each>
        ]

    });

    $('.tt-query').css('background-color','#fff');
</script>


</body>
</html>