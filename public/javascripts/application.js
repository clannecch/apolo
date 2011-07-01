// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// perform JavaScript after the document is scriptable.
$(function() {
    // setup ul.tabs to work as tabs for each div directly under div.panes
    $("ul.tabs").tabs("div.panels > div.panel");
});

$(function() {
    $( ".datepicker" ).datepicker();
});