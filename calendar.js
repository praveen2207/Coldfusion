document.getElementById('dobText').onclick = dateshow();
function dateshow(){
    $('#dobText').datepicker({
        changeYear : true,
        maxDate : "-18Y",
        dateFormat : "yy/mm/dd"
    });
}