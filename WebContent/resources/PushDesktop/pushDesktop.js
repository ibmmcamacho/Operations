

// Validamos y activamos el Permiso para Notificar
//if(Notification.permission!=="granted") {
//	Notification.requestPermission();
//}

if (Notification.permission !== 'denied' || Notification.permission === "default") {
    Notification.requestPermission(function (permission) {
      // Si el usuario nos lo concede, creamos la notificación
      if (permission === "granted") {
        var notification = new Notification("");
      }
    });
  }
 	
// Instanciamos el botón, para que al hacer Click en el, se proceda a lanzar la Notificación o un mensaje para actualizar el Navegador
//document.getElementById("btn_notificar").addEventListener("click", onNotificationButtonClick);
 
// Validamos si el Navegador soporta las Notificaciones en HTML 5
function onNotificationButtonClick(titulo, contenido,imagen,openUrl) {
	if (!isNotificationSupported()) {
		logg("Tu navegador no soporta Notificaciones. Por favor, utiliza una versión Reciente del Navegador Google Chrome o Safari.");
	return;
	}
 
	// Si el Navegador soporta las Notificaciones HTML 5, entonces que proceda a Notificar
	var notificacion = new Notification(titulo, {
	    icon: imagen,
	    body: contenido
	});
 
	// Redireccionamos a un determinado Destino o URL al hacer click en la Notificación
	notificacion.onclick = function() {
		window.open(openUrl);
	};					
}

// Solicitamos los Permisos del Sistema
function requestPermissions() {

}

// Luego del Permiso del Sistema, le indicamos que nos Muestre la Notificación
function isNotificationSupported() {
	return ("Notification" in window);
}
 
// Mostramos el Mensaje de la Notificación
function logg(mensaje) {
	notificador.innerHTML += "<p>"+mensaje+"</p>";
}