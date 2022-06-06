import Foundation
class Flight: Airline {
    let seatsCapacity: Int = 10;
    var flightNo: String;
//    var departureName: String;
//    var arriveTime: String;
    var seats: [Bool] = [false, false, false, false, false, false, false, false, false, false];

    init(flightNo: String, name: String, airlineCode: String) {
        self.flightNo = flightNo;
        super.init(name: name, airlineCode: airlineCode);
    }

    func reserveSeat(seatNumber: Int) {
        seats[seatNumber] = true;
    }

    func getBoardingPass(seatNo: Int) {
        print("*****TICKET INFORMATION*********");
        print("Airlines Name: \(self.name) \n");
        print("Seat Number: \(seatNo) \n");
        let classType = (seatNo - 1 < 4) ? "First Class" : "Economy";

        print("Class Type: \(classType) \n");
        print("*****Happy Journey*******");
    }
}
