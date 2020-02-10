
	window.onload = digitized();
	executelist();	
	setInterval(digitized, 1000);
	
	function digitized() {
        var dt = new Date();
        hrs = (dt.getHours() < 10) ? '0' + dt.getHours() : dt.getHours();
        min = (dt.getMinutes() < 10) ? '0' + dt.getMinutes() : dt.getMinutes();
        sec = (dt.getSeconds() < 10) ? '0' + dt.getSeconds() : dt.getSeconds();
        
        document.getElementById('dc').innerHTML = hrs + ":" + min;
        document.getElementById('dc_second').innerHTML = sec;
        document.getElementById('dc_hour').innerHTML = (dt.getHours() > 12) ? 'PM' : 'AM';
        
        if(min == "00" && sec == "00")
        {
        	executelist();
        	
        }	
      
        delete dt;
        delete hrs;
        delete min;
        delete sec;
    }
    
    function executelist()
    {
    	try
    	{
    		var meses = new Array ("enero","febrero","marzo","abril","mayo","junio","julio","agosto","septiembre","octubre","noviembre","diciembre");
    		var dias = new Array ("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado");
    		var f=new Date();
    		document.getElementById('lblFecha').innerHTML = '' + dias[f.getDay()] + ', ' + f.getDate() + ' de ' + meses[f.getMonth()] + ' de ' + f.getFullYear();
    		
    		if(document.getElementById('hdiTeam').value != '')
        		listHorario
    	}
    	catch(err)
    	{
    		alert(err.message);
    	}
    	finally
    	{
    		document.getElementById('iloader').style.visibility = 'hidden';
    	}
    }
    
    function listHorario()
    {
    	var src = "ServletWTime";
    	var piteam = document.getElementById('hdiTeam').value;
    	$.post(src, {operacion: "hour", iTeam : piteam},
				function(pdata) {
				var obj = JSON.parse(pdata);
				$('#cboHorario option').remove();
					if(obj[0].hours != "null"){
	    				$.each(obj, function (i, item) {
	    				    $('#cboHorario').append($('<option>', { 
	    				        value: item.hours,
	    				        text : item.hoursDisplay 
	    				    }));
	    				});
					}
					else
					{
	    				    $('#cboHorario').append($('<option>', { 
	    				        value: '0',
	    				        text : 'Seleccionar' 
	    				}));
						document.getElementById('lblmessage').innerHTML = "Por favor actualizar la ventana (F5).";
					}
				});
    }