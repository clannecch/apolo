// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// perform JavaScript after the document is scriptable.
$(function() {
    // setup ul.tabs to work as tabs for each div directly under div.panes
    $("ul.tabs").tabs("div.panels > div.panel");
});

$(function() {
//    $( ".datepicker" ).datepicker();
    $( ".datepicker" ).datepicker({
        changeMonth: true,
        changeYear: true,
        minDate: new Date(1901, 1 - 1, 1)
	});
});

// $(function() {
//     $( '.datepicker').jdPicker({
//         month_names: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
//         short_month_names: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
//         short_day_names: ["D", "L", "M", "M", "J", "V", "S"],
//         error_out_of_range: "La fecha seleccionada est&aacute; fuera de rango",
//         date_format: "dd/mm/YYYY",
//         select_week: 0,
//         show_week: 1,
//         date_min: "01/01/1901",
//         date_max: "31/12/2099"
//         //selectable_days:[1, 2, 3, 4, 5, 6],
//         //non_selectable:["01/05/2011","02/05/2011","03/05/2011","04/05/2011","05/05/2011"],
//     });
// });