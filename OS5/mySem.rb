require 'semaphore'

class BathControl
  def initialize
    @man = Semaphore.new(1)
    @women = Semaphore.new(1)
    @bath = Semaphore.new(1)
    @inBath = :neutral
    @counter = 0
  end

  def ManIn
    @man.P
    @bath.P if @inBath != :man
    @inBath = :man
    @counter += 1
    @man.V
  end

  def WomenIn
    @women.P
    @bath.P if @inBath != :women
    @inBath = :women
    @counter += 1
    @women.V
  end

  def ManOut
    @man.P
    @counter -= 1
    @inBath = :neutral if @counter == 0
    @bath.V if @counter == 0
    @man.V
  end

  def WomenOut
    @women.P
    @counter -= 1
    @inBath = :neutral if @counter == 0
    @bath.V if @counter == 0
    @women.V
  end
end

vanna = BathControl.new

ticker = 3
inx = ticker - 1

for i in (0..inx) do
  Thread.new do
    sleep rand*5
    puts Thread.current.to_s + ' дядя хочет войти'
    vanna.ManIn
    puts Thread.current.to_s + ' дядя вошел'
    sleep rand
    puts Thread.current.to_s + ' дядя вышел'
    vanna.ManOut
  end
end

for i in (0..inx) do
  Thread.new do
    sleep rand * 5
    puts Thread.current.to_s + 'тётя хочет войти'
    vanna.WomenIn
    puts Thread.current.to_s + 'тётя вошла'
    sleep rand
    puts Thread.current.to_s + 'тётя вышла'
    vanna.WomenOut
  end
end

Thread.list.each{ |t| t.join unless t == Thread.main}
