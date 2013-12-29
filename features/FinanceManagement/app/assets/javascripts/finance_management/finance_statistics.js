// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(window).ready(function () {
    render_classify();
});



function render_classify(){
    render_filter('consume');
    render_filter('time');
}


function render_filter(option) {
    var option_param = get_url_param(option + '_classify');

    if (option_param != null) {
        remove_primary_class_of_all_item_id_dd(option);

        render_filter_option(option, option_param);
    }
}

function render_filter_option(option, option_param) {
    $('#' + option + ' a').each(function () {
        if ($(this).text().trim() == ItemMapping.get_key(option, option_param)) {
            $(this).removeClass('label-blank');
            $(this).addClass('label-primary');
            return false;
        }
    });
}








// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function select_classify_filter(me, classify) {
    remove_primary_class_of_all_item_id_dd(classify);

    $(me).removeClass("label-blank");
    $(me).addClass("label-primary");
    submit_select_classify();
}


function remove_primary_class_of_all_item_id_dd(classify) {
    $("#" + classify + " " + "a").each(function () {
        $(this).removeClass('label-primary')
        $(this).addClass('label-blank')
    });
}


function submit_select_classify() {
    title = $("#customer_name").text().trim();
    customer_name = title.substring(0,title.length-5);
    window.location.href = '/finance_management/finance_statistics/show_customer_detail/'+customer_name+'?' + fetch_primary_param('consume') +'&'+  fetch_primary_param('time');

}

var ItemMapping = {
    'consume':{
        '全部': 'all',
        '收入': 'income',
        '支出': 'expenses'
    },
    'time':{
        '全部': 'all',
        '本周汇总': 'week_summary',
        '本月汇总' : 'mouth_summary' ,
        '本季度汇总' : 'quarterly_summary'
    }
};

ItemMapping.get_value = function (id, key){
    return this[id][key]
}

ItemMapping.get_key = function(id, value){
    var key = '';
    var items = this[id] ;
    for(var key in items){
        if(items[key] == value) {
            return key
        }
    }
}

function fetch_primary_param(id) {
    var param = '';
    $('#'+id+' a').each(function () {
        if ($(this).hasClass("label-primary")) {
            param = id + '_classify=' + ItemMapping.get_value(id, $(this).text());
            return false;
        }
    });
    return param;
};




