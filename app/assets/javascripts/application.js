// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require foundation
//= require jquery.timepicker.js
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require_tree .

$(function(){ $(document).foundation(); });

jQuery.fn.dataTableExt.aTypes.unshift(
	function (sData)
	{

		var donnee = sData.substring(sData.indexOf(">")+1,sData.lastIndexOf("<"))
		var jour = donnee.substring(0,2);
		var mois = donnee.substring(3,5);
		var jour3 = donnee.substring(6,9);
		var mesJours = ["Lun", "Mar", "Mer","Jeu","Ven", "Sam", "Dim"];

		if(donnee.length !== 9)
			return null
		
		if(isNaN(jour) || jour > 31 || jour <= 0)
			return null;

		if(isNaN(mois) || mois > 12|| mois <= 0)
			return null;

		if(mesJours.indexOf(jour3) === -1)
			return null
		return 'date-francaise-courte';
	}
);

jQuery.fn.dataTableExt.oSort['date-francaise-courte-asc']  = function(a,b) {
	var donnea = a.substring(a.indexOf(">")+1,a.lastIndexOf("<"))
	var donneb = b.substring(b.indexOf(">")+1,b.lastIndexOf("<"))
	var x = parseFloat(donnea.substring(0,2)) + parseFloat(donnea.substring(3,5)) * 31;
	var y = parseFloat(donneb.substring(0,2)) + parseFloat(donneb.substring(3,5)) * 31;
	return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};

jQuery.fn.dataTableExt.oSort['date-francaise-courte-desc'] = function(a,b) {
	var donnea = a.substring(a.indexOf(">")+1,a.lastIndexOf("<"))
	var donneb = b.substring(b.indexOf(">")+1,b.lastIndexOf("<"))
	var x = parseFloat(donnea.substring(0,2)) + parseFloat(donnea.substring(3,5)) * 31;
	var y = parseFloat(donneb.substring(0,2)) + parseFloat(donneb.substring(3,5)) * 31;
	return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};

var updateUrl = function(maVariable,maValeur){
		var elt  = document.URL.split("?");
		var maValeur = maValeur.split("/").join("%2F"); 
		var urlNouveau = elt[0].replace("#","") + "?";
		
		if(elt.length > 1){
			var parametres = elt[1].split("&");
			var variables  = parametres.map(function(a){return a.split("=")}).reduce(function(p,c){p.push(c[0]);return p},[]);
			
			for(elt in parametres){
				var theElt = parametres[elt];
				console.log(theElt);
				if(theElt.split("=")[0] !== maVariable)
					urlNouveau += theElt + "&";
			}
		}
		
		urlNouveau += maVariable + "=" + maValeur;
		return urlNouveau;
	}
