# encoding: utf-8
# Author::    Daniel Díaz García
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

class Alimentos
        #Esta clase permite crear un alimento con
        #sus proteinas, glucidos y grasas
        #además incluye comparable
        include Comparable
    
    attr_reader :nombre, :proteinas, :glucidos, :grasas
    
    #Se asignan los valores de las variables de instancia
    def initialize(nombre, proteinas, glucidos, grasas, datos=nil)
        
        @nombre = nombre
        @glucidos = glucidos
        @proteinas = proteinas
        @grasas = grasas
        @datos = datos
        
    end
    #Funcion que devuelve el valor energético de un alimento
    def valor_energ
        
        aux_proteinas = @proteinas
        aux_glucidos = @glucidos
        aux_grasas = @grasas 
        v_energetico = 4* aux_glucidos + 4*aux_proteinas + 9*aux_grasas
        v_energetico
        
    end
    
    #Funcion que permite imprimir Alimentos
    def to_s
        
        out = "\t\t\tProteinas\tLipidos\t\tGrasas\n"
        out << "#{@nombre}\t\t"
        out << "#{@proteinas}\t\t"
        out << "#{@glucidos}\t\t"
        out << "#{@grasas}"
        out
        
    end
    
    def aibc (index)
        aux = []
        @datos[index][1..@datos[index].length - 1].zip(@datos[index][0..@datos[index].length - 2]) do |x,y|
            if x < @datos[index][0]
                aux << 0.0
            else
                aux << (((x-@datos[index][0])+(y-@datos[index][0]))/2)*5
            end 
        end
        aux.reduce(:+)
    end
    
    def longitud_datos()
    
      @datos.length
      
    end
    
    
    
    #inclusión del comparable
    def <=>(other) #Compara dos objetos de la misma jerarquía basandose en la variable calórica vct
	return nil unless other.is_a? Alimentos
			return valor_energ <=> other.valor_energ
	end
end






class GrupoAlimento < Alimentos
   attr_reader :grupo
   #Subclase que permite asignar el grupo a un alimento
    def initialize(alimento, grupo)
    
        super(alimento.nombre, alimento.proteinas, alimento.glucidos, alimento.grasas)
        @grupo = grupo
    
    end
    #Método para imprimir un alimento de la subclase Grupo alimento
    def to_s
       
       out = "#{@grupo}\n" + super.to_s
       out
    
    end
end