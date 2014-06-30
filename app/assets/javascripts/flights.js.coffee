# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#flights').dataTable({"bAutoWidth": false, "sPaginationType": "foundation"})
        $('.modelname_due_date').datepicker (dateFormat: 'dd/mm/yy')
        $('.modelname_dob').datepicker ({dateFormat: 'dd/mm/yy', defaultDate: '-18y'})
        $('.modelname_time').timepicker (timeFormat: 'H:i')
		