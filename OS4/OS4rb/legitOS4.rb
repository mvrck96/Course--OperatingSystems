# encoding: UTF-8
print ("Array lenght: ")
sizeArr =  gets.to_i
buff = 0
unique = 0
arr = Array.new(sizeArr)
for i in 0..(sizeArr-1) do arr[i] = gets.to_i end

for i in 0..(sizeArr-1)
  if (arr[i] != -1) then
    buff  = arr[arr[i]]
    arr[arr[i]] = -1
  end
  until (buff != -1)
    buff = arr[buff]
    arr[buff] = -1
  end end
for i in 0..(sizeArr-1)
  if (arr[i] == -1) then
    unique += 1
  end end
print("Number of distinct elements: ",  unique)
