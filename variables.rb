a = "dog"
puts a

puts "---------------------"

#reassigns the variable a
1.times do |i|
	a = "cat"
end

puts a

puts "---------------------"

#tries to reassign the variable a
def scope1(var)
	a = "monkey"
end

scope1(a)
puts a

puts "---------------------"

#pushes 0 into variable a, but does not mutate
def scope2(var)
	var.upcase
end

scope2(a)
puts a

puts "---------------------"

#mutates the caller using pop
def scope3(var)
	var.reverse!
end

scope3(a)
puts a

puts "---------------------"

puts "=================================================================="

def inner(i)
	i = "hamburger"
end
puts i 
#i is not accessible from outer scope

puts "---------------------"

2.times do |n|
	n = "hot dog"
end
puts n
#n is not accessible from outer scope after .times is called

puts "---------------------"

array = [1,2,3]

for i in array do
	a = 1
end

puts a
#a IS accessible from outer scope, as there is no method invocation, and the do..end does not create a new scope

puts "---------------------"

array1 = [4,5,6]

array2 = [7,8,9]

for i in array1 do
	i = 10
	for x in array2 do
		x = 11
	end
end

puts i
puts x
#both variables are accessible from outer scope as no new scope is created even while nested.