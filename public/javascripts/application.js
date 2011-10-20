// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function()
{
  $(".apsDatetime").jdPicker({
    month_names: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
    short_month_names: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
    short_day_names: ["D", "L", "M", "M", "J", "V", "S"],
    error_out_of_range: "La fecha seleccionada est&aacute; fuera de rango",
    //date_format: "dd/mm/YYYY",
    date_format: "yyyy-mm-dd",
    date_min: "16/02/1967",
    date_max: "31/12/2012",
    select_week: false,
    show_week: true
  });
  // jquery uniform
  //$("select, input:checkbox, input:radio, input:file").uniform();
  //$("input, textarea, select, button").uniform();
  //[PVD]$("select#company_current").uniform();
  $(".add_fields").addClass("btn success");
  $(".remove_fields").addClass("btn danger");

  // Bootsrap
  //$("a[rel=twipsy]").twipsy( {live: true} );
  $(".tabs").tabs();

  // chosen multiple seleccion
  $(".apsSelect").chosen();

  // jQuery datepicker for formtastic (see http://gist.github.com/271377)
  //[PVD]$('input.ui-datepicker').datepicker({ dateFormat: 'yy-mm-dd'});

  // Tooltips (see http://onehackoranother.com/projects/jquery/tipsy)
  $('img').each( function() {
    if ($(this).get(0).title != '') {
      //[PVD]$(this).tipsy();
        $(this).twipsy( {live: true} );
    }
  });
  $('select[title]').each( function() {
      //[PVD]$(this).tipsy();
      $(this).twipsy( {live: true} );
  });

  $('.flash').ajaxStart(function() {
    $(this).append("<p class=\"message warning ajax\"><img style=\"vertical-align:middle;margin-right:5px;\" src=\"/images/spinner.gif\"><strong>Cargando ...</strong></p>");
  });

  $(".flash").ajaxStop(function(){
    $(".flash > .ajax").hide();
  });

//  $('.accordion').accordion({
//	collapsible: true,
//	active: false,
//   autoHeight: true
//  });
	
$("#filters .clean-filters").bind('click', function(event){
   event.preventDefault();
   $("fieldset.inputs :input").val("");
 });

 $("#filters fieldset.inputs :input").each(function(){
   if( $(this).val() != '' ){
     $('.accordion').accordion("activate");
   }
 });
});

// Scroll effect for anchors
jQuery(function( $ )
{
  $('a').click(function() {
     if ($(this).attr('class') == 'anchor') {
       $.scrollTo(this.hash, 500);
       $(this.hash).find('span.message').text(this.href);
       return false;
     }
  });
});