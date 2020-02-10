$(document).ready(function(){

	$('.cbo2').select2({
		placeholder: 'Seleccionar',
		//theme: 'classic',
		width: 'auto'
		//minimumResultsForSearch: Infinity
	});
	
	$('.timePicker').clockpicker({
		'default': 'now',
		placement: 'bottom',
	    align: 'left',
	    autoclose: true
	});
	
	$('.timePicker2').clockpicker({
		'default': 'now',
		placement: 'bottom',
	    align: 'left',
	    autoclose: true
	});
	
	$('.dateTimePicker').datetimepicker({
	    format: 'YYYY-MM-DD HH:mm:ss',
	    tooltips: {
		    today: 'Ir al día de hoy',
		    clear: 'Limpiar selección',
		    close: 'Cerrar calendario',
		    selectMonth: 'Seleccionar Mes',
		    prevMonth: 'Mes anterior',
		    nextMonth: 'Mes siguiente',
		    selectYear: 'Seleccionar año',
		    prevYear: 'Año anterior',
		    nextYear: 'Año siguiente',
		    selectDecade: 'Seleccionar una decada',
		    prevDecade: 'Decada anterior',
		    nextDecade: 'Decada siguiente',
		    prevCentury: 'Siglo anterior',
		    nextCentury: 'Siglo siguiente'
		}
	});
	
	$('.dateTimePicker2').datetimepicker({
	    format: 'YYYY-MM-DD HH:mm',
	    tooltips: {
		    today: 'Ir al día de hoy',
		    clear: 'Limpiar selección',
		    close: 'Cerrar calendario',
		    selectMonth: 'Seleccionar Mes',
		    prevMonth: 'Mes anterior',
		    nextMonth: 'Mes siguiente',
		    selectYear: 'Seleccionar año',
		    prevYear: 'Año anterior',
		    nextYear: 'Año siguiente',
		    selectDecade: 'Seleccionar una decada',
		    prevDecade: 'Decada anterior',
		    nextDecade: 'Decada siguiente',
		    prevCentury: 'Siglo anterior',
		    nextCentury: 'Siglo siguiente'
		}
	});
	
	$('.datePicker').datetimepicker({
	    format: 'YYYY-MM-DD',
	    tooltips: {
		    today: 'Ir al día de hoy',
		    clear: 'Limpiar selección',
		    close: 'Cerrar calendario',
		    selectMonth: 'Seleccionar Mes',
		    prevMonth: 'Mes anterior',
		    nextMonth: 'Mes siguiente',
		    selectYear: 'Seleccionar año',
		    prevYear: 'Año anterior',
		    nextYear: 'Año siguiente',
		    selectDecade: 'Seleccionar una decada',
		    prevDecade: 'Decada anterior',
		    nextDecade: 'Decada siguiente',
		    prevCentury: 'Siglo anterior',
		    nextCentury: 'Siglo siguiente'
		}
	});
	
	
});