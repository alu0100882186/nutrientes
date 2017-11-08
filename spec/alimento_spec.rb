require 'lib/alimento/alimento_class'

#require 'spec_helper'



describe Alimentos do
    before :each do
        @huevo_frito = Alimentos.new("Huevo frito", 14.1 , 0.0, 19.5)
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
end