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

//= require jquery.datetimepicker

$(function(){ $(document).foundation(); });

$(document).on('click', '.team-users-slider, .list', function(){
	$($(this).next()).slideToggle("slow", function(){
	});
});

// Removed tooltips function, so commented out this otherwise helpful function
// $(document).on('click', '.fa-close, .fa-check', function(){
// 	$('.tooltip').hide();
// });

$(document).delegate(
  ".datetimepicker-inputs", 
  'click', 
  function() 
  {
    $("#task_starttime").datetimepicker({
      format:'l, dS F, Y, g:i a',
      step: 15,
      minDate: 0,
      closeOnDateSelect: true,
      allowBlank: true,
      timeFormat: 'h:mm p',
      // onShow:function( ct ){
      //   if ($('#task_endtime').val()) {
      //     this.setOptions({
      //       maxDate:$('#task_endtime').val()?$('#task_endtime').val():false
      //     })
      //   }
      // }
    });
    $("#task_endtime").datetimepicker({
      format:'l, dS F, Y, g:i a',
      step: 15,
      minDate:0,
      closeOnDateSelect:true,
      allowBlank: true,
      timeFormat: 'h:mm p',
      // onShow:function( ct ){
      //   if ($('#task_starttime').val()) {
      //     this.setOptions({
      //       minDate:$('#task_starttime').val()?$('#task_starttime').val():false
      //     })
      //   }
      // }
    });
    $("#task_starttime_update").datetimepicker({
    	format:'l, dS F, Y, g:i a',
    	step: 15,
    	minDate: 0,
    	closeOnDateSelect: true,
    	allowBlank: true,
    	timeFormat: 'h:mm p',
  		// onShow:function( ct ){
    //     if ($('#task_endtime_update').val()) {
    //   		this.setOptions({
    //     		maxDate:$('#task_endtime_update').val()?$('#task_endtime_update').val():false
    //    		})
    //     }
    // 	}
    });
    $("#task_endtime_update").datetimepicker({
    	format:'l, dS F, Y, g:i a',
    	step: 15,
    	minDate:0,
    	closeOnDateSelect:true,
    	allowBlank: true,
    	timeFormat: 'h:mm p',
    	// onShow:function( ct ){
     //    if ($('#task_starttime_update').val()) {
     //  		this.setOptions({
     //  			minDate:$('#task_starttime_update').val()?$('#task_starttime_update').val():false
     //   		})
     //    }
    	// }
    });
  }
);

$(document).ready(function() {
  $('.list').children().hide()
}