 # encoding: UTF-8
print ("Длинна массива: ")
sizeArr =  gets.to_i
unique = 0
arr = Array.new(sizeArr)

for i in 0..(sizeArr-1)
  arr[i] = gets.to_i end
for i in 0..sizeArr
  for j in i..sizeArr
    if ((i != j) && (arr[i] == arr[j])) then
      unique += 1
      break end end end
print("Количество уникальных элементов: ", sizeArr - unique)
