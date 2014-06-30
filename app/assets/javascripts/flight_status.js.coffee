# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#overview').dataTable({"sPaginationType": "foundation"})
$(document).ready ->
  $(".checkin").on("ajax:success", (e, data, status, xhr) ->
    $(this).parent().attr(class: xhr.responseJSON.status)
    console.log xhr.responseJSON.status
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log error