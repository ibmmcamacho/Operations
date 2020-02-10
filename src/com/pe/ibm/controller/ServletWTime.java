package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessHorario;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.business.BusinessReg;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletWTime
 */
@WebServlet("/ServletWTime")
public class ServletWTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWTime() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String operacion = request.getParameter("operacion");
		BeanParameters objBeanParameters = new BeanParameters();
		int iTeam = Integer.parseInt(request.getParameter("iTeam"));
		objBeanParameters.setiTeam(iTeam);
		
		/* Obtener sqlsessionF*/
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		
		
//		HttpSession session = (HttpSession) request.getSession(true);
//		SqlSessionFactory ssf = (SqlSessionFactory) session.getAttribute("cnxDB");
//		if(ssf==null){
//			ssf = new MyBatisUtil().getSqlSessionFactory();
//			HttpSession objSessionCnxDB = request.getSession(true);
//			objSessionCnxDB.setAttribute("cnxDB", ssf);
//		}
		
		if(operacion.equals("hour")){
			listHours(request, response, objBeanParameters, ssf);
		}
		else if(operacion.equals("users")){
			listUsers(request, response, objBeanParameters, ssf);
		}
		else if(operacion.equals("validarHorario")){
			validarHorario(request, response, objBeanParameters, ssf);
		}
		else
			registro(request, response, ssf);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String[] getInfo(HttpServletRequest req){
		String[] info = new String[3];
		
		String  browserDetails  =   req.getHeader("User-Agent");
        String  userAgent       =   browserDetails;
        String  user            =   userAgent.toLowerCase();
        String	hostname		= 	req.getServerName().toString() + ":" + req.getServerPort();

        String os = "";
        String browser = "";
        
        //=================OS=======================
         if (userAgent.toLowerCase().indexOf("windows") >= 0 )
         {
             os = "Windows";
         } else if(userAgent.toLowerCase().indexOf("mac") >= 0)
         {
             os = "Mac";
         } else if(userAgent.toLowerCase().indexOf("x11") >= 0)
         {
             os = "Unix";
         } else if(userAgent.toLowerCase().indexOf("android") >= 0)
         {
             os = "Android";
         } else if(userAgent.toLowerCase().indexOf("iphone") >= 0)
         {
             os = "IPhone";
         }else{
             os = "UnKnown, More-Info: "+userAgent;
         }
         //===============Browser===========================
        if (user.contains("msie"))
        {
            String substring=userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
            browser=substring.split(" ")[0].replace("MSIE", "IE")+"-"+substring.split(" ")[1];
        } else if (user.contains("safari") && user.contains("version"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
        } else if ( user.contains("opr") || user.contains("opera"))
        {
            if(user.contains("opera"))
                browser=(userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
            else if(user.contains("opr"))
                browser=((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-")).replace("OPR", "Opera");
        } else if (user.contains("chrome"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)  || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1) )
        {
            //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
            browser = "Netscape-?";

        } else if (user.contains("firefox"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
        } else if(user.contains("rv"))
        {
            browser="IE-" + user.substring(user.indexOf("rv") + 3, user.indexOf(")"));
        } else
        {
            browser = "UnKnown, More-Info: "+userAgent;
        }
        
        info[0] = os;
        info[1] = browser;
        info[2] = hostname;
        
        return info;
	}
	
	private void validarHorario(HttpServletRequest req, HttpServletResponse res, BeanParameters pobjBeanParameters, SqlSessionFactory ssf) throws IOException
	{
		StringBuilder strJson1 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try
		{
		
		BusinessHorario objBusinessHorario = new BusinessHorario();
		pobjBeanParameters = objBusinessHorario.getValidateHorario(pobjBeanParameters,ssf);
		
			if(pobjBeanParameters.getiValor1() > 0)
			{
				strJson1.append("hide");
			}
			else
			{
				strJson1.append("show");
			}
		}
		catch(Exception e)
		{
			strJson1.append("show");
		}
		out.print(strJson1);
	}
	
	private void listHours(HttpServletRequest req, HttpServletResponse res, BeanParameters pobjBeanParameters,SqlSessionFactory ssf) throws IOException
	{
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("[");
		try
		{
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		
		String fechareg = dateFormat.format(date);
		
		List<BeanParameters> lstBeanParameters;
		BusinessReg objBusinessReg = new BusinessReg();
		pobjBeanParameters.setStrdate1(fechareg);
		
		lstBeanParameters = objBusinessReg.listHours(pobjBeanParameters,ssf);
		
			if(lstBeanParameters.size() > 0)
			{
				for(BeanParameters item : lstBeanParameters)
				{
//					System.out.println(item.getStrdate1() + "  ||   " + Integer.parseInt(item.getStrdate1().substring(0, 2)));
					strJson1.append("{\"hours\" : \"" + item.getStrdate1() + "\",");
					strJson1.append("\"hoursDisplay\" : \"" + ((Integer.parseInt(item.getStrdate1().substring(0, 2)) >= 0 && Integer.parseInt(item.getStrdate1().substring(0, 2)) <= 11) ? "" + item.getStrdate1() + " - (Mañana)" : 
															   (Integer.parseInt(item.getStrdate1().substring(0, 2)) >= 12 && Integer.parseInt(item.getStrdate1().substring(0, 2)) <= 18) ? "" + item.getStrdate1() +  " - (Tarde)":
															   (Integer.parseInt(item.getStrdate1().substring(0, 2)) >= 19 && Integer.parseInt(item.getStrdate1().substring(0, 2)) <= 23) ? "" + item.getStrdate1() + " - (Noche)" : "No definido") + "\"},");
				}
			}
			else
			{
				strJson1.append("{\"hours\" : \"null\"},");
			}
		}
		catch(Exception e)
		{
			strJson1.append("{\"hours\" : \"null\"},");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]");
		out.print(strJson2);
	}
	
	private void registro(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		
		StringBuilder strJson1 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			TimeZone.setDefault(TimeZone.getTimeZone("America/Lima")); //Solo para Bluemix
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String[] info = getInfo(req);
			
			String user = req.getParameter("username");
			String type = req.getParameter("operacion");
			String hours = req.getParameter("hour");
			int iTeam = Integer.parseInt(req.getParameter("iTeam"));
			String obs = req.getParameter("obs");
			String fechareg = dateFormat.format(date);
			int iValidacion = Integer.parseInt(req.getParameter("iHorario"));
			
			BusinessReg objBusinessReg = new BusinessReg();
			BeanParameters objParameters = new BeanParameters();
//			objParameters.setStrIdLogin(user.toUpperCase());
//			objParameters.setiTeam(iTeam);
			
//			objParameters = objBusinessReg.getHorarioEmpleado(objParameters, ssf);
//			if(type.equals("in") && objParameters == null)
//			{
//				strJson1.append("{" +	
//						"\"message\" : \"<label class='label label-danger'> No dispones de registro de horario, por favor contacta a vuestro TL</label>\"" +
//						"}");
//				out.print(strJson1);
//				return;
//			}
//			else if(objParameters == null)
//				objParameters = new BeanParameters();
			
			HttpSession objSession = req.getSession(false);
			BeanSession objBeanSession = new BeanSession();
			if(objSession.getAttribute("usuarioLogin") != null)
			{
				objBeanSession = (BeanSession) objSession.getAttribute("usuarioLogin");
				if (objBeanSession != null) {
					objParameters.setiIdEmpleado(objBeanSession.getObjBeanPersonal().getiIdEmpleado());
				} else
					objParameters.setiIdEmpleado(0);
			}
			else {
				objParameters.setiIdEmpleado(0);
			}
			
			objParameters.setStrType(type);
			objParameters.setStrIdLogin(user.toUpperCase());
			objParameters.setStrdate1(fechareg);
			//DESHABILITADO PARA QUE EL HORARIO SE ASIGNE DESDE EL HORARIO REALIZADO POR SUPERVISORES
//			objParameters.setStrdate2(hours);
			objParameters.setiTeam(iTeam);
			objParameters.setStrObs(AppUtils.cleanString(obs));
			objParameters.setiValor1(iValidacion);
			objParameters.setStrSo(info[0]);
			objParameters.setStrBrowser(info[1]);
			objParameters.setStrIp(req.getRemoteAddr());
			objParameters.setStrHostname(info[2]);
			
//			BeanSession objBeanSession = new BeanSession();
			
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrType("RESTRICCION_IP");
			objBeanParameters.setiTeam(iTeam);
			List<BeanOptions> listBeanOptions = new BusinessOptions().listOptions(objBeanParameters, ssf);
			if(listBeanOptions != null && listBeanOptions.size() > 0){
				if(listBeanOptions.get(0).getStrDescripcion().equals(req.getRemoteAddr()))
					objBeanSession = objBusinessReg.reg(objParameters, ssf);
				else{
//					HttpSession objSession = req.getSession(false);
					if (objSession.getAttribute("usuarioLogin") == null)
						objBeanSession = new BeanSession(new BeanEmpleado(),"restriccion",true);
					else
						objBeanSession = objBusinessReg.reg(objParameters, ssf);
				}
			}
			else{
				objBeanSession = objBusinessReg.reg(objParameters, ssf);
			}
			
			if(objBeanSession.isResultado())
			{
				if(objBeanSession.getStrMessage().equals("restriccion"))
					strJson1.append("{" +
							"\"message\" : \"<label class='label label-danger'>320 ¡Hola! lamentamos no registrar tu ingreso o salida, por favor registrarlo desde un equipo autorizado en el Team, gracias.</label>\"" +
							"}");
				else if(objBeanSession.getStrMessage().equals("ok"))
					strJson1.append("{" +
							"\"message\" : \"<label class='label'> <i class='fa fa-check-square-o text-success' aria-hidden='true'></i>324 ¡Hola! <strong>" + objBeanSession.getObjBeanPersonal().getStrNombre() + " " +  objBeanSession.getObjBeanPersonal().getStrApPaterno() + "</strong>, se ha registrado tu " + (type.equals("in") ? "<strong class='text-green'>ingreso</strong>, bienvenido." : "<strong class='text-red'>salida</strong>, hasta luego.") + "</label>\"" +
							"}");
				else if(objBeanSession.getStrMessage().equals("fail"))
				{
					if(type.equals("in"))
						strJson1.append("{" +
								"\"message\" : \"<label class='label label-danger'>330 ¡Hola! <strong>" + objBeanSession.getObjBeanPersonal().getStrNombre() + " " +  objBeanSession.getObjBeanPersonal().getStrApPaterno() + "</strong>, es posible que ya hallas marcado tu ingreso, por favor revisa la lista de conectados o vuelve a intentar en breve.</label>\"" +
								"}");
					else if(type.equals("out"))
						strJson1.append("{" +
								"\"message\" : \"<label class='label'> <i class='fa fa-check-square-o text-success' aria-hidden='true'></i>334 ¡Hola! No dispones de marcaciones pendientes.</label>\"" +
								"}");
				}
				else
					strJson1.append("{" +
							"\"message\" : \"<label class='label label-danger'>339 ¡Hola! es posible que el usuario no tenga un horario asignado o ya está conectado, revise el usuario y vuelva a intentalo por favor.</label>\"" +
							"}");
			}
			else
			{
				strJson1.append("{" +
						"\"message\" : \"<label class='label label-danger'>345 ¡Hola! es posible que el usuario no tenga un horario asignado o ya está conectado, por favor valida el usuario o comunica a vuestro supervisor para validar el usuario.</label>"
						+ "\"" +
						"}");
			}
		}
		catch(Exception e)
		{
			strJson1.append("{" +	
					"\"message\" : \"<label class='label label-danger'> Algo no va bien:,\n" + e.getCause().getMessage() + "</label>\"" +
					"}");
		}
		out.print(strJson1);
	}
	
	private void listUsers(HttpServletRequest req, HttpServletResponse res, BeanParameters pobjBeanParameters, SqlSessionFactory ssf) throws IOException{
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			strJson1.append("[");
			try
			{
			List<BeanParameters> lstBeanParameters;
			BusinessReg objBusinessReg = new BusinessReg();
			lstBeanParameters = objBusinessReg.listUsersConnect(pobjBeanParameters, ssf);
			
				if(lstBeanParameters.size() > 0)
				{
					for(BeanParameters item : lstBeanParameters)
					{
						strJson1.append("{\"idEmpleado\" : \"" + item.getiIdEmpleado() + "\",");
						strJson1.append("\"nombre\" : \"" + item.getStrNombre1() + "\",");
						strJson1.append("\"fechaEntrada\" : \"" + item.getStrdate1() + "\",");
						strJson1.append("\"horaEntrada\" : \"" + item.getStrdate2() + "\",");
						strJson1.append("\"serial\" : \"" + item.getStrIdLogin() + "\",");
						strJson1.append("\"area\" : \"" + item.getStrValor1() + "\"");
						strJson1.append("},");
					}
				}
				else
				{
					strJson1.append("{\"nombre\" : \"null\"},");
				}
			}
			catch(Exception e)
			{
				strJson1.append("{\"nombre\" : \"null\"},");
			}
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]");
			out.print(strJson2);
		}
	
}
