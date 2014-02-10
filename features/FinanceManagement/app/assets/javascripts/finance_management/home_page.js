// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
$(function() {

    $(".progress-bar").each(function(){

       $(this).css("width",$(this).attr('process')*100+'%');

    });

});