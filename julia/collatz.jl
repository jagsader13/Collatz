#!/usr/bin/julia

function collatz(n,ic)
    while n ≠ 1
        println(n)
        n = iseven(n) ? n ÷ 2 : 3n + 1
        ic = ic + 1
    end
    return ic
end

println("Enter the starting number: ")
input = readline()
num = parse(Int, input)
originalNum = num
ic = 0
println("A starting value of ", originalNum, " has ", collatz(num,ic), " steps.")

exit(0)

