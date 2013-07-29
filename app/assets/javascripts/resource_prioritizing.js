$(document).ready( function() {
	$(function() {
    $( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
    $( ".sortable" ).onUpdate()
	});
});
