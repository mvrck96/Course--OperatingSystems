require 'monitor'

class BathControl
  include MonitorMixin

def initialize
  @man = new_cond
  @women = new_cond
  @counter = 0
  @inBath = :neutral
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

vanna = BathControl.new

ticker = 2

ticker.times do
  Thread.new do
    sleep rand*5
    puts Thread.current.to_s + ' мужчина пытается войти в ванную комнату'
    vanna.ManIn
    puts Thread.current.to_s + ' мужчина вошёл в ванную комнату'
    sleep rand
    puts Thread.current.to_s + ' мужчина вышел из ванной комнаты'
    vanna.ManOut
  end
end

ticker.times do
  Thread.new do
    sleep rand * 5
    puts Thread.current.to_s + ' женщина пытается войти в ванную комнату'
    vanna.WomenIn
    puts Thread.current.to_s + ' женщина вошла в ванную комнату'
    sleep rand
    puts Thread.current.to_s + ' женщина вышла из ванной комнаты'
    vanna.WomenOut
  end
end

Thread.list.each{ |t| t.join unless t == Thread.main}
