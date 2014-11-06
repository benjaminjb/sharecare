//= require jquery
//= require jquery_ujs

//= require jquery-ui/

//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/mouse
//= require jquery-ui/position
//= require jquery-ui/selectable

//= require jquery-ui/accordion
//= require jquery-ui/button
//= require jquery-ui/datepicker
//= require jquery-ui/menu
//= require jquery-ui/selectmenu
//= require jquery-ui/tabs
//= require jquery-ui/tooltip

//= require jquery-ui/effect
//= require jquery-ui/effect-blind
//= require jquery-ui/effect-bounce
//= require jquery-ui/effect-drop
//= require jquery-ui/effect-fade
//= require jquery-ui/effect-shake
//= require jquery-ui/effect-slide


// only require what you need
//= require foundation
//= require best_in_place
//= require best_in_place.jquery-ui
//= require_tree .


$(function(){ $(document).foundation(); });

$(function(){
	$('.team-users-slider').click(function(){
		$($(this).next()).slideToggle("slow", function(){
		});
	});
});
