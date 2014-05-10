// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
function show_pip(element) {
    var pie_id = $(element).find(".pie").attr('id');
    var pie_data = JSON.parse($(element).find(".none").text());
    var div_block = $("#" + pie_id);

    $.plot(div_block, pie_data, {
        series: {
            pie: {
                show: true,
                radius: 1,
                label: {
                    show: true,
                    radius: 3 / 4,
                    formatter: labelFormatter,
                    threshold: 0.1
                }
            }
        },
        legend: {
            show: false
        }
    });

    function labelFormatter(label, series) {
        return "<div style='font-size:8pt; text-align:center; padding:2px; '>" + label + "<br/>" + (series.percent.toFixed(2)) + "%</div>";
    }
}

$(document).ready(function () {
    if (window.location.pathname == "/finance_management/index") {
        $("#original_statistics_pip .col-md-6").each(function (index, element) {
            show_pip(element)
        });
    }
});
