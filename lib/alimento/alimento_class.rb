class Alimentos
    
    attr_reader :nombre, :proteinas, :glucidos, :grasas
    
    def initialize(nombre, proteinas, glucidos, grasas)
        
        @nombre = nombre
        @glucidos = glucidos
        @proteinas = proteinas
        @grasas = grasas
        
    end
    
    def valor_energ
        
        aux_proteinas = @proteinas
        aux_glucidos = @glucidos
        aux_grasas = @grasas 
        v_energetico = 4* aux_glucidos + 4*aux_proteinas + 9*aux_grasas
        v_energetico
        
    end
    
    def to_s
        
        out = "\t\t\tProteinas\tLipidos\t\tGrasas\n"
        out << "#{@nombre}\t\t"
        out << "#{@proteinas}\t\t"
        out << "#{@glucidos}\t\t"
        out << "#{@grasas}"
        out
        
    end
end

class GrupoAlimento < Alimentos
   
   attr_reader :grupo
   
    def initialize(alimento, grupo)
    
        super(alimento.nombre, alimento.proteinas, alimento.glucidos, alimento.grasas)
        @grupo = grupo
    
    end
    
    def to_s
       
       out = "#{@grupo}\n" + super.to_s
       out
    
    end
end