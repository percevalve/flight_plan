# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#resas').dataTable({"bAutoWidth": false, "sPaginationType": "foundation",  "order": [[ 2, "asc" ]]})
        $('.date_debut').datepicker (dateFormat: 'dd/mm/y')
        $('.date_fin').datepicker ({dateFormat: 'dd/mm/y', defaultDate: '+7d'})
        $('.date_debut').change( -> window.location = document.URL.substring(0,document.URL.indexOf("?")) + "?date_debut=" + $('.date_debut').val().replace("/","%2F").replace("/","%2F") + "&date_fin=" + $('.date_fin').val().replace("/","%2F").replace("/","%2F")) 
        $('.date_fin').change( -> window.location = document.URL.substring(0,document.URL.indexOf("?")) + "?date_debut=" + $('.date_debut').val().replace("/","%2F").replace("/","%2F") + "&date_fin=" + $('.date_fin').val().replace("/","%2F").replace("/","%2F"))
 