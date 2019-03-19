# O of this algorithm is (!n)

# encoding: UTF-8
print ("Array lenght: ")
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
print("Number of distinct elements: ", sizeArr - unique)
