Node = Struct.new(:value, :next, :prev)


class List

  include Enumerable
  
  attr_accessor :inicio, :final



  def extract_beginning

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
#Solo insertas por el final
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






  def empty

    if(@inicio == nil) then
      return true
    else return false
    end

  end

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

  #Al metodo each se le puede pasar un bloque de codigo
  # y ese bloque se va a colocar en cada campo yield y se ejecutará con los parámetros qe están al lado del yield
  def each
  return nil if @inicio.nil?
      aux = @inicio #Creamos un nodo auxiliar
      until aux.nil? #Y hasta que el nodo no sea nulo
          yield aux[:value]
          aux = aux.next
      end
  end

end
