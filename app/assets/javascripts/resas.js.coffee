# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#resas').dataTable({"bAutoWidth": false, "sPaginationType": "foundation",  "order": [[ 2, "asc" ]]})
        $('.date_debut').datepicker (dateFormat: 'dd/mm/y')
        $('.date_fin').datepicker ({dateFormat: 'dd/mm/y', defaultDate: '+7d'})
        $('.date_debut').change( -> window.location = updateUrl("date_debut",$(this).val())) 
        $('.date_fin').change( -> window.location = updateUrl("date_fin",$(this).val()))