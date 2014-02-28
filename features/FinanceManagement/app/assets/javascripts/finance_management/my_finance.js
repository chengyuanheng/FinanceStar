// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function show_edit(id) {
    $("#"+id).show();
}

function hide_edit(id){
    $("#"+id).hide()
}

function exchange_customer_name(name){
    $("#select_customer").text(name);
}

function exchange_customer_consume(consume,consume_type){
    $("#select_customer_consume").text(consume+"/"+consume_type);
}

function save_consume_table(){

    var customer_name = $("#select_customer").text();
    var customer_consume =  $("#select_customer_consume").text();
    var customer_consume_value = $("#customer_consume_value").val();
    var customer_consume_describe = $("#customer_consume_describe").val();

    customer_consume_value == '' ? customer_consume_value = 0 : customer_consume_value;

    var content = {
        "select_customer" : customer_name,
        "select_customer_consume" :customer_consume.substring(0,2),
        "customer_consume_type": customer_consume.substring(3,customer_consume.length),
        "customer_consume_value" : customer_consume_value,
        "customer_consume_describe" : customer_consume_describe
    };

    if(content.select_customer == "请选择用户"){
        alert("暂无用户");
        return;
    }

    if(content.customer_consume_type == "消费类型"){
        alert("暂无消费类型");
        return;
    }

    $.ajax({
        method: "POST",
        url: "save_consume_table",
        data: content,
        dataType: "text",
        success: change_success,
        error: change_error
    });

    function change_success() {
        console.log("success");
    }

    function change_error() {
        console.log("error");
    }

    window.location.reload();


}