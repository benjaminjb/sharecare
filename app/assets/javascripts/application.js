//= require jquery
//= require jquery_ujs

//= require jquery-ui/button
//= require jquery-ui/datepicker

// only require what you need

//= require_tree .

//= require jquery.datetimepicker
//= require sweet-alert

$(document).on('click', '.team-users-slider', function(){
	$($(this).next()).slideToggle("slow", function(){
	});
});

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

function checkChildren(address) {
  if ($(address).children().length > 0) {
    $(address).show();
  } else {
    $(address).hide();
  }
}

function addAlert( alertStyle, alertType, alertMessage, alertPlacement, alertLength ) {
  switch (alertStyle) {
    case "sweet":
      swal({
        title: alertType.charAt(0).toUpperCase() + alertType.substring(1) + "!",
        type: alertType,
        text: alertMessage,  
        timer: alertLength,
        allowOutsideClick: true 
      });
      break;
    default: 
      $(alertPlacement).before('<div data-alert class="alert-box '+ alertType +' radius">'+alertMessage+'</div> ');
      SlideUpRemoveAlerts(alertLength);
  }
}

function SlideUpRemoveAlerts(count) {
  var timer = count || 2000;
  $( '.alert-box' ).delay(timer).slideUp('slow', function() {
    $( '.alert-box' ).remove();
  });
};

// To override the usual confirm (on leave and delete functions)
// (Data confirm left into those functions to provide back-up)
// This overrides the usual rails confirm action
$.rails.confirm = function(message, element) { 
  return true;
};

// set a temporary override so that 
var override = false;

$('[data-confirm]').on('click', function (e) {
  // If the override is true -- which happens if we click "yes" on this confirm modal
  // then we are returned from this entire function
  if (override) {
    override = false;
    return;
  }
  
  swal({
    title: "Warning",
    text: $(e.currentTarget).attr('data-confirm'),
    allowOutsideClick: true,
    type: "warning",   
    showCancelButton: true,   
    confirmButtonColor: "#DD6B55",   
    confirmButtonText: "Yes, I'm sure!",
    closeOnConfirm: true 
  }, 
  function (){
    override = true;
    e.currentTarget.click();
  }
  );
  // to prevent e from running normally if override is false
  // if override is true, we skip this whole function
  e.preventDefault();
  return false;
})