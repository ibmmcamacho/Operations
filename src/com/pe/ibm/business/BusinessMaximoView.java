package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.WorkOrder;
import com.pe.ibm.dao.DaoMaximoViewImpl;
import com.pe.ibm.dao.DaoRegImpl;
import com.pe.ibm.interfac.DaoMaximoView;
import com.pe.ibm.interfac.DaoReg;


public class BusinessMaximoView {

	/*R E T U R N S*/
	//TODO: Validate if COMPLIANCE_OLA_PERU_RESOLVE IS NOT NULL	BG001
	//Requires: ticketIdCliente,ticketIdGrupoPropietario CASE -> ticketEmailPropietario
	public BeanMaximo ticketsCount(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
		SqlSession sqlSession = ssf.openSession();
		
		DaoMaximoView dao = new DaoMaximoViewImpl();
		BeanMaximo beanResult = new BeanMaximo();
		try {
			beanResult = dao.ticketsCount(beanMaximo, sqlSession);
		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
		
		//Returns strValor1, strValor2, strValor3
		//(Acumulados, Prioridad 1 y 2, No Asignados)
		// AS (TICKETS_ACU, TICKETS_PRI, TICKETS_NAS)
		return beanResult;
	}	
	
	//Requires: ticketIdCliente,ticketIdGrupoPropietario
	//Returns IN -Mayus-
		public List<BeanMaximo> ownersTicketsView(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.ownersTicketsView(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			//Returns ticketEmailPropietario, ticketPropietario
			// AS (OWNER_ID, OWNER)
			return list;
		}
		
		
		
	
			
//			S	E	L	E	C	T	-	O	P	T	I	O	N	S
			
		
		public List<BeanMaximo>  selectSquad(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.selectSquad(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			//Returns: ticketIdCliente, //Requires: ticketCliente
			return list;
		}
		
		
		
		
		public List<BeanMaximo> selectClient(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.selectClient(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			//Returns: ticketIdCliente, //Requires: ticketCliente
			return list;
		}
		
		//Requires: ticketIdCliente
		public List<BeanMaximo> selectGroupOwner(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.selectGroupOwner(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
//			Returns: ticketIdGrupoPropietario, ticketGrupoPropietario
			return list;
		}

		//Requires: ticketIdCliente,ticketIdGrupoPropietario
		public List<BeanMaximo> selectOwner(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.selectOwner(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
//			Returns: ticketEmailPropietario, ticketPropietario
			return list;
		}
		
		//FROM SMARTDESK
		//Requires: ticketCliente = 'Rimac'
		public List<BeanMaximo> clientTicketsSLA(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.clientTicketsSLA(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			//Returns strValor1, strValor2 AS (TITULO, VALOR_NUMERICO)
			return list;
		}
		
		//FROM OPERATIONS
		//Requires: strValor1 as IDTEAM   --Must match with ownersTicketsView
		public List<BeanMaximo> ownersTicketsAssistance(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.ownersTicketsAssistance(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			//Returns strValor1, strValor2, strValor3, strValor4, ticketEmailPropietario
			// AS (IDEMPLEADO, NOMBRE, AP_PATERNO, IDTEAM, EMAIL)
			return list;
		}
		
		//Requires: Both SqlSession-> OPERATIONS(ssf) && MAXIMO(ssfM)
		//Requires: ticketIdCliente,ticketIdGrupoPropietario, strValor1 as IDTEAM
		public List<BeanMaximo> matchActiveUsers(BeanMaximo beanMaximo, SqlSessionFactory ssf,
				SqlSessionFactory ssfM){
			
			List<BeanMaximo> resultList = new ArrayList<BeanMaximo>();
			try {
				//Returns strValor1, strValor2, strValor3, strValor4, ticketEmailPropietario
				List<BeanMaximo> listAssistance = this.ownersTicketsAssistance(beanMaximo, ssf);
				//Returns ticketEmailPropietario, ticketPropietario
				List<BeanMaximo> listView = this.ownersTicketsView(beanMaximo, ssfM); //Mayus
				for(BeanMaximo beanAssistance : listAssistance) {//lista todos los usuarios activos
					String emailAssistance = beanAssistance.getTicketEmailPropietario().toLowerCase();
					for(BeanMaximo beanView : listView) {//lista todos los propietarios
						String emailView = beanView.getTicketEmailPropietario().toLowerCase();
						
						if (emailAssistance.equals(emailView)){
							
							BeanMaximo bean = new BeanMaximo();
							bean.setStrValor1(beanAssistance.getStrValor1());
							bean.setStrValor2(beanAssistance.getStrValor2());
							bean.setStrValor3(beanAssistance.getStrValor3());
							bean.setStrValor4(beanAssistance.getStrValor4());
							bean.setTicketEmailPropietario(emailAssistance);
							bean.setTicketPropietario(beanView.getTicketPropietario());							
							resultList.add(bean);
						}
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
			}
			return resultList;
		}
		
		
		
		
		public List<BeanMaximo> nomatchActiveUsers(BeanMaximo beanMaximo, SqlSessionFactory ssf,
				SqlSessionFactory ssfM){
			
			List<BeanMaximo> resultList = new ArrayList<BeanMaximo>();
			try {
				//Returns ticketEmailPropietario, ticketPropietario
				List<BeanMaximo> listView = this.ownersTicketsView(beanMaximo, ssfM); //Mayus
				//Returns strValor1, strValor2, strValor3, strValor4, ticketEmailPropietario
				List<BeanMaximo> listMatch = this.matchActiveUsers(beanMaximo, ssf,ssfM);
				
				for(BeanMaximo beanView : listView) {//lista todos los propietarios
					String emailView = beanView.getTicketEmailPropietario().toLowerCase();
					
					for(BeanMaximo beanMatch : listMatch) {//lista todos los usuarios activos
						String emailMatch = beanMatch.getTicketEmailPropietario().toLowerCase();							
						if (emailView.equals(emailMatch)){								
							break;							
						}else {							
							if(listMatch.toString().contains(emailView)){
								break;								
							}else {								
								BeanMaximo bean = new BeanMaximo();
								bean.setTicketEmailPropietario(emailView);
								bean.setTicketPropietario(beanView.getTicketPropietario());							
								resultList.add(bean);	
								break;
							}
						}						
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
			}
			return resultList;
		}
		
		
		public List<BeanParameters> listEyS(BeanParameters beanParameters, SqlSessionFactory ssf)
		{
			SqlSession sqlSession = ssf.openSession();			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanParameters> list = new ArrayList<BeanParameters>();
			
			try {
					list = dao.listEyS(beanParameters, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			
			return list;
		}	
		
		
		public List<BeanMaximo> modalticketacum(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.modalticketacum(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		public List<BeanMaximo> modalticketsinasig(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.modalticketsinasig(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		public List<BeanMaximo> modalticketprioridad(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.modalticketprioridad(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		public List<BeanMaximo> ModalVigentesB(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.modalVigentesDao(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		
		
		
		
		public List<BeanMaximo> ModalVencidosB(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.modalVencidosDao(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		public List<BeanMaximo> Tabla1(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.Tabla1(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		public List<BeanMaximo> Tabla2(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.Tabla2(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		public List<BeanMaximo> Tabla3(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.Tabla3(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		
		public List<BeanMaximo> UserGrade(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.UserGrade(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}
		
		
		public List<BeanMaximo> OwnerGrade(BeanMaximo beanMaximo, SqlSessionFactory ssf,SqlSessionFactory ssfM){
			
			List<BeanMaximo> resultList = new ArrayList<BeanMaximo>();
			try {
				
				List<BeanMaximo> listOwners = this.selectOwner(beanMaximo, ssfM);				
				List<BeanMaximo> listGradesOwners = this.UserGrade(beanMaximo, ssf);				
				for(BeanMaximo beanOwners : listOwners) {					
					String emailowner = beanOwners.getTicketEmailPropietario().toLowerCase();
					
					
					for(BeanMaximo beanGrade : listGradesOwners) {						
						String emailView = beanGrade.getStrValor2().toLowerCase();
						
						if (emailowner.equals(emailView)){							
							BeanMaximo bean = new BeanMaximo();
							bean.setTicketEmailPropietario(beanOwners.getTicketEmailPropietario());
							bean.setTicketPropietario(beanOwners.getTicketPropietario());
							bean.setStrValor1(beanOwners.getStrValor1());
							bean.setStrValor2(beanOwners.getStrValor2());
							bean.setStrValor3(beanOwners.getStrValor3());
							bean.setStrValor4(beanOwners.getStrValor4());
							bean.setStrValor5(beanOwners.getStrValor5());
							bean.setStrValor6(beanOwners.getStrValor6());							
							bean.setStrValor7(beanGrade.getStrValor3());//Email 
													
							resultList.add(bean);
						}
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
			}
			return resultList;
		}
		
		
		public List<BeanMaximo> ListarGrupoWO(BeanMaximo beanMaximo, SqlSessionFactory ssf) {
			SqlSession sqlSession = ssf.openSession();
			
			DaoMaximoView dao = new DaoMaximoViewImpl();
			List<BeanMaximo> list = new ArrayList<BeanMaximo>();
			try {
				list = dao.ListarGrupoWO(beanMaximo, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
			return list;
		}

}
