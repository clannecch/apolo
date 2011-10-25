// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function()
{
  //[PVD] :: Adjust the labels width with the column table width
  var max = 0;
  $(".columnLabel").each(function(){
    if ($(this).width() > max)
        max = $(this).width();
  });
  $(".apsLabel").width(max);

  //[PVD] :: Add the Bootsrap classes to the cocoon elements
  $(".add_fields").addClass("btn success");
  $(".remove_fields").addClass("btn danger");

  // BOOTSTRAP plugin
  $("#mymodal").modal( {closeOnEscape: true} );
  $(".tabs").tabs();
  $("a[rel=twipsy]").twipsy( {live: true} );
  $(".alert-message").alert();

  // chosen multiple seleccion
  $(".apsSelect").chosen();


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