require 'monitor'

class BathControl
  include MonitorMixin

def initialize
  @man = new_cond
  @women = new_cond
  @counter = 0
  @inBath = :neutral
  @chmax = 3
  @chman = 0
  @chwomen = 0
end

def ManIn
  synchronize do
    @man.wait if @inBath == :women
    @inBath = :man
    @counter += 1
    @man.signal
  end
end

def WomenIn
  synchronize do
    @women.wait if @inBath == :man
    @inBath = :women
    @counter += 1
    @women.signal
  end
end

def ManInCh
  synchronize do
      @man.wait if @chman >= :chmax
      @chman += 1
      @man.signal
  end
end

def WomenInCh
  synchronize do
      @women.wait if @chwomen >= :chmax
      @chmwomen += 1
      @women.signal
  end
end

def ManOut
  synchronize do
    @counter -= 1
    @inBath = :neutral if @counter == 0
    @women.signal if @counter == 0
  end
end

def WomenOut
  synchronize do
    @counter -= 1
    @inBath = :neutral if @counter == 0
    @man.signal if @counter == 0
    end
  end
end

def ManOutCh
  synchronize do
    @chman -= 1
    @man.signal
  end
end

def WomenOutCh
  synchronize do
    @chwomen -= 1
    @women.signal
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
    sleep rand*1
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
    sleep rand*1
    puts Thread.current.to_s + ' мужчина вышел из раздевалки'
    vanna.ManOutCh
  end


for i in (0..inx) do
  Thread.new do
    sleep rand * 5
    puts Thread.current.to_s + ' женщина хочет войти в раздевалку'
    vanna.WomenInCh
    puts Thread.current.to_s + ' женщина вошлa в раздевалку'
    sleep rand*1
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
    sleep rand*1
    puts Thread.current.to_s + ' женщина вышлa из раздевалки'
    vanna.WomenOutCh
  end
end

Thread.list.each{ |t| t.join unless t == Thread.main}
