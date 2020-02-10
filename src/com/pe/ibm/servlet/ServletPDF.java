/* This Servlet Example Generates a PDF document from a HTML Page using iText Library */
package com.pe.ibm.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
// Document Object
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
//For adding content into PDF document
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;
import com.pe.ibm.bean.BeanScheduleActividad;
import com.pe.ibm.business.BusinessScheduleActividad;

@WebServlet(name = "ServletPDF", urlPatterns = ("/ServletPDF"))
public class ServletPDF extends HttpServlet {

	// MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
	// SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();

	private static final Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 20, Font.BOLD);
	private static final Font cabeceraTablaFont = FontFactory.getFont(FontFactory.HELVETICA, 6, Font.BOLD,
			BaseColor.WHITE);
	private static final Font contenidoTablaFont = FontFactory.getFont(FontFactory.HELVETICA, 7, Font.NORMAL);

	public String iTextExampleImage;
	public int contador = 0;
	PdfTemplate total;
	String idSchedule ="";

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");

		this.idSchedule = request.getParameter("strId");
		String fecha = request.getParameter("strFecha");
		String sede = request.getParameter("strSede");
		String turno = request.getParameter("strTurno");
		String horaInicio = request.getParameter("strHoraInicio");
		String horaFin = request.getParameter("strHoraFin");
		String tipoReporte = request.getParameter("strTipoReporte");

		HttpSession objIdSchedule = request.getSession(true);

		if (idSchedule != null) {

			objIdSchedule.setAttribute("idSchedule", idSchedule);
			objIdSchedule.setAttribute("fecha", fecha);
			objIdSchedule.setAttribute("sede", sede);
			objIdSchedule.setAttribute("turno", turno);
			objIdSchedule.setAttribute("hInicio", horaInicio);
			objIdSchedule.setAttribute("hFin", horaFin);
			objIdSchedule.setAttribute("tipoReporte", tipoReporte);

		} else if (objIdSchedule.getAttribute("idSchedule") != null) {
			idSchedule = (String) objIdSchedule.getAttribute("idSchedule");
			fecha = (String) objIdSchedule.getAttribute("fecha");
			sede = (String) objIdSchedule.getAttribute("sede");
			turno = (String) objIdSchedule.getAttribute("turno");
			horaInicio = (String) objIdSchedule.getAttribute("hInicio");
			horaFin = (String) objIdSchedule.getAttribute("hFin");
			tipoReporte = (String) objIdSchedule.getAttribute("tipoReporte");

			SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat formatoDelTextoNuevo = new SimpleDateFormat("dd MMMMM yyyy", new Locale("ES"));
			Date nuevafecha = null;
			try {
				nuevafecha = formatoDelTexto.parse(fecha);
				fecha = "LIMA, " + formatoDelTextoNuevo.format(nuevafecha);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			objIdSchedule.removeAttribute("idSchedule");

			try {

				// Instancear metodos
				BusinessScheduleActividad servicio = new BusinessScheduleActividad();
				BeanScheduleActividad bean = new BeanScheduleActividad();
				bean.setIdSchedule(Integer.parseInt(idSchedule));
				bean.setIdusermod(0);

				List<BeanScheduleActividad> listaScheduleActividad = servicio.listar(bean, ssf);

				this.iTextExampleImage = getServletContext().getRealPath("/") + "/resources/image/logo-IBM.png";
				
				// Tama�o de hoja y orientaci�n
				Document document = new Document(PageSize.A4.rotate(), 35, 35, 80, 60);

				ByteArrayOutputStream baos = new ByteArrayOutputStream();

				PdfWriter writer = PdfWriter.getInstance(document, baos);
				MyFooter event = new MyFooter();
				writer.setPageEvent(event);

				document.open();
				// A�adimos los metadatos del PDF
				document.addTitle("SCHEDULE OPERACIONES");
				document.addSubject("SCHEDULE OPERACIONES");
				document.addKeywords("SCHEDULE OPERACIONES");
				document.addAuthor("USUARIO");
				document.addCreator("USUARIO");

				// Primera p�gina
				Chunk chunk = new Chunk("REPORTE DE SCHEDULE", chapterFont);
				Paragraph titulo = new Paragraph(chunk);
				titulo.add(new Phrase(Chunk.NEWLINE));
				titulo.add(new Phrase(Chunk.NEWLINE));
				titulo.setAlignment(Element.ALIGN_CENTER);

				Chapter chapter = new Chapter(titulo, 1);
				chapter.setNumberDepth(0);

				// Este codigo genera una tabla de 4 columnas
				PdfPTable tableEncabezado = new PdfPTable(4);
				tableEncabezado.getDefaultCell().setBorder(Rectangle.NO_BORDER);
				tableEncabezado.getDefaultCell().setFixedHeight(20f);
				tableEncabezado.setWidthPercentage(300);

				// Si desea crear una celda de mas de una columna
				// Cree un objecto Cell y cambie su propiedad span

				PdfPCell celdaInicial = new PdfPCell(new Phrase(fecha));

				// Indicamos cuantas columnas ocupa la celda
				celdaInicial.setColspan(4);
				celdaInicial.setFixedHeight(20f);
				celdaInicial.setBorder(Rectangle.NO_BORDER);

				// addCell() agrega una celda a la tabla, el cambio de fila
				// ocurre automaticamente al llenar la fila
				tableEncabezado.addCell(celdaInicial);

				tableEncabezado.addCell("SEDE:");
				tableEncabezado.addCell(sede);
				tableEncabezado.addCell("TURNO:");
				tableEncabezado.addCell(turno);

				tableEncabezado.addCell("HORA DE INICIO:");
				tableEncabezado.addCell(horaInicio);
				tableEncabezado.addCell("HORA DE FIN:");
				tableEncabezado.addCell(horaFin);

				PdfPTable tableEncabezado2 = new PdfPTable(1);

				tableEncabezado2.addCell(tableEncabezado);
				Paragraph cuadro = new Paragraph();
				cuadro.add(tableEncabezado2);

				chapter.add(cuadro);

				Paragraph parrafo = new Paragraph(
						"Por lo siguiente Favor extender documento a la orden de IBM DEL PER�");
				parrafo.add("\n\n");
				parrafo.setAlignment(Element.ALIGN_CENTER);
				chapter.add(parrafo);

				Paragraph cuerpo = new Paragraph();

				Integer numColumns = 0;

				if (tipoReporte.equals("PARCIAL")) {
					numColumns = 13;
				} else {
					numColumns = 16;
				}

				// Creamos la tabla
				PdfPTable table = new PdfPTable(numColumns);
				table.setWidthPercentage(100);
				if (tipoReporte.equals("PARCIAL")) {
					table.setWidths(new float[] { 2, 4, 5, 8, 8, 7, 20, 4, 4, 4, 6, 4, 3 });
				} else {
					table.setWidths(new float[] { 2, 4, 5, 8, 8, 7, 15, 4, 4, 4, 6, 4, 3, 3, 3, 5 });
				}

				table.setHeaderRows(1);

				// Ahora llenamos la tabla del PDF

				// Fila de cabecera
				PdfPCell columnHeader1;
				columnHeader1 = new PdfPCell(new Phrase("N�", cabeceraTablaFont));
				columnHeader1.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader1.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader1);

				PdfPCell columnHeader2;
				columnHeader2 = new PdfPCell(new Phrase("HORA EJEC.", cabeceraTablaFont));
				columnHeader2.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader2.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader2);

				PdfPCell columnHeader3;
				columnHeader3 = new PdfPCell(new Phrase("PERIODO", cabeceraTablaFont));
				columnHeader3.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader3.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader3);

				PdfPCell columnHeader4;
				columnHeader4 = new PdfPCell(new Phrase("PROCEDIMIENTO", cabeceraTablaFont));
				columnHeader4.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader4.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader4);

				PdfPCell columnHeader5;
				columnHeader5 = new PdfPCell(new Phrase("CLIENTE", cabeceraTablaFont));
				columnHeader5.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader5.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader5);

				PdfPCell columnHeader6;
				columnHeader6 = new PdfPCell(new Phrase("SERVIDOR", cabeceraTablaFont));
				columnHeader6.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader6.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader6);

				PdfPCell columnHeader7;
				columnHeader7 = new PdfPCell(new Phrase("ACTIVIDAD", cabeceraTablaFont));
				columnHeader7.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader7.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader7);

				PdfPCell columnHeader8;
				columnHeader8 = new PdfPCell(new Phrase("HORA TERMINO", cabeceraTablaFont));
				columnHeader8.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader8.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader8);

				PdfPCell columnHeader9;
				columnHeader9 = new PdfPCell(new Phrase("DURACI�N", cabeceraTablaFont));
				columnHeader9.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader9.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader9);

				PdfPCell columnHeader10;
				columnHeader10 = new PdfPCell(new Phrase("HORA LIMITE", cabeceraTablaFont));
				columnHeader10.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader10.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader10);

				PdfPCell columnHeader11;
				columnHeader11 = new PdfPCell(new Phrase("PLATAFORMA", cabeceraTablaFont));
				columnHeader11.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader11.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader11);

				PdfPCell columnHeader12;
				columnHeader12 = new PdfPCell(new Phrase("T. RESPALDO", cabeceraTablaFont));
				columnHeader12.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader12.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader12);

				PdfPCell columnHeader13;
				columnHeader13 = new PdfPCell(new Phrase("TWS", cabeceraTablaFont));
				columnHeader13.setHorizontalAlignment(Element.ALIGN_CENTER);
				columnHeader13.setBackgroundColor(BaseColor.BLACK);
				table.addCell(columnHeader13);

				if (tipoReporte.equals("COMPLETO")) {
					PdfPCell columnHeader14;
					columnHeader14 = new PdfPCell(new Phrase("INICIO", cabeceraTablaFont));
					columnHeader14.setHorizontalAlignment(Element.ALIGN_CENTER);
					columnHeader14.setBackgroundColor(BaseColor.BLACK);
					table.addCell(columnHeader14);

					PdfPCell columnHeader15;
					columnHeader15 = new PdfPCell(new Phrase("FIN", cabeceraTablaFont));
					columnHeader15.setHorizontalAlignment(Element.ALIGN_CENTER);
					columnHeader15.setBackgroundColor(BaseColor.BLACK);
					table.addCell(columnHeader15);

					PdfPCell columnHeader16;
					columnHeader16 = new PdfPCell(new Phrase("OBSERVACIONES", cabeceraTablaFont));
					columnHeader16.setHorizontalAlignment(Element.ALIGN_CENTER);
					columnHeader16.setBackgroundColor(BaseColor.BLACK);
					table.addCell(columnHeader16);
				}

				int numeracion = 0;

				// rellenamos las filas de la tabla
				if (listaScheduleActividad.size() > 0) {
					for (BeanScheduleActividad beanActividad2 : listaScheduleActividad) {
						numeracion++;

						table.addCell(new Phrase(String.valueOf(numeracion), contenidoTablaFont));
						table.addCell(
								new Phrase(String.valueOf(beanActividad2.getHoraEjecucion()), contenidoTablaFont));
						table.addCell(new Phrase(beanActividad2.getDescripcionPeriodo(), contenidoTablaFont));
						table.addCell(new Phrase(beanActividad2.getDescripcionProcedimiento(), contenidoTablaFont));
						table.addCell(new Phrase(beanActividad2.getDescripcionCliente(), contenidoTablaFont));
						table.addCell(new Phrase(beanActividad2.getDescripcionServidor(), contenidoTablaFont));
						table.addCell(new Phrase(beanActividad2.getDescripcion(), contenidoTablaFont));
						table.addCell(new Phrase(String.valueOf(beanActividad2.getHoraTermino()), contenidoTablaFont));
						table.addCell(new Phrase(String.valueOf(beanActividad2.getDuracion()), contenidoTablaFont));
						table.addCell(new Phrase(String.valueOf(beanActividad2.getVentanaMax()), contenidoTablaFont));
						table.addCell(new Phrase(beanActividad2.getDescripcionPlataforma(), contenidoTablaFont));
						table.addCell(new Phrase(beanActividad2.getDescripcionTipoRespaldo(), contenidoTablaFont));

						if (beanActividad2.getTws() == 1) {
							table.addCell(new Phrase("Si", contenidoTablaFont));
						} else {
							table.addCell(new Phrase("No", contenidoTablaFont));
						}

						if (tipoReporte.equals("COMPLETO")) {

							if (String.valueOf(beanActividad2.getHoraInicio()).equals("null")) {
								table.addCell(new Phrase(" ", contenidoTablaFont));
							} else {
								table.addCell(
										new Phrase(String.valueOf(beanActividad2.getHoraInicio()), contenidoTablaFont));
							}

							if (String.valueOf(beanActividad2.getHoraFin()).equals("null")) {
								table.addCell(new Phrase(" ", contenidoTablaFont));
							} else {
								table.addCell(
										new Phrase(String.valueOf(beanActividad2.getHoraFin()), contenidoTablaFont));
							}

							if (String.valueOf(beanActividad2.getComentariosched()).equals("null")) {
								table.addCell(new Phrase(" ", contenidoTablaFont));
							} else {
								table.addCell(new Phrase(String.valueOf(beanActividad2.getComentariosched()),
										contenidoTablaFont));
							}

						}

					}

				}

				// A�adimos a la tabla
				cuerpo.add(table);

				chapter.add(cuerpo);

				// A�adimos el elemento con la tabla
				document.add(chapter);
				// Cerramos el documento
				document.close();

				response.setHeader("Expires", "0");
				response.setHeader("Cache-Control",
						"must-revalidate, post-check=0, pre-check=0, filename=ReporteSchedule.pdf");
				response.setHeader("Pragma", "public");
				// setting the content type
				response.setContentType("application/pdf");
				// the contentlength
				response.setContentLength(baos.size());
				// write ByteArrayOutputStream to the ServletOutputStream
				OutputStream os = response.getOutputStream();

				baos.writeTo(os);
				os.flush();
				os.close();

			} catch (DocumentException e) {
				throw new IOException(e.getMessage());
			}

		}

	}

	class MyFooter extends PdfPageEventHelper {

		Font ffont = new Font(Font.FontFamily.UNDEFINED, 12, Font.BOLD);

		public void onEndPage(PdfWriter writer, Document document) {

			PdfContentByte cb = writer.getDirectContent();
			Paragraph header = new Paragraph("SCHEDULE", ffont);
			Paragraph header2 = new Paragraph("N° "+idSchedule+"", ffont);

			// We add an image (Añadimos una imagen)
			Image image;
			try {
				image = Image.getInstance(iTextExampleImage);
				image.setAbsolutePosition(2, 520);
				document.add(image);

			} catch (BadElementException ex) {
				System.out.println("Image BadElementException" + ex);
			} catch (IOException ex) {
				System.out.println("Image IOException " + ex);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, header, document.right(), document.top() + 60, 0);
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, header2, document.right(), document.top() + 30, 0);

			Phrase footer1 = new Phrase("© Copyright 2015, Schedule de Operaciones GTS - IBM DEL PERU");
			Phrase footer2 = new Phrase("Av. Javier Prado Este 6230, Lima, Perú");
			Phrase footer3 = new Phrase("Página - " + writer.getCurrentPageNumber()+" -");

			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, footer1,
					(document.right() - document.left()) / 2 + document.leftMargin(), document.bottom() - 10, 0);
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, footer2,
					(document.right() - document.left()) / 2 + document.leftMargin(), document.bottom() - 25, 0);
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, footer3,
					(document.right() - document.left()) / 2 + document.leftMargin(), document.bottom() - 40, 0);

		}
	}
}