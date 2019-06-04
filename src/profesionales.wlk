
class Universidad{
	var property provincia  
	var property honorariosRecomendados	
		
	
}

class ProfesionalVinculado {
	var property universidad
	
	
	method provinciasDondePuedeTrabajar() { return [universidad.provincia()] }
	method honorariosPorHora() { return universidad.honorariosRecomendados() }
}

class ProfesionalAsociado {
	var property universidad
	

	method provinciasDondePuedeTrabajar() {return ["Entre Ríos", "Corrientes", "Santa Fe"]}
	method honorariosPorHora() {return 3000}
}


class ProfesionalLibre {
	var property universidad
	var property provinciasDondePuedeTrabajar
	var property honorariosPorHora
	
	
}

class Empresa{
	var property profesionales = []
	var property honorarioReferencia 
	
	
	method profesionalesDeUniversidad(universidad){ return profesionales.count({p => p.universidad()== universidad}) }
	method profesionalesCaros(){ return  profesionales.filter({p => p.honarariosPorHora() > honorarioReferencia})   }
	method dondeEstudiaron(){ return profesionales.map{p => p.universidad()}.asSet()}
	method profesionalMasBarato(){ return profesionales.min{p => p.honorariosPorHora()}}
	method esDeGenteAcotada(){ return not profesionales.any {p => p.honorariosPorHora().size() < 3} }
	method puedeSatisfacer(){return profesionales.any {p => solicitante.puedeSerAtentida(p)}}
	method darServicio(solicitante){if(not self.puedeSatisfacer(solicitante)){
									self.error("No tengo a nadie para vos")}}

}

	
