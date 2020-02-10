package com.pe.ibm.bean;

public class BeanTablero {

	
	     int idTribu;
	     String Tribu;
	     
	     int idSquad;
	     String Squad;
	     
	     String idCliente;
	     String Cliente;
	     
	     String idGrupoOwner;
	     String GrupoOwner;
	     
	     String idOwner;
	     String Owner;
	     
	     String TipoTicket;
	     String Status;
	    
	     int Queued;
	     int Planned;
	     int InProgress;
	     int Pending;
	     int SlaHold;
	     int Done;
	     int Resolved;
	     int Backlog;
	     int Rcacomp;
	     String Team;
	     
	     
	     int SquadInterGroup;
	     int SquadMulti1;
	     int SquadMulti2;
	     int SquadCommercial;
	     int IBM;
	     int Total;
	     
	     String fechainicio;
	     String fechafin;
	     String Site;
	     
	     
		public int getIdTribu() {
			return idTribu;
		}
		public void setIdTribu(int idTribu) {
			this.idTribu = idTribu;
		}
		public String getTribu() {
			return Tribu;
		}
		public void setTribu(String tribu) {
			Tribu = tribu;
		}
		public int getIdSquad() {
			return idSquad;
		}
		public void setIdSquad(int idSquad) {
			this.idSquad = idSquad;
		}
		public String getSquad() {
			return Squad;
		}
		public void setSquad(String squad) {
			Squad = squad;
		}
		public String getIdCliente() {
			return idCliente;
		}
		public void setIdCliente(String idCliente) {
			this.idCliente = idCliente;
		}
		public String getCliente() {
			return Cliente;
		}
		public void setCliente(String cliente) {
			Cliente = cliente;
		}
		public String getIdGrupoOwner() {
			return idGrupoOwner;
		}
		public void setIdGrupoOwner(String idGrupoOwner) {
			this.idGrupoOwner = idGrupoOwner;
		}
		public String getGrupoOwner() {
			return GrupoOwner;
		}
		public void setGrupoOwner(String grupoOwner) {
			GrupoOwner = grupoOwner;
		}
		public String getIdOwner() {
			return idOwner;
		}
		public void setIdOwner(String idOwner) {
			this.idOwner = idOwner;
		}
		public String getOwner() {
			return Owner;
		}
		public void setOwner(String owner) {
			Owner = owner;
		}
		public String getTipoTicket() {
			return TipoTicket;
		}
		public void setTipoTicket(String tipoTicket) {
			TipoTicket = tipoTicket;
		}
		public String getStatus() {
			return Status;
		}
		public void setStatus(String status) {
			Status = status;
		}
		public int getQueued() {
			return Queued;
		}
		public void setQueued(int queued) {
			Queued = queued;
		}
		public int getPlanned() {
			return Planned;
		}
		public void setPlanned(int planned) {
			Planned = planned;
		}
		public int getInProgress() {
			return InProgress;
		}
		public void setInProgress(int inProgress) {
			InProgress = inProgress;
		}
		public int getPending() {
			return Pending;
		}
		public void setPending(int pending) {
			Pending = pending;
		}
		public int getSlaHold() {
			return SlaHold;
		}
		public void setSlaHold(int slaHold) {
			SlaHold = slaHold;
		}
		public int getDone() {
			return Done;
		}
		public void setDone(int done) {
			Done = done;
		}
		public int getResolved() {
			return Resolved;
		}
		public void setResolved(int resolved) {
			Resolved = resolved;
		}
		public int getBacklog() {
			return Backlog;
		}
		public void setBacklog(int backlog) {
			Backlog = backlog;
		}
		public int getRcacomp() {
			return Rcacomp;
		}
		public void setRcacomp(int rcacomp) {
			Rcacomp = rcacomp;
		}
		public String getTeam() {
			return Team;
		}
		public void setTeam(String team) {
			Team = team;
		}
		public int getSquadInterGroup() {
			return SquadInterGroup;
		}
		public void setSquadInterGroup(int squadInterGroup) {
			SquadInterGroup = squadInterGroup;
		}
		public int getSquadMulti1() {
			return SquadMulti1;
		}
		public void setSquadMulti1(int squadMulti1) {
			SquadMulti1 = squadMulti1;
		}
		public int getSquadMulti2() {
			return SquadMulti2;
		}
		public void setSquadMulti2(int squadMulti2) {
			SquadMulti2 = squadMulti2;
		}
		public int getSquadCommercial() {
			return SquadCommercial;
		}
		public void setSquadCommercial(int squadCommercial) {
			SquadCommercial = squadCommercial;
		}
		public int getIBM() {
			return IBM;
		}
		public void setIBM(int iBM) {
			IBM = iBM;
		}
		public int getTotal() {
			return Total;
		}
		public void setTotal(int total) {
			Total = total;
		}
		public String getFechainicio() {
			return fechainicio;
		}
		public void setFechainicio(String fechainicio) {
			this.fechainicio = fechainicio;
		}
		public String getFechafin() {
			return fechafin;
		}
		public void setFechafin(String fechafin) {
			this.fechafin = fechafin;
		}
		public String getSite() {
			return Site;
		}
		public void setSite(String site) {
			Site = site;
		}
		
		
		@Override
		public String toString() {
			return "BeanTablero [idTribu=" + idTribu + ", Tribu=" + Tribu + ", idSquad=" + idSquad + ", Squad=" + Squad
					+ ", idCliente=" + idCliente + ", Cliente=" + Cliente + ", idGrupoOwner=" + idGrupoOwner
					+ ", GrupoOwner=" + GrupoOwner + ", idOwner=" + idOwner + ", Owner=" + Owner + ", TipoTicket="
					+ TipoTicket + ", Status=" + Status + ", Queued=" + Queued + ", Planned=" + Planned
					+ ", InProgress=" + InProgress + ", Pending=" + Pending + ", SlaHold=" + SlaHold + ", Done=" + Done
					+ ", Resolved=" + Resolved + ", Backlog=" + Backlog + ", Rcacomp=" + Rcacomp + ", Team=" + Team
					+ ", SquadInterGroup=" + SquadInterGroup + ", SquadMulti1=" + SquadMulti1 + ", SquadMulti2="
					+ SquadMulti2 + ", SquadCommercial=" + SquadCommercial + ", IBM=" + IBM + ", Total=" + Total
					+ ", fechainicio=" + fechainicio + ", fechafin=" + fechafin + ", Site=" + Site + "]";
		}
	     
	     
		
	     
		
	     
	
}
