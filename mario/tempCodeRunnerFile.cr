i = 1

while true
    begin
        puts "Height"
        rows = gets.try(&.to_i) || 0
        if rows > 0 && rows < 9
            break
        end    
    rescue 
        puts "Try again"
    end
end
print "\33c\e[3J"

while i <= rows
    
    print(" " * (rows - i))
    print("#" * i)
    print("  ")
    print("#" * i)
    print("\n")

    i += 1
end