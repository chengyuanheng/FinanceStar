$(window).ready(function () {
    $('label input').click(function () {
        $(this).parent().parent().toggleClass('selected')
    });

    var time = 5;
    var clear_interval = 0;

    function hide_send_sms_success_tip() {
        if (time != 0) {
            time -= 1;
            $("#close_tip_send_sms_success").html(time);
        } else {
            $("#tip_send_sms_success").hide();
            clearInterval(clear_interval)
        }
    }

    $("#tip_send_sms_success").show();
    clear_interval = setInterval(hide_send_sms_success_tip, 1000)
});

function uncheck_all_user() {
    $.each($(":checkbox"), function (index, item) {
        item.checked = false;
        $(item).parent().parent().removeClass('selected');
    });
}

function check_all_user() {
    $.each($(":checkbox"), function (index, item) {
        item.checked = true;
        $(item).parent().parent().addClass('selected');
    });
}

function confirm_send(){
    $("#receiver_is_null_tip").hide();
    $("#content_is_null_tip").hide();
    if(validate_receivers_and_sms_content()){
        $("#confirm_send").attr("data-toggle", "modal");
        copy_sms_content();
        list_receivers();
    }
}

function list_receivers() {
    var receiver_names = fetch_checked_users_name();

    $("#receivers_list").text(receiver_names.join("    ").toString());
}

function copy_sms_content() {
    if ($("#sms_content").val().trim().length == 0) {
        $("#sms").val('请输入发送内容，否则无法发送!');
    } else {
        $("#sms").val($("#sms_content").val());
    }
    $("#receiver_count").text(fetch_checked_user_ids().length);
}

function send_sms(){
    var data = _build_send_sms_params();
    $.ajax({
        url: '/bulk_sms',
        method: "post",
        dataType: 'text',
        data: data,
        success: function (result) {
            window.location.reload();
        },
        error: function () {
//                console.log('由于网络原因，您的信息未能发送成功，请刷新后重试！');
        }
    });
}

function validate_receivers_and_sms_content() {
    if(fetch_checked_user_ids().length == 0 ){
        $("#receiver_is_null_tip").show();
        $('#confirm_send').removeAttr("data-toggle");
        return false;
    }
    if($("#sms_content").val().trim().length == 0) {
        $("#content_is_null_tip").show();
        $('#confirm_send').removeAttr("data-toggle");
        return false;
    }
    return true;
}

function _build_send_sms_params() {
    return {'sms_receiver_ids': fetch_checked_user_ids(), 'sms_content': $("#sms_content").val()}
}

function fetch_checked_user_ids() {
    var sms_receiver_ids = [];
    $.each($("input[type=checkbox]:checked"), function (index, item) {
        sms_receiver_ids.push(item.value);
    });
    return sms_receiver_ids;
}

function fetch_checked_users_name() {
    var sms_receiver_names = [];
    $.each($("input[type=checkbox]:checked"),function(index,item) {
        sms_receiver_names.push($(item).parent().text().trim());
    });
    return  sms_receiver_names
}
