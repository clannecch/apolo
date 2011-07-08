// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function()
{
  // jqeury uniform
  //$("select, input:checkbox, input:radio, input:file").uniform();
  //$("input, textarea, select, button").uniform();
  $("select#company_current").uniform();

  // jQuery datepicker for formtastic (see http://gist.github.com/271377)
  $('input.ui-datepicker').datepicker({ dateFormat: 'yy-mm-dd'});

  // Tooltips (see http://onehackoranother.com/projects/jquery/tipsy)
  $('img').each( function() {
    if ($(this).get(0).title != '') {
      $(this).tipsy();
    }
  });
  $('select[title]').each( function() {
      $(this).tipsy();
  });

  $('.flash').ajaxStart(function() {
    $(this).append("<p class=\"message warning ajax\"><img style=\"vertical-align:middle;margin-right:5px;\" src=\"/images/spinner.gif\"><strong>Cargando ...</strong></p>");
  });

  $(".flash").ajaxStop(function(){
    $(".flash > .ajax").hide();
  });

	$('.accordion').accordion({
	  collapsible: true,
	  active: false,
	  autoHeight: true
	});
	
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