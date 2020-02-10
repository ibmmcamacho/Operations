<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
BeanSession objBeanSessionCleft = null;
objBeanSessionCleft = (BeanSession) session.getAttribute("usuarioLogin");
%>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%-- 	pageEncoding="ISO-8859-1"%> --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="<%=request.getContextPath()%>/resources/custom/js/underscore-min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	var iEmpleado = "<%=objBeanSessionCleft.getObjBeanPersonal().getiIdEmpleado()%>";
	var strUsuario = "<%=objBeanSessionCleft.getObjBeanPersonal().getStrIdLogin()%>";
	var piTeam = "<%=objBeanSessionCleft.getObjBeanPersonal().getiTeam()%>";
		
	var src = "ServletWHome";
	
	$.post(src, {op : "Menu", us : iEmpleado, iteam : piTeam}, 
			function(pdata) {
		if(pdata != "error" || pdata != null || pdata != "null")
		{
		var objJson = JSON.parse(pdata);
		
		var groupedData = _.groupBy(objJson, function(d){return d.nivel});
// 		console.log(groupedData);
		var strMenu = "";
		var irows = objJson.length;
		var icount = 0;
		
		strMenu += "<li class=\"header\">PANEL DE CONTROL</li>";
		for(i = 0 ; i < groupedData.one.length ; i++){
			if(groupedData.one[i].orden == icount + 1){
				icount += 1;
				strMenu += "<li " + (groupedData.one[i].url == "#" ? "class=\"treeview\"" : "") + "> <a href=\"" + (groupedData.one[i].url == "#" ? "#" : "javascript:recargarDiv('wcontentRight', \'<%=request.getContextPath()%>" + groupedData.one[i].url + "\')") + "\">";
				strMenu += "<i class=\"" + groupedData.one[i].iconizq + "\"></i> <span>" + groupedData.one[i].descripcion + "</span>";
				strMenu += "<i class=\"" + groupedData.one[i].iconder + "\"></i> </a>" + (groupedData.one[i].url == "#" ? "<ul class=\"treeview-menu\">" : "");
					if(groupedData.two !== undefined){
						for(j = 0 ; j < groupedData.two.length ; j++){
							if(groupedData.two[j].orden == icount + 1){
								icount += 1;
								strMenu += "<li " + (groupedData.two[j].url == "#" ? "class=\"treeview\"" : "") + "> <a href=\"" + (groupedData.two[j].url == "#" ? "#" : "javascript:recargarDiv('wcontentRight', \'<%=request.getContextPath()%>" + groupedData.two[j].url + "\')") + "\">";
								strMenu += "<i class=\"" + groupedData.two[j].iconizq + "\"></i> <span>" + groupedData.two[j].descripcion + "</span>";
								strMenu += "<i class=\"" + groupedData.two[j].iconder + "\"></i> </a>" + (groupedData.two[j].url == "#" ? "<ul class=\"treeview-menu\">" : "");
									if(groupedData.three !== undefined){
										for(k = 0 ; k < groupedData.three.length ; k++){
											if(groupedData.three[k].orden == icount + 1){
												icount += 1;
												strMenu += "<li " + (groupedData.three[k].url == "#" ? "class=\"treeview\"" : "") + "> <a href=\"" + (groupedData.three[k].url == "#" ? "#" : "javascript:recargarDiv('wcontentRight', \'<%=request.getContextPath()%>" + groupedData.three[k].url + "\')") + "\">";
												strMenu += "<i class=\"" + groupedData.three[k].iconizq + "\"></i> <span>" + groupedData.three[k].descripcion + "</span>";
												strMenu += "<i class=\"" + groupedData.three[k].iconder + "\"></i> </a>";	
												strMenu += "</li>";
											}
										}
									}
									strMenu += (groupedData.two[j].url == "#" ? "</ul> </li>" : "</li>");
								}
						}
					}
				strMenu += (groupedData.one[i].url == "#" ? "</ul> </li>" : "</li>");
			}
		}
// 		console.log(strMenu);
		document.getElementById("liMenu").innerHTML = strMenu;
		}
		else
		{
			console.log("Hubo un error al llamar al menú");
		}
	});
});

</script>

  <aside class="main-sidebar">
    <section class="sidebar"> 
    
	    <div class="user-panel">
	        <div class="pull-left image">
	        <img src="<%=objBeanSessionCleft.getObjBeanPersonal().getStrPhoto()%>" class="" alt="Usuario">
	        </div>
	        <div class="pull-left info">
	          <p><%=objBeanSessionCleft.getObjBeanPersonal().getStrNombre() %></p>
	          <a href="#"><i class="fa fa-circle text-success"></i> <%=objBeanSessionCleft.getObjBeanPersonal().getStrPerfil()%> </a>
	        </div>
	    </div>
         
	    <ul id="liMenu" class="sidebar-menu"></ul>
    </section>
  </aside>

</html>