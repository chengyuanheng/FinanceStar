//add  active class to header tag

$(document).on("page:load", function () {
    change_style_to_active()
});

$(document).ready(function () {
    change_style_to_active()
});


function change_style_to_active() {
    var id = fetch_id_base_path();

    $("#" + id).addClass('active')
}


function fetch_id_base_path() {

    var id_transform_from_path = _build_id();

    var customer_mapping = {
        _finance_management_index: '_finance_management_index',
        _finance_management_customer_management_index: '_finance_management_customer_management_index',
        _finance_management_my_finance_index: '_finance_management_my_finance_index',
        _finance_management_finance_statistics_index: '_finance_management_finance_statistics_index'
    };

    var mapping = {};
    $.extend(mapping, customer_mapping);

    return mapping[id_transform_from_path];


    function _build_id() {

        var path = window.location.pathname;

        if(path.indexOf('/finance_management/finance_statistics/show_customer_detail')!=-1) {
            path = '/finance_management/finance_statistics/index'
        }
        if(path.indexOf('/finance_management/my_finance/expense')!=-1) {
            path = '/finance_management/my_finance/index'
        }
        if(path.indexOf('/finance_management/my_finance/income')!=-1) {
            path = '/finance_management/my_finance/index'
        }

        return path.replace(/\//g, '_');
    }
}


