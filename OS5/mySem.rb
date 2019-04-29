require 'semaphore'

class BathControl
  def initialize
    @man = Semaphore.new(1)
    @women = Semaphore.new(1)
    @bath = Semaphore.new(1)
    @chr = Semaphore.new(1)
    @inBath = :neutral
    @counter = 0
    @chmax = 3
    @chman = 0
    @chwomen = 0
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

  def ManInCh
    @man.P
    @chr.P if @chman >= :chmax
    @chman += 1
    @man.V
  end

  def WomenInCh
    @women.P
    @chr.P if @chwomen >= :chmax
    @chwomen += 1
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

  def ManOutCh
    @man.P
    @chman -= 1
    @chr.V if @chman < :chmax
  end

  def WomenOutCh
    @women.P
    @chwomen -= 1
    @chr.V if @chwomen < :chmax
  end

end

vanna = BathControl.new

ticker = 2
inx = ticker - 1

for i in (0..inx) do
  Thread.new do
    sleep rand*5
    puts Thread.current.to_s + ' мужчина хочет войти в раздевалку'
    vanna.ManInCh
    puts Thread.current.to_s + ' мужчина вошел в раздевалку'
    sleep rand
    puts Thread.current.to_s + ' мужчина вышел из раздевалки'
    vanna.ManOutCh
    puts Thread.current.to_s + ' мужчина хочет войти в ванную комнату'
    vanna.ManIn
    puts Thread.current.to_s + ' мужчина вошёл в ванную комнату'
    sleep rand
    puts Thread.current.to_s + ' мужчина вышел из ванной комнаты'
    vanna.ManOut
    puts Thread.current.to_s + ' мужчина хочет войти в раздевалку'
    vanna.ManInCh
    puts Thread.current.to_s + ' мужчина вошел в раздевалку'
    sleep rand
    puts Thread.current.to_s + ' мужчина вышел из раздевалки'
    vanna.ManOutCh
  end
end

for i in (0..inx) do
  Thread.new do
    sleep rand * 5
    puts Thread.current.to_s + ' женщина хочет войти в раздевалку'
    vanna.WomenInCh
    puts Thread.current.to_s + ' женщина вошлa в раздевалку'
    sleep rand
    puts Thread.current.to_s + ' женщина вышлa из раздевалки'
    vanna.WomenOutCh
    puts Thread.current.to_s + ' женщина хочет войти в ванную комнату'
    vanna.WomenIn
    puts Thread.current.to_s + ' женщина вошла в ванную комнату'
    sleep rand
    puts Thread.current.to_s + ' женщина вышла из ванной комнаты'
    vanna.WomenOut
    puts Thread.current.to_s + ' женщина хочет войти в раздевалку'
    vanna.WomenInCh
    puts Thread.current.to_s + ' женщина вошлa в раздевалку'
    sleep rand
    puts Thread.current.to_s + ' женщина вышлa из раздевалки'
    vanna.WomenOutCh
  end
end

Thread.list.each{ |t| t.join unless t == Thread.main}
