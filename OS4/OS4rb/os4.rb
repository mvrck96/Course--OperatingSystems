def rand_array(x)
  if (x > 0)
    max = x - 1
  end
  x.times.map{ Random.rand(max) }
end
print ("N: ")
b = rand_array(gets.to_i)
print("Generated:\t",  b, "\n", "Distinct:\t",  (b.uniq).sort)
