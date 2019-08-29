import UIKit

/* * * * * * * * * * * * * * * * *
 *  Customize your intrest here  *
 * * * * * * * * * * * * * * * * */

public enum Interest: String {
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

/* * * * * * * * * * * * * * * * * * * * * * * *
 *  Customize your user characteristics here   *
 * * * * * * * * * * * * * * * * * * * * * * * */

public enum Characteristics: String {
    case age
    case hometown
}
public struct Person { let name: String; let characteristics: [Characteristics: AnyHashable]; var interest: [Interest] }
extension Person: Hashable {}

public class matchingAlgo {
    static public let shared = matchingAlgo()
    
    private var people = [Person]()
    
    /* * * * * * * * * * * * * * * * * *
     *  Customize your userbase here   *
     * * * * * * * * * * * * * * * * * */
    
    private var persons = [
     Person(name: "Oliver", characteristics: [.age: 32, .hometown: "Preston"], interest: [.swimming, .gaming, .philosophy, .documentaries, .cycling]),
      Person(name: "Mary", characteristics: [.age: 30, .hometown: "Bristol"], interest: [.painting, .swimming, .philosophy, .podcasts,.gardening]),
       Person(name: "Jack", characteristics: [.age: 31, .hometown: "Canterbury"], interest: [ .painting, .socialising, .cooking, .travelling, .documentaries]),
      Person(name: "Rowan", characteristics: [.age: 28, .hometown: "Illford"], interest: [.climbing, .socialising, .lifeDrawing, .boxing, .cycling]),
       Person(name: "Lindsey", characteristics: [.age: 27, .hometown: "Glasgow"], interest: [ .photography, .lifeDrawing, .boxing, .chess, .cycling]),
      Person(name: "John", characteristics: [.age: 28, .hometown: "Liverpool"], interest: [.climbing, .cooking, .photography, .chess, .gardening]),
        Person(name: "Matthew", characteristics: [.age: 33, .hometown: "London"], interest: [.gaming, .socialising, .podcasts, .yoga, .travelling]),
       Person(name: "Jane", characteristics: [.age: 37, .hometown: "London"], interest: [.gaming, .swimming, .reading, .lifeDrawing, .chess]),
        Person(name: "Sophie", characteristics: [.age: 36, .hometown: "Brighton"], interest: [ .swimming, .yoga, .reading, .chess, .cooking]),
      Person(name: "Roxy", characteristics: [.age: 32, .hometown: "Canterbury"], interest: [.swimming, .socialising, .cooking, .podcasts, .boxing])]
    
    private init() {
        var i = Int.random(in: 2...persons.count)
        while i % 2 != 0 { i = Int.random(in: 2...persons.count) }
        people.append(contentsOf: persons.prefix(i))
    }
    
    public func introduction() {
        for id in people {
            print("Hello, my name is \(id.name), i'm \(id.characteristics[.age] as? Int ?? 0) years old, from  \(id.characteristics[.hometown] as? String ?? "unknown").")
        }
    }
    
    public func announceInterest() {
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
            }; print(string) }
    }
    
    public func match() {
        var _people = people
        while _people.count != 0 {
            let sel = _people.removeFirst()
            var dif = [Person: Int]()
            for p in _people {
                let r: (person: Person, differances: Int) = getDifferances(in: sel, personTwo: p)
                dif[r.person] = r.differances
            }
            var i = [Person]()
            var k = 0
            for j in dif {
                if j.value > k {
                    k = j.value
                    i.append(j.key)
                }
            }
            print("\(sel.name) as matched with \(i.first!.name) with \(k) differances!")
            _people.remove(at: _people.firstIndex(of:i.first!)!)
        }
    }
    
    /* * * * * * * * * * * * * * * * * * * *
     *  Here you can play with the math    *
     *  for various algorithms to return   *
     * * * * * * * * * * * * * * * * * * * */
    
    private func getDifferances(in personOne: Person, personTwo: Person) -> (Person, Int) {
        let dI = personOne.interest
        var tot = 0
        for i in personTwo.interest {
            if dI.contains(i) {
                tot += 1
            }
        }; return (personTwo, 18 - tot)
    }
}
            

matchingAlgo.shared.introduction()
print("--")
matchingAlgo.shared.announceInterest()
print("--")
matchingAlgo.shared.match()
