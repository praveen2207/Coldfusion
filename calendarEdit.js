function dateshow(){
    $('#dob').datepicker({
        changeYear : true,
        maxDate : "-18Y",
        dateFormat : "yy/mm/dd"
    });
}
document.getElementById("dob").onclick = dateshow();