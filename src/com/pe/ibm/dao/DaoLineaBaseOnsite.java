package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.LineaBaseOnsiteDistribucion;

public interface DaoLineaBaseOnsite {
	

	public List<LineaBaseOnsiteDistribucion> obtenerDistribucionLineaBaseOnsite(String idsla,String mes, String anio, SqlSession session);
	

}
