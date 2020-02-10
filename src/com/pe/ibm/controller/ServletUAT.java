package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanUAT;
import com.pe.ibm.bean.BeanUATDispositivos;
import com.pe.ibm.bean.BeanUATGrupos;
import com.pe.ibm.bean.BeanUATSharedId;
import com.pe.ibm.bean.BeanUATUsuarios;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.business.BusinessUAT;
import com.pe.ibm.util.AppUtils;
import com.pe.ibm.ws.WsAutomationAnywhere;

/**
 * Servlet implementation class ServletWTeam
 */
@WebServlet("/ServletUAT")
public class ServletUAT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUAT() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* Obtener sqlsessionF*/
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		
			
		String strOperacion = request.getParameter("strOperation");
		
		if (strOperacion.equals("ruat"))
			ruat(request, response, ssf);
		else if(strOperacion.equals("ruatdisp"))
			ruatdisp(request, response, ssf);
		else if(strOperacion.equals("ruatgrupos"))
			ruatgrupos(request, response, ssf);
		else if(strOperacion.equals("ruatusuarios"))
			ruatusuarios(request, response, ssf);
		else if(strOperacion.equals("ruatsharedid"))
			ruatsharedid(request, response, ssf);
		else if(strOperacion.equals("cuduat"))
			cuduat(request, response, ssf);
		else if(strOperacion.equals("cuduatdisp"))
			cuduatdisp(request, response, ssf);
		else if(strOperacion.equals("cuduatgrupos"))
			cuduatgrupos(request, response, ssf);
		else if(strOperacion.equals("cuduatusuarios"))
			cuduatusuarios(request, response, ssf);
		else if(strOperacion.equals("cuduatsharedid"))
			cuduatsharedid(request, response, ssf);
//		else if(strOperacion.equals("cuduatsharedid"))
//			cuduatsharedid(request, response, ssf);
		else if(strOperacion.equals("cstates"))
			cstates(request, response, ssf);
		else if(strOperacion.equals("listimg"))
			listimg(request, response, ssf);
		else if(strOperacion.equals("buscarldap"))
			buscarldap(request, response, ssf);
		else if(strOperacion.equals("buscarmax")) {
			SqlSessionFactory ssf1 = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMXPRD");
			buscarmax(request, response, ssf1);
		}else if(strOperacion.equals("buscarmaxattachment")) {
			SqlSessionFactory ssf1 = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMXPRD");
			buscarmaxattachment(request, response, ssf1);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void ruat(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			List<BeanUAT> lstBean = null;
			BeanUAT objbean = new BeanUAT();
			
			int idReq = Integer.parseInt(req.getParameter("iIdReq"));
			String strEstadoFinal = req.getParameter("estadofinal");
			
			objbean.setiIdRequerimiento(idReq);
			objbean.setStrEstado(strEstadoFinal);
			BusinessUAT objBusiness = new BusinessUAT();
			
			lstBean = objBusiness.getruat(objbean, ssf);
		
			
			if (lstBean.size() > 0) {
				for (BeanUAT item : lstBean) {
					strJson1.append("{\"iIdRequerimiento\" : \"" + item.getiIdRequerimiento() + "\",");
					strJson1.append("\"strTipoRequerimiento\" : \"" + item.getStrTipoRequerimiento() + "\",");
					strJson1.append("\"strEstado\" : \"" + item.getStrEstado() + "\",");
					strJson1.append("\"strIdTicket\" : \"" + item.getStrIdTicket() + "\",");
					strJson1.append("\"strHostname\" : \"" + item.getStrHostname() + "\",");
					strJson1.append("\"strAmbiente\" : \"" + item.getStrAmbiente() + "\",");
					strJson1.append("\"strPlataforma\" : \"" + item.getStrPlataforma() + "\",");
					strJson1.append("\"iIdTipoReq\" : \"" + item.getiTipoRequerimiento() + "\",");
					strJson1.append("\"iIdAmbiente\" : \"" + item.getiIdAmbiente() + "\",");
					strJson1.append("\"iIdPlataforma\" : \"" + item.getiIdPlataforma() + "\",");
					strJson1.append("\"inroDisp\" : \"" + item.getInroDisp() + "\",");
					strJson1.append("\"inroGrup\" : \"" + item.getInroGrup() + "\",");
					strJson1.append("\"inroUsu\" : \"" + item.getInroUsu() + "\",");
					strJson1.append("\"inroSha\" : \"" + item.getInroSha() + "\",");
					strJson1.append("\"strUsuarioC\" : \"" + item.getStrUsuarioC() + "\",");
					strJson1.append("\"strUsuarioM\" : \"" + item.getStrUsuarioM() + "\",");
					strJson1.append("\"strFechaM\" : \"" + item.getStrFechaM() + "\",");
					strJson1.append("\"strCliente\" : \"" + item.getStrCliente() + "\",");
					strJson1.append("\"strSystem\" : \"" + item.getStrSystem() + "\",");
					strJson1.append("\"strSO\" : \"" + item.getStrSo() + "\",");
					strJson1.append("\"strFechaVenc\" : \"" + item.getStrFechaVenc() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void ruatdisp(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			List<BeanUATDispositivos> lstBean = null;
			BeanUATDispositivos objbean = new BeanUATDispositivos();
			
			int idReq = Integer.parseInt(req.getParameter("iIdReq"));
			int idDisp = Integer.parseInt(req.getParameter("idTipo"));
			
			objbean.setiIdRequerimiento(idReq);
			objbean.setiIdDispositivo(idDisp);
			BusinessUAT objBusiness = new BusinessUAT();
			
			lstBean = objBusiness.getruatdisp(objbean, ssf);
			
			if (lstBean.size() > 0) {
				for (BeanUATDispositivos item : lstBean) {
					strJson1.append("{\"iIdDispositivo\" : \"" + item.getiIdDispositivo() + "\",");
					strJson1.append("\"iIdRequerimiento\" : \"" + item.getiIdRequerimiento() + "\",");
					strJson1.append("\"strHostname\" : \"" + item.getStrHostname() + "\",");
					strJson1.append("\"strIp\" : \"" + item.getStrIp() + "\",");
					strJson1.append("\"strEstadoDisp\" : \"" + item.getStrEstadoDisp() + "\",");
					strJson1.append("\"strTeamDelivery\" : \"" + item.getStrTeamDelivery() + "\",");
					strJson1.append("\"strAutomatizado\" : \"" + item.getStrAutomatizado() + "\",");
					strJson1.append("\"strRole\" : \"" + item.getStrRole() + "\",");
					strJson1.append("\"strConexion\" : \"" + item.getStrConexion() + "\",");
					
					strJson1.append("\"strDispositivoMaestro\" : \"" + item.getStrDispositivoMaestro() + "\",");
					strJson1.append("\"strDispositivoMaestro2\" : \"" + item.getStrDispositivoMaestro2() + "\",");
					strJson1.append("\"strUltQEV\" : \"" + item.getStrUltQEV() + "\",");
					strJson1.append("\"strUltCbnAcceso\" : \"" + item.getStrUltCbnAcceso() + "\",");
					strJson1.append("\"strUltCbnPriv\" : \"" + item.getStrUltCbnPriv() + "\",");
					strJson1.append("\"strUltQEVCli\" : \"" + item.getStrUltQEVCli() + "\",");
					strJson1.append("\"strUltCbnAccesoCli\" : \"" + item.getStrUltCbnAccesoCli() + "\",");
					strJson1.append("\"strUltCbnPrivCli\" : \"" + item.getStrUltCbnPrivCli() + "\",");
					
					strJson1.append("\"iEstadoDispositivo\" : \"" + item.getiEstadoDispositivo() + "\",");
					strJson1.append("\"iTeamDelivery\" : \"" + item.getiTeamDelivery() + "\",");
					strJson1.append("\"iAutomatizado\" : \"" + item.getiAutomatizado() + "\",");
					strJson1.append("\"iRoleDispositivo\" : \"" + item.getiRoleDispositivo() + "\",");
					strJson1.append("\"iConexion\" : \"" + item.getiConexion() + "\",");
					strJson1.append("\"strUsuarioC\" : \"" + item.getStrUsuarioC() + "\",");
					strJson1.append("\"strUsuarioM\" : \"" + item.getStrUsuarioM() + "\",");
					strJson1.append("\"strFechaM\" : \"" + item.getStrFechaM() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void ruatgrupos(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			List<BeanUATGrupos> lstBean = null;
			BeanUATGrupos objbean = new BeanUATGrupos();
			
			int iIdReq = Integer.parseInt(req.getParameter("iIdReq"));
			int idGrp = Integer.parseInt(req.getParameter("idTipo"));
			
			objbean.setiIdRequerimiento(iIdReq);
			objbean.setiIdGrupo(idGrp);
			BusinessUAT objBusiness = new BusinessUAT();
			
			lstBean = objBusiness.getruatgrupos(objbean, ssf);
			
			if (lstBean.size() > 0) {
				for (BeanUATGrupos item : lstBean) {
					strJson1.append("{\"iIdGrupo\" : \"" + item.getiIdGrupo() + "\",");
					strJson1.append("\"iIdRequerimiento\" : \"" + item.getiIdRequerimiento() + "\",");
					strJson1.append("\"strGrupo\" : \"" + item.getStrGrupo() + "\",");
					
					strJson1.append("\"strCodigoIntermedio\" : \"" + item.getStrCodigoIntermedio() + "\",");
					strJson1.append("\"strTipo\" : \"" + item.getStrTipo() + "\",");
					strJson1.append("\"strSistema\" : \"" + item.getStrSistema() + "\",");
					strJson1.append("\"strPrimaria\" : \"" + item.getStrPrimaria() + "\",");
					strJson1.append("\"strRestringido\" : \"" + item.getStrRestringido() + "\",");
					strJson1.append("\"strPrivilegio\" : \"" + item.getStrPrivilegio() + "\",");
					strJson1.append("\"strTipoAcceso\" : \"" + item.getStrTipoAcceso() + "\",");
					strJson1.append("\"strSistema2\" : \"" + item.getStrSistema2() + "\",");
					
					strJson1.append("\"iCodigoIntermedio\" : \"" + item.getiCodigoIntermedio() + "\",");
					strJson1.append("\"iTipo\" : \"" + item.getiTipo() + "\",");
					strJson1.append("\"iSistema\" : \"" + item.getiSistema() + "\",");
					strJson1.append("\"iPrimaria\" : \"" + item.getiPrimaria() + "\",");
					strJson1.append("\"iRestringido\" : \"" + item.getiRestringido() + "\",");
					strJson1.append("\"iPrivilegio\" : \"" + item.getiPrivilegio() + "\",");
					strJson1.append("\"iTipoAcceso\" : \"" + item.getiTipoAcceso() + "\",");
					strJson1.append("\"strUsuarioC\" : \"" + item.getStrUsuarioC() + "\",");
					strJson1.append("\"strUsuarioM\" : \"" + item.getStrUsuarioM() + "\",");
					strJson1.append("\"strFechaM\" : \"" + item.getStrFechaM() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void ruatusuarios(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			List<BeanUATUsuarios> lstBean = null;
			BeanUATUsuarios objbean = new BeanUATUsuarios();
			
			int idReq = Integer.parseInt(req.getParameter("iIdReq"));
			int idUsu = Integer.parseInt(req.getParameter("idTipo"));
			
			objbean.setiIdRequerimiento(idReq);
			objbean.setiIdUsuario(idUsu);
			BusinessUAT objBusiness = new BusinessUAT();
			
			lstBean = objBusiness.getruatUsuarios(objbean, ssf);

			if (lstBean.size() > 0) {
				for (BeanUATUsuarios item : lstBean) {
					strJson1.append("{\"iIdUsuarios\" : \"" + item.getiIdUsuarios() + "\",");
					strJson1.append("\"iIdRequerimiento\" : \"" + item.getiIdRequerimiento() + "\",");
					strJson1.append("\"strUsuario\" : \"" + item.getStrUsuario() + "\",");
					strJson1.append("\"strEtiqueta\" : \"" + item.getStrEtiqueta() + "\",");
					strJson1.append("\"strPropietario\" : \"" + item.getStrPropietario() + "\",");
					strJson1.append("\"strTipo\" : \"" + item.getStrTipo() + "\",");
					strJson1.append("\"strSistema\" : \"" + item.getStrSistema() + "\",");
					strJson1.append("\"strContraseniaExpira\" : \"" + item.getStrContraseniaExpira() + "\",");
					strJson1.append("\"iTipo\" : \"" + item.getiTipo() + "\",");
					strJson1.append("\"iSistema\" : \"" + item.getiSistema() + "\",");
					strJson1.append("\"iContraseniaExpira\" : \"" + item.getiContraseniaExpira() + "\",");
					strJson1.append("\"strPerfilesAsociados\" : \"" + item.getStrPerfilesAsociados() + "\",");
					strJson1.append("\"strUsuarioC\" : \"" + item.getStrUsuarioC() + "\",");
					strJson1.append("\"strUsuarioM\" : \"" + item.getStrUsuarioM() + "\",");
					strJson1.append("\"strFechaM\" : \"" + item.getStrFechaM() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void ruatsharedid(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			List<BeanUATSharedId> lstBean = null;
			BeanUATSharedId objbean = new BeanUATSharedId();
			
			int iIdReq = Integer.parseInt(req.getParameter("iIdReq"));
			int idSh = Integer.parseInt(req.getParameter("idTipo"));
			
			objbean.setiIdRequerimiento(iIdReq);
			objbean.setiIdSharedId(idSh);
			BusinessUAT objBusiness = new BusinessUAT();
			
			lstBean = objBusiness.getruatSharedId(objbean, ssf);
			
			if (lstBean.size() > 0) {
				for (BeanUATSharedId item : lstBean) {
					strJson1.append("{\"iIdSharedId\" : \"" + item.getiIdSharedId() + "\",");
					strJson1.append("\"iIdRequerimiento\" : \"" + item.getiIdRequerimiento() + "\",");
					strJson1.append("\"strUsuarioCompartido\" : \"" + item.getStrUsuarioCompartido() + "\",");
					
					strJson1.append("\"strUsuarioFuncional\" : \"" + item.getStrUsuarioFuncional() + "\",");
					strJson1.append("\"strCambioContraseniaAuto\" : \"" + item.getStrCambioContraseniaAuto() + "\",");
					strJson1.append("\"strContraseniaCambiable\" : \"" + item.getStrContraseniaCambiable() + "\",");
					strJson1.append("\"strVisibilidad\" : \"" + item.getStrVisibilidad() + "\",");
					strJson1.append("\"strTimeApoyo\" : \"" + item.getStrTimeApoyo() + "\",");
					strJson1.append("\"strContraseniaServ\" : \"" + item.getStrContraseniaServ() + "\",");
					strJson1.append("\"strIntervaloCambioContrasenia\" : \"" + item.getStrIntervaloCambioContrasenia() + "\",");
					strJson1.append("\"strPeriodoAntApertLlamada\" : \"" + item.getStrPeriodoAntApertLlamada() + "\",");
					strJson1.append("\"strEjecutivoAprobar\" : \"" + item.getStrEjecutivoAprobar() + "\",");
					strJson1.append("\"strContrasenia\" : \"" + item.getStrContrasenia() + "\",");
					strJson1.append("\"strJustificacionNoCambio\" : \"" + item.getStrJustificacionNoCambio() + "\",");
					
					strJson1.append("\"iUsuarioFuncional\" : \"" + item.getiUsuarioFuncional() + "\",");
					strJson1.append("\"iCambioContrasenioAuto\" : \"" + item.getiCambioContraseniaAuto() + "\",");
					strJson1.append("\"iContrasenioCambiable\" : \"" + item.getiContraseniaCambiable() + "\",");
					strJson1.append("\"iVisibilidad\" : \"" + item.getiVisibilidad() + "\",");
					strJson1.append("\"iTimeApoyo\" : \"" + item.getiTimeApoyo() + "\",");
					strJson1.append("\"iContraseniaServ\" : \"" + item.getiContraseniaServ() + "\",");
					strJson1.append("\"iIntervaloCambioContrasenia\" : \"" + item.getiIntervaloCambioContrasenia() + "\",");
					strJson1.append("\"iPeriodoAntApertLlamada\" : \"" + item.getiPeriodoAntApertLlamada() + "\",");
					strJson1.append("\"strJustificacionCompartir\" : \"" + item.getStrJustificacionCompartir() + "\",");
					strJson1.append("\"strCriterioAprobar\" : \"" + item.getStrCriterioAprobar() + "\",");
					strJson1.append("\"iCambioPeriodo\" : \"" + item.getiCambioPeriodo() + "\",");
					strJson1.append("\"iTipoAccion\" : \"" + item.getiTipoAccion() + "\",");
					strJson1.append("\"strUsuarioC\" : \"" + item.getStrUsuarioC() + "\",");
					strJson1.append("\"strUsuarioM\" : \"" + item.getStrUsuarioM() + "\",");
					strJson1.append("\"strFechaM\" : \"" + item.getStrFechaM() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	
	public void cuduat(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf)
			throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanUAT objbean = new BeanUAT();
			BusinessUAT objbusiness = new BusinessUAT();
			int ipaso = Integer.parseInt(req.getParameter("paso"));
			int ires = 0;
			if(ipaso == 1) {
				objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("idReq")));
				objbean.setiIdAmbiente(Integer.parseInt(req.getParameter("pAmbiente")));
				objbean.setStrHostname(req.getParameter("pHostname"));
				objbean.setiIdPlataforma(Integer.parseInt(req.getParameter("pPlataforma")));
				objbean.setStrIdTicket(req.getParameter("pTicket"));
				objbean.setiTipoRequerimiento(Integer.parseInt(req.getParameter("pTipoRequerimiento")));
				objbean.setStrCliente(req.getParameter("pCliente"));
				objbean.setiTipo(1);
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
			}
			else {
				objbean.setiTipo(2);
				objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("idReq")));
			}
			
			ires = objbusiness.cuduat(objbean, ssf);
			if(ires > 0)
				strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruat\",\"mensaje\" : \"\"},");
			else
				strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruat\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"0\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void cuduatdisp(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanUATDispositivos objbean = new BeanUATDispositivos();
			BusinessUAT objbusiness = new BusinessUAT();
			int ipaso = Integer.parseInt(req.getParameter("paso"));
			int ires = 0;
			if(ipaso == 1 || ipaso == 4) {
				
				objbean.setiIdDispositivo(Integer.parseInt(req.getParameter("idTipo")));
				objbean.setStrHostname(req.getParameter("pDispHostname"));
				objbean.setStrUltCbnAcceso(req.getParameter("DispUltCBNAcceso"));
				objbean.setStrUltCbnAccesoCli(req.getParameter("DispUltCBNAccesoCli"));
				objbean.setStrUltCbnPrivCli(req.getParameter("DispUltCBNPrivCli"));
				objbean.setStrUltQEVCli(req.getParameter("DispUltQEVCli"));
				objbean.setiAutomatizado(Integer.parseInt(req.getParameter("pDispAutomatizado")));
				objbean.setiConexion(Integer.parseInt(req.getParameter("pDispConexion")));
				objbean.setiEstadoDispositivo(Integer.parseInt(req.getParameter("pDispEstado")));
				objbean.setStrIp(req.getParameter("pDispIP"));
				objbean.setStrDispositivoMaestro(req.getParameter("pDispMaestro"));
				objbean.setStrDispositivoMaestro2(req.getParameter("pDispMaestro2"));
				objbean.setiRoleDispositivo(Integer.parseInt(req.getParameter("pDispRol")));
				objbean.setiTeamDelivery(Integer.parseInt(req.getParameter("pDispTeamDelivery")));
				objbean.setStrUltCbnPriv(req.getParameter("pDispUltCBNPriv"));
				objbean.setStrUltQEV(req.getParameter("pDispUltQEV"));
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
				objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("idReq")));
				
				objbean.setiTipo(1);
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
			}else {
				objbean.setiTipo(2);
				objbean.setiIdDispositivo(Integer.parseInt(req.getParameter("idTipo")));
			}
			
			ires = objbusiness.cuduatdisp(objbean, ssf);
			if(ires > 0)
				strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatdisp\",\"mensaje\" : \"\"},");
			else
				strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatdisp\",\"mensaje\" : \"Hubo un error interno\"},");
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"0\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
		
	}
	
	public void cuduatgrupos(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanUATGrupos objbean = new BeanUATGrupos();
			BusinessUAT objbusiness = new BusinessUAT();
			BusinessOptions optbusiness = new BusinessOptions();
			BeanOptions optbean = new BeanOptions();
			int ipaso = Integer.parseInt(req.getParameter("paso"));
			int ires = 0;
			if(ipaso == 1 || ipaso == 4) {
				objbean.setStrGrupo(req.getParameter("pGrGrupo"));
				if(req.getParameter("pGrCodIntermedio") != null) {
					objbean.setiIdGrupo(Integer.parseInt(req.getParameter("idTipo")));
					objbean.setiCodigoIntermedio(Integer.parseInt(req.getParameter("pGrCodIntermedio")));				
					objbean.setiPrimaria(Integer.parseInt(req.getParameter("pGrPrimaria")));
					objbean.setiPrivilegio(Integer.parseInt(req.getParameter("pGrPrivilegio")));
					objbean.setiRestringido(Integer.parseInt(req.getParameter("pGrRestringido")));
					objbean.setiSistema(Integer.parseInt(req.getParameter("pGrSistema")));
					objbean.setStrSistema2(req.getParameter("pGrSistema2"));
					objbean.setiTipo(Integer.parseInt(req.getParameter("pGrTipo")));
					objbean.setiTipoAcceso(Integer.parseInt(req.getParameter("pGrTipoAcceso")));
				}
				else {
					
					BeanParameters obj = new BeanParameters();
					obj.setStrValor1(req.getParameter("pCliente"));
					String strres = "";
					
					objbean.setiCodigoIntermedio(Integer.parseInt(objbusiness.listCodIntermediario2(obj, ssf).getStrValor1()));
					
					obj.setiTeam(1);
					obj.setStrType("UAT_GRP_TYPE");
					obj.setStrValor1("APPLICATION");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiTipo(optbean.getiIdOption());
					
					obj.setStrType("UAT_GRP_SYSTEM");
					obj.setStrValor1("NO");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiSistema(optbean.getiIdOption());
					
					obj.setStrType("UAT_GRP_PRIMARY");
					obj.setStrValor1("NO");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiPrimaria(optbean.getiIdOption());
					
					obj.setStrType("UAT_GRP_RESTRICTED");
					obj.setStrValor1("NO");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiRestringido(optbean.getiIdOption());
					
					obj.setStrType("UAT_GRP_PRIVILEGED");
					obj.setStrValor1("YES");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiPrivilegio(optbean.getiIdOption());
					
					obj.setStrType("UAT_GRP_TYPEACCESS");
					obj.setStrValor1("GROUP");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiTipoAcceso(optbean.getiIdOption());
					
				}
				
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
				objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("idReq")));
				objbean.setiTipo_(1);
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
			}
			else {
				objbean.setiTipo_(2);
				objbean.setiIdGrupo(Integer.parseInt(req.getParameter("idTipo")));
			}
			
				ires = objbusiness.cuduatgrupos(objbean, ssf);
				if(ires > 0)
					strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatgrupos\",\"mensaje\" : \"\"},");
				else
					strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatgrupos\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void cuduatusuarios(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanUATUsuarios objbean = new BeanUATUsuarios();
			BusinessUAT objbusiness = new BusinessUAT();
			BusinessOptions optbusiness = new BusinessOptions();
			BeanOptions optbean = new BeanOptions();
			int ipaso = Integer.parseInt(req.getParameter("paso"));
			int ires = 0;
			if(ipaso == 1 || ipaso == 4) {
				objbean.setiIdUsuarios(Integer.parseInt(req.getParameter("idTipo")));				
				objbean.setStrUsuario(req.getParameter("pUsuUsuario"));
				objbean.setStrEtiqueta(req.getParameter("pUsuEtiqueta"));
				objbean.setStrPerfilesAsociados(req.getParameter("pUsuPerfilesAsoc"));
				objbean.setStrPropietario(req.getParameter("pUsuPropietario"));
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
				objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("idReq")));
				objbean.setiTipo_(1);
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
				
				if(objbean.getStrEtiqueta().isEmpty()) {
					BeanParameters obj = new BeanParameters();
					String strres = "";
					
					if(objbean.getStrPropietario().contains("*")) {
						obj.setStrValor1(objbean.getStrPropietario());
						obj = objbusiness.listCodIntermediario(obj, ssf);
						if(obj != null) {
							if(obj.getStrValor3().isEmpty()) {
								objbean.setStrEtiqueta("815/C/" + objbean.getStrPropietario() + "//" + obj.getStrValor2());
								obj.setStrValor5("CUSTOMER");
							}
							else {
								obj.setStrValor5("APPLICATION");
								objbean.setStrEtiqueta("815/S/" + objbean.getStrPropietario() + "//" + obj.getStrValor2());	
							}
							
						}
						else
							objbean.setStrEtiqueta("");
					}
					else {
						obj = AppUtils.buscarLDAP(objbean.getStrPropietario());
						if(obj != null) {
							obj.setStrValor5("PERSONAL");
							objbean.setStrEtiqueta(obj.getStrValor3() + "/" +  
									(obj.getStrValor4().contains("LV") ? "E" : "I") + "/" +
									obj.getStrValor4() + "//" + obj.getStrValor1());
						}
						else
							objbean.setStrEtiqueta("");
					}
					
					objbean.setStrPropietario(objbean.getStrPropietario().length() <= 6 ? objbean.getStrPropietario() + obj.getStrValor3() : objbean.getStrPropietario());
					
					obj.setiTeam(1);
					obj.setStrType("UAT_USR_TYPE");
					obj.setStrValor1(obj.getStrValor5());
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiTipo(optbean.getiIdOption());
					
					obj.setStrType("UAT_USR_SYSTEM");
					obj.setStrValor1(obj.getStrValor5().equals("APPLICATION") ? "YES" : "NO");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiSistema(optbean.getiIdOption());
					
					obj.setStrType("UAT_USR_PASSWORDEXPIRES");
					obj.setStrValor1("YES");
					optbean = optbusiness.listOptions4(obj, ssf).get(0);
					objbean.setiContraseniaExpira(optbean.getiIdOption());
					
				}
				else {
					objbean.setiTipo(Integer.parseInt(req.getParameter("pUsuTipo")));
					objbean.setiSistema(Integer.parseInt(req.getParameter("UsuSistema")));
					objbean.setiContraseniaExpira(Integer.parseInt(req.getParameter("UsuContraseniaExpira")));
				}
				
				if(!objbean.getStrEtiqueta().isEmpty()) {
					ires = objbusiness.cuduatUsuarios(objbean, ssf);
				}
				
			}
			else {
				objbean.setiTipo_(2);
				objbean.setiIdUsuarios(Integer.parseInt(req.getParameter("idTipo")));
				ires = objbusiness.cuduatUsuarios(objbean, ssf);
			}
			
				if(ires > 0)
					strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatusuarios\",\"mensaje\" : \"\"},");
				else
					strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatusuarios\",\"mensaje\" : \"" + objbean.getStrPropietario() + "\"},");
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void cuduatsharedid(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanUATSharedId objbean = new BeanUATSharedId();
			BusinessUAT objbusiness = new BusinessUAT();
			int ipaso = Integer.parseInt(req.getParameter("paso"));
			int ires = 0;
			if(ipaso == 1 || ipaso == 4) {
				objbean.setiIdSharedId(Integer.parseInt(req.getParameter("idTipo")));
				objbean.setiVisibilidad(Integer.parseInt(req.getParameter("pSharedVisibilidad")));
				objbean.setiCambioContraseniaAuto(Integer.parseInt(req.getParameter("pSharedCambioContrasenia")));
				objbean.setiCambioPeriodo(Integer.parseInt(req.getParameter("pSharedCambioPeriodo")));
				objbean.setStrContrasenia(req.getParameter("pSharedContrasenia"));
				objbean.setiContraseniaCambiable(Integer.parseInt(req.getParameter("pSharedContraseniaCambiable")));
				objbean.setiContraseniaServ(Integer.parseInt(req.getParameter("pSharedContraseniaServ")));
				objbean.setStrCriterioAprobar(req.getParameter("pSharedCriterioAprobar"));
				objbean.setStrEjecutivoAprobar(req.getParameter("pSharedEjecutivoAprobador"));
				objbean.setiIntervaloCambioContrasenia(Integer.parseInt(req.getParameter("pSharedIntCambioContrasenia")));
				objbean.setStrJustificacionCompartir(req.getParameter("pSharedJustCompartir"));
				objbean.setStrJustificacionNoCambio(req.getParameter("pSharedJustificacionNoCambio"));
				objbean.setiPeriodoAntApertLlamada(Integer.parseInt(req.getParameter("pSharedPeriodoAperLlamada")));
				objbean.setiTimeApoyo(Integer.parseInt(req.getParameter("pSharedTimeApoyo")));
				objbean.setiTipoAccion(Integer.parseInt(req.getParameter("pSharedTipoAccion")));
				objbean.setStrUsuarioCompartido(req.getParameter("pSharedUsuCompartido"));
				objbean.setiUsuarioFuncional(Integer.parseInt(req.getParameter("pSharedUsuFuncional")));
				
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
				objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("idReq")));
				objbean.setiTipo(1);
				objbean.setiIdUsuario(Integer.parseInt(req.getParameter("pUser")));
			}
			else {
				objbean.setiTipo(2);
				objbean.setiIdSharedId(Integer.parseInt(req.getParameter("idTipo")));
			}
			
				ires = objbusiness.cuduatSharedId(objbean, ssf);
				if(ires > 0)
					strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatsharedid\",\"mensaje\" : \"\"},");
				else
					strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"ruatsharedid\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void cstates(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		WsAutomationAnywhere wsrpa = new WsAutomationAnywhere();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanUAT objbean = new BeanUAT();
			BusinessUAT objbusiness = new BusinessUAT();
			String pEstado = req.getParameter("pState").toString();
			int ires = 0;
			objbean.setiTipo(2);
			objbean.setStrUsuarioC(req.getParameter("pUser"));
			objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("idReq")));
			objbean.setStrEstado(pEstado);
			objbean.setStrMensaje("");
			ires = objbusiness.ustate(objbean, ssf);
			if(ires > 0) {
				strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"cstate\",\"mensaje\" : \"\"},");
				wsrpa.execCargaUAT(pEstado.equals("QUEUE") ? "cargauat" : pEstado.equals("QUEUE CAR") ? "cargacar" : "");
			}
			else
				strJson1.append("{\"resultado\" : \"" + ires + "\",\"oper\" : \"cstate\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void listimg(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanUAT objbean = new BeanUAT();
			BusinessUAT objbusiness = new BusinessUAT();
			String strres = "";
			objbean.setStrTipoRequerimiento(req.getParameter("idTipo"));
			objbean.setiIdRequerimiento(Integer.parseInt(req.getParameter("iIdReq")));
			strres = objbusiness.listimg(objbean, ssf);
			if(strres.length() != 0)
				strJson1.append("{\"resultado\" : \"" + strres + "\",\"oper\" : \"listimg\",\"mensaje\" : \"\"},");
			else
				strJson1.append("{\"resultado\" : \"" + strres + "\",\"oper\" : \"listimg\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void buscarldap(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanParameters obj = new BeanParameters();
			String strres = "";
			obj = AppUtils.buscarLDAP(req.getParameter("pcodigo"));
			
			if(obj != null)
				strJson1.append("{\"resultado\" : \"ok\",\"nombre\" : \"" + obj.getStrValor1() + "\",\"codigo\" : \"" + obj.getStrValor3() + "\",\"serial\" : \"" + obj.getStrValor4() + "\",\"oper\" : \"buscarldap\",\"mensaje\" : \"\"},");
			else
				strJson1.append("{\"resultado\" : \"empty\",\"oper\" : \"buscarldap\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void buscarmax(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanParameters obj = new BeanParameters();
			BusinessUAT bus = new BusinessUAT();
			
			obj.setStrValor1(req.getParameter("pticket"));
			obj = bus.listmax(obj, ssf);
			
			if(obj != null)
				strJson1.append("{\"resultado\" : \"ok\",\"ticket\" : \"" + obj.getStrValor1() + "\",\"hostname\" : \"" + obj.getStrValor2().toUpperCase() + "\",\"ip\" : \"" + obj.getStrValor3() + "\",\"client\" : \"" + obj.getStrValor4() + "\",\"oper\" : \"buscarmax\",\"mensaje\" : \"\"},");
			else
				strJson1.append("{\"resultado\" : \"empty\",\"oper\" : \"buscarmax\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void buscarmaxattachment(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"uat\" : [");
		try {
			BeanParameters obj = new BeanParameters();
			List<BeanParameters> lst = new ArrayList<BeanParameters>();
			BusinessUAT bus = new BusinessUAT();
			
			obj.setStrValor1(req.getParameter("pticket"));
			lst = bus.listmaxattachment(obj, ssf);
			
			if(obj != null) {
				strJson1.append("{\"resultado\" : \"ok\",\"attachment\" : [");
				if(lst.size() > 0) {
					for(int i = 0 ; i < lst.size() ; i++) {
						strJson1.append("{\"descripcion\":\"" + lst.get(i).getStrValor1() + "\",");
						strJson1.append("\"descripcionEncode\":\"" + AppUtils.encodeHTML(lst.get(i).getStrValor2()) + "\",");
						strJson1.append("\"ultcambio\":\"" + lst.get(i).getStrValor3() + "\",");
						strJson1.append("\"ultfecha\":\"" + lst.get(i).getStrValor4() + "\"},");
					}
				}
				else
					strJson1.append(",");
			}
			else
				strJson1.append("{\"resultado\" : \"empty\",\"oper\" : \"buscarmax\",\"mensaje\" : \"Hubo un error interno\"},");
			
		} catch (Exception e) {
			strJson1.append("{\"resultado\" : \"-1\",");
			strJson1.append("\"mensaje\" : \"" + e.getMessage().toString().replace("\"", "\\" + "\"") + "\"},");
		}
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}");
		out.print(strJson2);
	}
	
}
