#!/usr/bin/julia

function collatz(value)
	if value % 2 == 0
		return collatz(value /= 2) + 1
    elseif value % 2 == 1 && value > 1
        return collatz(value * 3 + 1) + 1
    else
		return 0
	end
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
    ic=collatz(i)
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


