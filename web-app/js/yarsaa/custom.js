/**
 * Created by hemanta on 2/3/18.
 */
$("#filterBrand").click(function(evt) {
    $("#loader").show();
    setTimeout(function() { $("#loader").hide(); }, 2000);
    var minPrice=parseFloat(document.getElementById("amount_min").value);
    var maxPrice=parseFloat(document.getElementById("amount_max").value);
    var allValues=[];
    var uncheckedValues=[];
    var values = [];
    var idList=[];
    $('input[name="brand"]:checked').each(function() {
        values.push($(this).val());

    });
    if(values!='') {
        $("input[name='brand']").each(function () {
            allValues.push($(this).val());
        });
        $("input[name='productId']").each(function () {
            idList.push($(this).val());
        });


        for (var i = 0; i < allValues.length; i++) {
            if (!values.includes(allValues[i])) {
                uncheckedValues.push(allValues[i])
            }
        }
        for(var x=0;x<idList.length;x++) {

            for (var j = 0; j < values.length; j++) {

                if ($('div').is('.brand' + values[j]+idList[x])) {


                    var price = $('.brand' + values[j] + idList[x]).find('input[name="price"]').val();
                    if (price < minPrice) {
                        $('.brand' + values[j] + idList[x]).hide();
                    }
                    else if (price > maxPrice) {
                        $('.brand' + values[j] + idList[x]).hide();
                    }


                    else {
                        $('.brand' + values[j] + idList[x]).show();
                    }


                }            }
            for (var k = 0; k < uncheckedValues.length; k++) {
                if ($('div').is('.brand' + uncheckedValues[k]+idList[x])) {
                    $('.brand' + uncheckedValues[k]+idList[x]).hide();
                }


            }            }
        allValues = [];
        uncheckedValues = [];
        values = [];
        idList=[]
    }
    evt.preventDefault();
})
$("#filterPrice").click(function(evt) {
    $("#loader").show();
    setTimeout(function() { $("#loader").hide(); }, 2000);
    var minPrice=parseFloat(document.getElementById("amount_min").value);
    var maxPrice=parseFloat(document.getElementById("amount_max").value);
    var priceList = [];
    var values=[];
    var idList=[];
    $('input[name="brand"]:checked').each(function() {
        values.push($(this).val());
    });
    $("input[name='price']").each(function() {
        priceList.push($(this).val());
    });
    $("input[name='productId']").each(function() {
        idList.push($(this).val());
    });
    if(!isNaN(minPrice) && !isNaN(maxPrice)){
        for(var i=0;i<idList.length;i++){
            if(priceList[i]<minPrice){
                document.getElementById("price"+priceList[i]+idList[i]).style.display="none";

            }
            else if(priceList[i]>maxPrice){
                document.getElementById("price"+priceList[i]+idList[i]).style.display="none";
            }
            else{
                var brandId =document.getElementById("id"+idList[i]).value;
                if(values!=''){
                    if (values.includes(brandId)) {
                        document.getElementById("price"+priceList[i]+idList[i]).style.display="block";

                    }
                    else{

                        document.getElementById("price"+priceList[i]+idList[i]).style.display="none";

                    }
                }
                else{
                    document.getElementById("price"+priceList[i]+idList[i]).style.display="block";

                }
            }
            evt.preventDefault();

        }}
    priceList=[];
    values=[];
    idList=[];
    evt.preventDefault();
})

