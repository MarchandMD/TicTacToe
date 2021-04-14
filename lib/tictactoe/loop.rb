def my_method(array)
  puts "guess the value of the array"
  input = gets.chomp
  while input != array[0]
    puts "nope, guess again!"
    input = gets.chomp
  end  
  puts "correct"
end

arr = ["x"]
my_method(arr)