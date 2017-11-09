require 'lib/alimento/alimento_class'

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
end