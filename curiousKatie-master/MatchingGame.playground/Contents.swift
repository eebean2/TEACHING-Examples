import UIKit

//list of interest
enum Interest: String {
    case gaming
    case swimming
    case philosophy
    case documentaries
    case cycling
    case painting
    case podcasts
    case gardening
    case socialising
    case travelling
    case climbing
    case lifeDrawing
    case boxing
    case photography
    case chess
    case cooking
    case yoga
    case reading
}

// list of characteristics
enum Characteristics: String {
    case age
    case hometown
}

struct Person {
    
    // properties
    let name: String
    let characteristics: [Characteristics: AnyHashable]
    var interest: [Interest]
}

extension Person: Hashable {}

class matchingAlgo {
    
    var people = [Person]()
    
    var persons = [
     Person(name: "Oliver", characteristics: [.age: 32, .hometown: "Preston"], interest: [.swimming, .gaming, .philosophy, .documentaries, .cycling]),
      Person(name: "Mary", characteristics: [.age: 30, .hometown: "Bristol"], interest: [.painting, .swimming, .philosophy, .podcasts,.gardening]),
       Person(name: "Jack", characteristics: [.age: 31, .hometown: "Canterbury"], interest: [ .painting, .socialising, .cooking, .travelling, .documentaries]),
      Person(name: "Rowan", characteristics: [.age: 28, .hometown: "Illford"], interest: [.climbing, .socialising, .lifeDrawing, .boxing, .cycling]),
       Person(name: "Lindsey", characteristics: [.age: 27, .hometown: "Glasgow"], interest: [ .photography, .lifeDrawing, .boxing, .chess, .cycling]),
      Person(name: "John", characteristics: [.age: 28, .hometown: "Liverpool"], interest: [.climbing, .cooking, .photography, .chess, .gardening]),
        Person(name: "Matthew", characteristics: [.age: 33, .hometown: "London"], interest: [.gaming, .socialising, .podcasts, .yoga, .travelling]),
       Person(name: "Jane", characteristics: [.age: 37, .hometown: "London"], interest: [.gaming, .swimming, .reading, .lifeDrawing, .chess]),
        Person(name: "Sophie", characteristics: [.age: 36, .hometown: "Brighton"], interest: [ .swimming, .yoga, .reading, .chess, .cooking]),
      Person(name: "Roxy", characteristics: [.age: 32, .hometown: "Canterbury"], interest: [.swimming, .socialising, .cooking, .podcasts, .boxing]),
]
    
    static let shared = matchingAlgo()
    
    //initialization
    private init() {
        
        //get random number of persons and add it to people
        var i = Int.random(in: 2...persons.count)
        while i % 2 != 0 {
            i = Int.random(in: 2...persons.count)
            
        }
        people.append(contentsOf: persons.prefix(i))
    }
    
    //Participants will introduce themselves one by one.
    func introduction() {
        for id in people {
            print("Hello, my name is \(id.name), i'm \(id.characteristics[.age] as? Int ?? 0) years old, from  \(id.characteristics[.hometown] as? String ?? "unknown").")
        }
    }
    
    //randomly nominate a participant to share their interests.
    func announceInterest() {
        let list = people.shuffled()
        for id in list {
            var string = "Hello again, my name is \(id.name) and my interest are "
            for e in id.interest {
                if id.interest.first!.rawValue == e.rawValue {
                    string.append(e.rawValue)
                } else if id.interest.last!.rawValue == e.rawValue {
                    string.append(", and \(e.rawValue).")
                } else {
                    string.append(", \(e.rawValue)")
                }
            }
            print(string)
        }
    }
        
     //  person to match nominated to be paired in above func
    func match() {
        var _people = people
        while _people.count != 0 {
            let sel = _people.removeFirst()
            var dif = [Person: Int]()
            for p in _people {
                let r: (person: Person, differances: Int) = getDifferances(in: sel, personTwo: p)
                dif[r.person] = r.differances
            }
            // for loop to check dif dictionary for who has most number of differance and match
            // remove person two from _people array
            let i = dif.keys.first!
            var p = [Person]()
            
            p.append(i)
            
            
            _people.remove(at: _people.firstIndex(of:p.first!)!)
        }
    }
    
//    func getDifferances(in personOne: Person, personTwo: Person) -> [Person: Int] {
    func getDifferances(in personOne: Person, personTwo: Person) -> (Person, Int) {
        let dI = personOne.interest
        var tot = 0
        for i in personTwo.interest {
            if dI.contains(i) {
                tot += 1
            }
        }
        return (personTwo, 18 - tot)
//        return [personTwo: 18 - tot]
    }
}
            

matchingAlgo.shared.introduction()
print("--")
matchingAlgo.shared.announceInterest()
print("--")
matchingAlgo.shared.match()
