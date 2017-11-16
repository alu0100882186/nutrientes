# encoding: utf-8
# Author::    Daniel Díaz García
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby




Node = Struct.new(:value, :next, :prev)


class List



#Esta clase permite crear una lista doblemente
#enlazada.
#Se incluyen los mixin comparable y enumerable
  include Enumerable
  
  attr_accessor :inicio, :final
  #Se crea el inicio y el final


  def extract_beginning
  #Permite extraer por el principio
    aux = @inicio
    @inicio = @inicio.next
    if(@inicio != nil)then
      @inicio.prev = nil
    end

    if(@inicio == nil)then
      @final = nil
    end

    return aux.value

  end
 #Permite extraer por el final
  def extract_end
 
    aux = @final
    @final = @final.prev

    if(@final != nil)then
      @final.next = nil
    end

    if(@final == nil)then
      @inicio = nil
    end

    return aux.value

  end
  #Permite insertar por el principio
  def insert_beginning(value)

  if(@inicio == nil) then
      @inicio = Node.new(value, nil, nil)
      @final = @inicio

  else
    aux = Node.new(value,@inicio,nil)
    @inicio.prev = aux
    @inicio = aux

  end

  return true

  end
#Permite insertar por el final
  def insert_end(value)
    
    if(@final == nil) then
        @final = Node.new(value, nil, nil)
        @inicio = @final

    else
      aux = Node.new(value,nil,@final)
      @final.next = aux
      @final = aux

    end

    return true


  end





  #comprueba si la lista está vacía
  def empty

    if(@inicio == nil) then
      return true
    else return false
    end

  end

#Método para imprimir la lista
  def to_s
  
    string=[]
    aux = @inicio
    i=0

    while(aux.next != nil) do
    string[i]=aux.value.to_s
    aux = aux.next
    i += 1
    end
    string[i] = aux.value

    return string
  end

  #Incluye el Enumerable
  def each
  return nil if @inicio.nil?
      aux = @inicio #Creamos un nodo auxiliar
      until aux.nil? #Y hasta que el nodo no sea nulo
          yield aux[:value]
          aux = aux.next
      end
  end

end
