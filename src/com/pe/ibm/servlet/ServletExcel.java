package com.pe.ibm.servlet;


import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

import com.pe.ibm.bean.BeanScheduleActividad;
import com.pe.ibm.business.BusinessScheduleActividad;

/**
 * Servlet implementation class ServletExcel
 */
@WebServlet("/ServletExcel")
public class ServletExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletExcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		
		String idSchedule = request.getParameter("strId");
		
    	HttpSession objIdSchedule = request.getSession(true);
    	
    	if(idSchedule != null) {
    		
    		objIdSchedule.setAttribute("idSchedule", idSchedule);
    		
    	}else if(objIdSchedule.getAttribute("idSchedule") != null) {
    		idSchedule = (String) objIdSchedule.getAttribute("idSchedule");
      		
    		objIdSchedule.removeAttribute("idSchedule");
    		
    		
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", 
			    "attachment; filename=ReporteSchedule.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet();
        workbook.setSheetName(0, "Hoja excel");

        List<String> headers = new ArrayList<String>();
        
        headers.add("N�");
        headers.add("HORA EJEC.");
        headers.add("PERIODO");
        headers.add("PROCEDIMIENTO");
        headers.add("CLIENTE");
        headers.add("SERVIDOR");
        headers.add("ACTIVIDAD");
        headers.add("HORA TERMINO");
        headers.add("DURACI�N");
        headers.add("HORA LIMITE");
        headers.add("PLATAFORMA");
        headers.add("T. RESPALDO");
        headers.add("TWS");
        headers.add("INICIO");
        headers.add("FIN");
        headers.add("OBSERVACIONES");


        CellStyle headerStyle = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBoldweight(Font.BOLDWEIGHT_BOLD);
        headerStyle.setFont(font);
        

        HSSFRow headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.size(); ++i) {
            String header = headers.get(i);
            HSSFCell cell = headerRow.createCell(i);
            cell.setCellStyle(headerStyle);
            cell.setCellValue(header);
        }
        
        
      //Instancear metodos 
		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
		BeanScheduleActividad bean = new BeanScheduleActividad();
		bean.setIdSchedule(Integer.parseInt(idSchedule));
		bean.setIdusermod(0);
		
		List<BeanScheduleActividad> listaScheduleActividad = servicio.listar(bean, ssf);
		int numeracion = 0;
		for (BeanScheduleActividad beanActividad2 : listaScheduleActividad) {
			numeracion ++;
			
			HSSFRow dataRow = sheet.createRow(numeracion);

            dataRow.createCell(0).setCellValue(String.valueOf(numeracion));
            dataRow.createCell(1).setCellValue(String.valueOf(beanActividad2.getHoraEjecucion()));
            dataRow.createCell(2).setCellValue(beanActividad2.getDescripcionPeriodo());	
            dataRow.createCell(3).setCellValue(beanActividad2.getDescripcionProcedimiento());	
            dataRow.createCell(4).setCellValue(beanActividad2.getDescripcionCliente());	
            dataRow.createCell(5).setCellValue(beanActividad2.getDescripcionServidor());	
            dataRow.createCell(6).setCellValue(beanActividad2.getDescripcion());	
            dataRow.createCell(7).setCellValue(String.valueOf(beanActividad2.getHoraTermino()));	
            dataRow.createCell(8).setCellValue(String.valueOf(beanActividad2.getDuracion()));	
            dataRow.createCell(9).setCellValue(String.valueOf(beanActividad2.getVentanaMax()));	
            dataRow.createCell(10).setCellValue(beanActividad2.getDescripcionPlataforma());	
            dataRow.createCell(11).setCellValue(beanActividad2.getDescripcionTipoRespaldo());	
            
            	if(beanActividad2.getTws() == 1) {
            		dataRow.createCell(12).setCellValue("Si");	
            	}else {
            		dataRow.createCell(12).setCellValue("No");	
            	}
            				
				if(String.valueOf(beanActividad2.getHoraInicio()).equals("null")) {
					dataRow.createCell(13).setCellValue("");
				}else {
					dataRow.createCell(13).setCellValue(String.valueOf(beanActividad2.getHoraInicio()));
				}
				
				if(String.valueOf(beanActividad2.getHoraFin()).equals("null")) {
					dataRow.createCell(14).setCellValue("");
				}else {
					dataRow.createCell(14).setCellValue(String.valueOf(beanActividad2.getHoraFin()));
				}
				
				if(String.valueOf(beanActividad2.getComentariosched()).equals("null")) {
					dataRow.createCell(15).setCellValue("");
				}else {
					dataRow.createCell(15).setCellValue(String.valueOf(beanActividad2.getComentariosched()));
				}
		}


        

     // Write the output
        OutputStream out = response.getOutputStream();
        workbook.write(out);
        out.close();
		
    	}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
