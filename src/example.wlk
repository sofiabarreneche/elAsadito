class Persona{
	var property objetosCercanos = []
	var tipoPersona
	var comio = []
	var dietaQueHace = [] 
	var posicion
	method laEstaPasandoBien() = self.comiAlgo() and self.criterio()
	
	method criterio(){
		return true
	}
	method comiAlgo() = comio.size() > 0
	method pedirObjeto(objeto, persona){
		if(persona.objetosCercanos().contains(objeto)){
			persona.pasarObjeto(objeto)
		}
	}
	method estaPipon()=	self.algunaComidaEsPesada()
	method algunaComidaEsPesada() = comio.any({unaComida => unaComida.calorias()>500})	
		
	
	method pasarObjeto(objeto, persona){
		if(persona.objetosCercanos().contains(objeto)){
			tipoPersona.pasar(objeto,persona)
		}else self.error("no puede pasar este objeto, ya que no lo tiene cerca")
	}
		
}
object osky inherits Persona{
//no pongo nada ya que en persona ya esta el mismo metodo
}
object moni inherits Persona{
	var posDeseada = "1@1"
	override method criterio(){
		return posicion == posDeseada
	}
}
object facu inherits Persona{
	override method criterio(){
		return comio.any({unaComida => unaComida.carne()})
	}
}
object vero inherits Persona{
	override method criterio() {
		return objetosCercanos < 3
	}
	 
}

object sordo inherits Persona{
	 method pasar(objeto,persona){
		
		const objetoPasado = objetosCercanos.anyOne()
		persona.objetosCercanos().add(objetoPasado)
		objetosCercanos.remove(objetoPasado)
	}
}
object pacificos inherits Persona{		//como no dice nombre, yo le puse pacificos pq no quieren que los molesten
	 method pasar(objeto,persona){
	
		objetosCercanos.all({unObjeto => persona.objetosCercanos().add(unObjeto) and 
										objetosCercanos.remove(unObjeto)})
	}
}
object hartos inherits Persona{
	 method pasar(objeto,persona){
	
		const lista = [objetosCercanos.all()]	
		objetosCercanos.all({unObjeto => objetosCercanos.remove(unObjeto)})
		objetosCercanos.add().all(persona.objetosCernanos())
		persona.abjetosCercanos().remove().all()
		persona.objetosCercanos().add().all(lista)
	}
}
object buenaGente inherits Persona{
	 method  pasar(objeto,persona){
		persona.objetosCercanos().add(objeto)
		objetosCercanos.remove(objeto)
	}
}

object pechitoDeCerdo{
	var property calorias = 270
	var property carne = true
}
object vegetariano{
	method criterioAlimentacion(comida) = !comida.carne()
}
object dietetico{
	method criterioAlimentacion(comida) = comida.calorias() < 500
}
object alternado{
	method criterioAlimentacion(comida) {}
}