require './lib/alimento/alimento_class'
require './lib/alimento/lista'
#require 'spec_helper'


describe GrupoAlimento do
    before :each do
        @huevo_frito = Alimentos.new("Huevo frito", 14.1 , 0.0, 19.5)
        @lechevaca = Alimentos.new("Leche vaca", 3.3, 4.8, 3.2)
        @yogurt = Alimentos.new("Yogurt", 3.8, 4.9, 3.8)
        @cerdo = Alimentos.new("Cerdo", 21.5, 0.0, 6.3)
        @ternera = Alimentos.new("Ternera", 21.1, 0.0, 3.1)
        @pollo = Alimentos.new("Pollo", 20.6, 0.0, 5.6)
        @bacalao = Alimentos.new("Bacalao", 17.7, 0.0, 0.4)
        @atun = Alimentos.new("Atun", 21.5, 0.0, 15.5)
        @salmon = Alimentos.new("Salmon", 19.9, 0.0, 13.6)
        @aceiteoliva = Alimentos.new("Aceite de oliva", 0.0, 0.2, 99.6)
        @chocolate = Alimentos.new("Chocolate", 5.3, 47.0, 30.0)
        @azucar = Alimentos.new("Azucar", 0.0, 99.8, 0.0)
        @arroz = Alimentos.new("Arroz", 6.8, 77.7, 0.6)
        @lentejas = Alimentos.new("Lentejas", 23.5, 52.0, 1.4)
        @papas = Alimentos.new("Papas", 2.0, 15.4, 0.1)
        @tomate = Alimentos.new("Tomate", 1.0, 3.5, 0.2)
        @cebolla = Alimentos.new("Cebolla", 1.3, 5.8, 0.3)
        @manzana = Alimentos.new("Manzana", 0.3, 12.4, 0.4)
        @platanos = Alimentos.new("Platanos", 1.2, 21.4, 0.2)
        
        @leche_grupo = GrupoAlimento.new(@lechevaca,"Lacteos")
        @yogurt_grupo = GrupoAlimento.new(@yogurt,"Lacteos")
        @huevo_frito_grupo = GrupoAlimento.new(@huevo_frito,"Lacteos")
        
        @Lista = List.new()
        @NodoInicial = Node.new(@leche_grupo, @yogurt_grupo, @huevo_frito_grupo)
    end
    
    describe "Almacenamiento correcto de los alimentos" do
        it "Se almacena correctamente el nombre del alimento" do
            expect(@huevo_frito.nombre).to eq("Huevo frito")     
        end
        it "Se almacena correctamente la cantidad de proteinas" do
            expect(@huevo_frito.proteinas).to eq (14.1)
        end
        it "Se almacena correctamente la cantidad de glucidos" do
            expect(@huevo_frito.glucidos).to eq (0.0)
        end
        it "Se almacena correctamente la cantidad de grasas" do
            expect(@huevo_frito.grasas).to eq (19.5)
        end
    end
    
    describe "Calculo correcto del valor energético del alimento" do
        it "Se realiza correctamente el calculo del valor energético de un alimento" do
            expect(@huevo_frito.valor_energ).to eq (231.9)
        end
    end
    
    describe "Comprobacion salida formateada correcta alimento" do
        it "Se muestra por pantalla correctamente el alimento" do
            expect(@huevo_frito.to_s).to eq ("\t\t\tProteinas\tLipidos\t\tGrasas\nHuevo frito\t\t14.1\t\t0.0\t\t19.5")
        end
    end
    
    describe "Pruebas para comprobar la clase de un objeto, tipo de un objeto y jerarquía de un objeto" do
        
        it "Clase de un objeto" do
            expect(@leche_grupo.class).to eq(GrupoAlimento)
            expect(@lechevaca.class).to eq(Alimentos)
        end
        
        it "Tipo de un objeto" do 
                
        end
        
        it "Pertenencia a una jerarquía." do
            expect(@leche_grupo.is_a?Alimentos).to eq(true)
            expect(@leche_grupo.is_a?GrupoAlimento).to eq(true)
            expect(@lechevaca.is_a?GrupoAlimento).to eq(false)
            expect(GrupoAlimento.is_a?Alimentos).to eq(false)
            expect(GrupoAlimento.is_a?Object).to eq(true)
        end
            
    end
    
    describe "Comprobacion implementacion correcta de la clase" do
        it"Almacenamiento correcto de los atributos de la clase" do
            expect(@leche_grupo.nombre).to eq("Leche vaca")
            expect(@leche_grupo.proteinas).to eq(3.3)
            expect(@leche_grupo.glucidos).to eq(4.8)
            expect(@leche_grupo.grasas).to eq(3.2)
        end
        
        it "Prueba salida formateada subclase GrupoAlimento" do
            expect(@leche_grupo.to_s).to eq ("Lacteos\n\t\t\tProteinas\tLipidos\t\tGrasas\nLeche vaca\t\t3.3\t\t4.8\t\t3.2")
        end 
    end
    
    describe "Comprobacion de la clase nodo" do
        it "Comprobacion de que contiene siguiente, previo y valor" do
            expect(@NodoInicial.value).to eq(@leche_grupo)
            expect(@NodoInicial.next).to eq(@yogurt_grupo)
            expect(@NodoInicial.prev).to eq(@huevo_frito_grupo)
        end
    end    
    describe "Comprobacion de la clase lista" do 
        it "Pruebas para comprobar que contiene cabeza y cola" do
            expect(@Lista.inicio).to eq(nil)
            expect(@Lista.final).to eq(nil)
        end
        
        it "Comprobacion de insercion y extraccion por el principio" do    
            @Lista.insert_beginning(@leche_grupo)
            expect(@Lista.extract_beginning).to eq(@leche_grupo)
        end    
        
        it "Comprobacion de insercion y extraccion por el final" do    
            @Lista.insert_beginning(@leche_grupo)
            expect(@Lista.extract_end).to eq(@leche_grupo)
        end  
        
        it "Comprobacion insertar varios elementos" do 
            @Lista.insert_beginning(@leche_grupo)
            @Lista.insert_beginning(@yogurt_grupo)
            @Lista.insert_beginning(@huevo_frito_grupo)
                expect(@Lista.extract_beginning).to eq(@huevo_frito_grupo)
                expect(@Lista.extract_beginning).to eq(@yogurt_grupo)
                expect(@Lista.extract_end).to eq(@leche_grupo)
        
        
        end
        
        it "comprobacion enumerable" do
            @Lista.insert_beginning(@leche_grupo)
            @Lista.insert_beginning(@yogurt_grupo)
            @Lista.insert_beginning(@huevo_frito_grupo)
            
            
            expect(@Lista.min).to eq(@leche_grupo)
            expect(@Lista.max).to eq(@huevo_frito)
            expect(@Lista.sort)
            expect(@Lista.count).to eq(3)
        end    
    end
    
    
    describe "Pruebas para el moduo comparable" do
        it "Comparacion <=" do
            expect(@lechevaca <= @platanos).to eq(true)
        end
        it "Comparacion >=" do
            expect(@lechevaca >= @platanos).to eq(false)
        end
        it "Comparacion =" do
            expect(@lechevaca == @platanos).to eq(false)
        end
    end
    
describe "Probando el aibc" do
    before :each do
       @compota = Alimentos.new("Compota manzana", 5.1, 4.3, 2.1, [[6.7,6.5,6.8,6.9,7.0,7.1,6.9,6.9,6.9,6.7,6.9,7.3,7.0,7.0,7.2,7.1,6.8,7.2,7.3,7.0,6.8,6.7,6.8,6.7,6.9],[4.6,4.8,5.3,5.6,6.1,6.5,6.6,7.0,7.0,6.8,6.4,6.3,6.1,6.1,6.2,6.0,6.1,6.1,6.2,6.3,6.4,6.1,6.1,5.7,5.9]] ) 
       @azucar  = Alimentos.new("Azucar", 0.0, 100, 0.0, [[4.9,5.3,5.9,6.7,7.2,7.6,8.0,8.2,8.2,8.4,8.3,8.3,8.0,7.5,7.1,6.8,6.8,6.9,6.8,6.3,6.2,6.3,6.2,6.3,6.1],[6.3,5.4,5.6,5.7,6.5,7.4,7.9,7.4,7.7,7.9,7.9,7.8,7.8,7.8,8.0,8.5,9.4,10.8,10.5,9.1,8.9,8.3,7.7,7.6,7.5]])
    end
    
    it "Se calcula el aibc de una persona y un alimento" do
        expect(@compota.aibc(0)).to eq(27.999999999999993)
        expect(@azucar.aibc(0)).to eq(255.99999999999997)
    end
    
    it "Se calcula el indice glucemico de un individuo" do
        expect((@compota.aibc(0) / @azucar.aibc(0)) * 100).to  eq(10.937499999999998)
        expect((@compota.aibc(1) / @azucar.aibc(1)) * 100).to  eq(93.49489795918366)
    end 
        
    
    
    
    
end
end