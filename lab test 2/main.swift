import Foundation;

var flight = Flight(flightNo: "AEK-178209", name: "Fly Emirates", airlineCode: "FLY-EM-AEK");
let seats = flight.seats;

print("***Welcome to Fly Emirates*** \n");
print("Please Select option ")
print("\t1: First Class\n \t2: Economy class \n");
print("Enter here: ")
let classType = readLine(strippingNewline: true)!;

if (classType == "1" || classType == "2") {
    
    if (classType == "1") {
        bookFirstClass()
    } else {
        bookEconomyClass()
    }
} else {
    print("Invalid option provided. Please retry. \n");
}

func bookFirstClass() {
    for (index, seat) in seats.enumerated() {
        // 0-4 index are for first class
        // check if index 0-4 are false if not book, else exit.
        if (index < 5) {
            if (seat == false) {
                flight.reserveSeat(seatNumber: index);
                flight.getBoardingPass(seatNo: index + 1);
                break;
            } else if (seat == true && index == 4) {
                print("All First class ticket are fully booked. \n")
                print("Would you like book economy class tickets.")
                print("Press Y to book: \n");
                var userChoice = readLine() ?? "N";
                
                if (userChoice == "Y" || userChoice == "y") {
                    bookEconomyClass()
                } else {
                    print("Wrong input provided, Please retry!")
                }
            }
        } else {
            // Don't iterate if index is greater than 5(Economy Class)
            break;
        }
    }
}

func bookEconomyClass() {
    for (index, seat) in seats.enumerated().reversed() {
        // 5-9 index are for economy class.
        // check if index 0-4 are false if not book, else exit.
        if (index > 4) {
            if (seat == false) {
                flight.reserveSeat(seatNumber: index);
                flight.getBoardingPass(seatNo: index + 1);
                break;
            } else if (seat == true && index == 5) {
                print("All economy class ticket are fully booked. \n")
                print("Would you like book first class tickets.");
                print("Press Y to book: \n");
                var userChoice = readLine() ?? "N";
                
                if (userChoice == "Y" || userChoice == "y") {
                    bookFirstClass()
                } else {
                    print("Wrong input provided, Please retry!")
                }
            }
        } else {
            // Don't iterate if index is less than 5.
            break;
        }
    }
}
