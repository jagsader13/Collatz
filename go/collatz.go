package main
import "fmt"

func collatz(x int) int {
    var count int = 0
    for {
        if x == 1 {
            break
        } else if x%2 == 0 {
            x = x / 2
        } else {
            x = 3 * x + 1
        }
        count++
    }
    return count
}

func main() {
	var counter int 
	var num int 
	var originalNum int
	fmt.Println("Enter the starting number: ")
	fmt.Scanln(&num)
	originalNum=num
	counter=collatz(num)
	fmt.Println("A starting value of ",originalNum," has ", counter , " steps.")

}