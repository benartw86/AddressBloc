def hello
    greeting = ARGV.shift
    ARGV.each do |y| 
        puts "#{greeting} #{y}"
    end
end

hello