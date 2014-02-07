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
//= require_tree .

$(function(){
	var makeOptions = function(options){
		var searchOptions = "";
		var search = window.location.href.split("&search_by")[0]
		$.each(options, function(option, msg){
			searchOptions += "<a href='"+search	+"&search_by="+option+"'>"+msg+"</a>  ";
		});
		return searchOptions;
	}
	var options = {0: "Best Match", 1: "Closest Distance", 2: "Highest Rated"};

	$("#search_by").append(makeOptions(options));

})