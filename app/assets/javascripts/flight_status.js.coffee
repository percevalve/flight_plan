# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#overview').dataTable({"sPaginationType": "foundation"})
$(document).ready ->
  $(".checkin.button").on("ajax:success", (e, data, status, xhr) ->
    theValue = if xhr.responseJSON.status == "checkin" then "normal" else "checkin"
    $(this).parent().attr(class: xhr.responseJSON.status)
    $(this).text(theValue)
    console.log xhr.responseJSON.status
    $(this).prop("href",$(this).prop("href").replace(xhr.responseJSON.status,theValue))
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log error