import UIKit

//list of interest
enum Interest: String {
    case Motocycle
    case Soccer
    case Cooking
    case Climbing
    case Swimming
    case Travel
    case Running
    case Fashion
    case Programming
    case Gaming
    case Movie
    case Books
    case Photo
}

// list of characteristics
enum Characteristics {
    case age
    case gender
    case civilStatus
    case hometown
}

class MatchingAlgo {
    
    // A single person structure
    struct Person: Equatable {
        static func == (lhs: MatchingAlgo.Person, rhs:MatchingAlgo.Person) -> Bool {
            return lhs.name == rhs.name
        }
        
        // properties
        let name: String
        let characteristics: [Characteristics: Any]
        var interest: [Interest]
    }
    
    // Our array of people
    var people = [Person]()
    
    //initialization
    init() {
        people.append(Person(name: "Michael", characteristics: [.age: 22, .gender: "M", .civilStatus: "single", .hometown: "San Francisco"], interest: [.Climbing, .Travel, .Motocycle, .Movie]  ))
        people.append(Person(name: "Laura", characteristics: [.age: 25, .gender: "F", .civilStatus: "single", .hometown: "Rome"], interest: [.Cooking, .Travel, .Books, .Movie]  ))
        people.append(Person(name: "Mark", characteristics: [.age: 37, .gender: "M", .civilStatus: "married", .hometown: "Sydney"], interest: [.Photo, .Travel, .Motocycle, .Movie]  ))
        people.append(Person(name: "Janice", characteristics: [.age: 18, .gender: "F", .civilStatus: "single", .hometown: "New York"], interest: [.Fashion, .Movie, .Photo, .Running, .Travel,.Cooking]  ))
        people.append(Person(name: "Jessica", characteristics: [.age: 30, .gender: "F", .civilStatus: "married", .hometown: "Dublin"], interest: [.Movie, .Running, .Climbing, .Motocycle, .Travel]  ))
        people.append(Person(name: "Monique", characteristics: [.age: 28, .gender: "F", .civilStatus: "single", .hometown: "Paris"], interest: [.Fashion, .Cooking, .Travel, .Movie]  ))
        people.append(Person(name: "Mila", characteristics: [.age: 33, .gender: "F", .civilStatus: "divorced", .hometown: "Prague"], interest: [.Climbing, .Movie, .Programming, .Photo, .Travel]  ))
        people.append(Person(name: "Gregory", characteristics: [.age: 41, .gender: "M", .civilStatus: "divorced", .hometown: "London"], interest: [.Programming, .Soccer, .Swimming, .Photo, .Movie, .Travel]  ))
        people.append(Person(name: "Jack", characteristics: [.age: 36, .gender: "M", .civilStatus: "married", .hometown: "Glasgow"], interest: [.Motocycle, .Movie, .Soccer, .Books, .Cooking, .Travel]  ))
        people.append(Person(name: "Joe", characteristics: [.age: 24, .gender: "M", .civilStatus: "single", .hometown: "Liverpool"], interest: [.Photo, .Programming, .Movie, .Gaming, .Travel] ))
    }
    
    //Participants will introduce themselves one by one.
    func introduction() {
        for i in people {
            print("Hello, my name is \(i.name), i'm \(i.characteristics[.age] ?? 0) years old, \(i.characteristics[.civilStatus] ?? 0), living in \(i.characteristics[.hometown] ?? 0).")
        }
    }
    
    //randomly nominate a participant to share their interests.
    func announceInterest() {
        let list = people.shuffled()
        for i in list {
            var string = "Hello again, my name is \(i.name) and my interest are "
            for j in i.interest {
                if i.interest.first!.rawValue == j.rawValue {
                    string.append(j.rawValue)
                } else {
                    string.append(", \(j.rawValue)")
                }
            }
            string.append(".")
            print(string)
        }
    }
  
    // pairing and logging the paired results
    // THIS IS WRONG
    // Match on their DIFFERANCES
    func match() {
        var peopleToMatch = people.shuffled()
        var index = 1
        repeat {
            if index < peopleToMatch.count {
                let interestMached = peopleToMatch.first?.interest.filter(peopleToMatch[index].interest.contains)
                if peopleToMatch[index].name != peopleToMatch.first?.name && interestMached?.count ?? 0 >= 2 {
                    print("\(peopleToMatch.first?.name ?? "") is matching with \(peopleToMatch[index].name) with \(interestMached?.count ?? 0) common interests.")
                    peopleToMatch.remove(at: index)
                    peopleToMatch.removeFirst()
                }
                else {
                    index += 1
                }
            }
        }
        while index <= peopleToMatch.count
    }
}

MatchingAlgo().introduction()
print("--")
MatchingAlgo().announceInterest()
print("--")
MatchingAlgo().match()



