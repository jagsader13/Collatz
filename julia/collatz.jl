#!/usr/bin/julia

function collatz(n,ic)
    while n ≠ 1
        n = iseven(n) ? n ÷ 2 : 3n + 1
        ic = ic + 1
    end
    return ic
end

function bubblesort!(arr::AbstractVector)
    for _ in 2:length(arr), j in 1:length(arr)-1
        if arr[j] > arr[j+1]
            arr[j], arr[j+1] = arr[j+1], arr[j]
        end
    end
    return arr
end



numbers = [0,0,0,0,0,0,0,0,0,0]
sequences = [0,0,0,0,0,0,0,0,0,0]
maxIndex=4999999999

numbers=bubblesort!(numbers)
sequences=bubblesort!(sequences)



for i in 1:maxIndex
    ic = 0
    ic=collatz(i,ic)
    if ic > sequences[1]
        global sequences[1]=ic
        global numbers[1]=i
    elseif ic == sequences[1]
        if i < numbers[1]
            global numbers[1]=i
        end
    end
    global numbers=bubblesort!(numbers)
    global sequences=bubblesort!(sequences)  
end 

println("Numbers: ",numbers)
println("Sequences: ",sequences)

exit(0)

