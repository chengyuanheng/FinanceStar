// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function confirm_origin_password(){

    var origin_password = $(".origin_password").val().trim();

    $.ajax({
        url: '/confirm_origin_password',
        method: "post",
        data: {password: origin_password},

        success: function (result) {
            if(result == 'password_right'){
                $('.origin_password').attr('password_submit_status',true)
            }
            if(result == 'password_wrong'){
                $('.origin_password').attr('password_submit_status',false)
            }
            judge_password_submit_status();
        },
        error: function () {
            alert('可能由于网络原因出现错误，请重新再试');
            window.location.reload();
        }
    });
}

function confirm_new_password(){

    var new_password =  $(".new_password").val().trim();

    var confirm_new_password = $(".confirm_new_password").val().trim();

    if(confirm_new_password == new_password && confirm_new_password != '' && new_password != ''){
        $('.confirm_new_password').attr('password_submit_status',true)
    }else{
        $('.confirm_new_password').attr('password_submit_status',false)
    }
    judge_password_submit_status();
}

function judge_password_submit_status(){

    if($(".origin_password").attr('password_submit_status') == 'true' && $(".confirm_new_password").attr('password_submit_status') == 'true'){
        $('.password_submit').attr('disabled', false);

    }else{
        $('.password_submit').attr('disabled', true);
    }
}

function update_password(){

    var new_password =  $(".new_password").val().trim();

    var origin_password = $(".origin_password").val().trim();

    if(new_password != '' &&  origin_password != ''){

        $.ajax({
            url: '/update_password',
            method: "post",
            data: {password: new_password, origin_password: origin_password},

            success: function (result) {

                if(result == 'update_success'){
                    alert('更新成功');
                }
                if(result == 'update_failed'){
                    alert('更新失败');
                }
                window.location.reload();
            },
            error: function () {
                alert('可能由于网络原因出现错误，请重新再试');
                window.location.reload();
            }
        });

    }else{
        alert('密码不能为空');
    }
}
