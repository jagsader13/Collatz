package main
import "fmt"

func collatz(x int) int {
    var count int = 0
    for {
        if x == 1 {
            break
        } else if x%2 == 0 {
            x = x / 2
            return collatz(x) + 1
        } else {
            x = 3 * x + 1
            return collatz(x) + 1
        }
        count++
    }
    return count
}

func bubblesort(a []int) {
    for itemCount := len(a) - 1; ; itemCount-- {
        hasChanged := false
        for index := 0; index < itemCount; index++ {
            if a[index] > a[index+1] {
                a[index], a[index+1] = a[index+1], a[index]
                hasChanged = true
            }
        }
        if hasChanged == false {
            break
        }
    }
}

func main() {
	var ic int 
    var i int
    var maxIndex int
    numbers := []int{0,0,0,0,0,0,0,0,0,0}
    sequences := []int{0,0,0,0,0,0,0,0,0,0}
    maxIndex=5000000000

    bubblesort(numbers)
    bubblesort(sequences)
    i=1
    for i < maxIndex {
        ic=collatz(i)
        if ic > sequences[0] {
            sequences[0]=ic
            numbers[0]=i
        } else if ic == sequences[0] {
            if i < numbers[0] {
                numbers[0]=i
            }
        }
        bubblesort(numbers)
        bubblesort(sequences)
        i=i+1
    }

    fmt.Println("Numbers: ", numbers)
    fmt.Println("Sequences: ", sequences)

}