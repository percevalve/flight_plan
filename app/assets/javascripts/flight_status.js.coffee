# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#overview').dataTable({"sPaginationType": "foundation"})
$(document).ready ->
  $(".checkin.button").on("ajax:success", (e, data, status, xhr) ->
    theValue = if xhr.responseJSON.check_in_status == "checked-in" then "normal" else "checked-in"
    $(this).parent().attr(class: xhr.responseJSON.check_in_status)
    console.log xhr.responseJSON.check_in_status
    $(this).prop("href",$(this).prop("href").replace(xhr.responseJSON.check_in_status,theValue))
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log error
   $(".checkin_table.button").on("ajax:success", (e, data, status, xhr) ->
    theValue = if xhr.responseJSON.check_in_status == "checked-in" then "normal" else "checked-in"
    $(this).closest("tr").attr(class: xhr.responseJSON.check_in_status)
    console.log xhr.responseJSON.check_in_status
    $(this).prop("href",$(this).prop("href").replace(xhr.responseJSON.check_in_status,theValue))
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log error