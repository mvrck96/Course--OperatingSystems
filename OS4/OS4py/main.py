import random

arrlen = int(input())
digits = range (1, arrlen - 1)
arr =[None] * arrlen

for i in range(arrlen):
    arr[i] = random.choice(digits)

print("Generated array: ", arr, "\n",
      "Distinct values: ", set(arr), "\n")