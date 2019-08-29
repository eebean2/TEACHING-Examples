import UIKit

/* * * * * * * * * * * * * * * * *
 *  Customize your intrest here  *
 * * * * * * * * * * * * * * * * */

public enum Interest: String {
    case programming
}

/* * * * * * * * * * * * * * * * * * * * * * * *
 *  Customize your user characteristics here   *
 * * * * * * * * * * * * * * * * * * * * * * * */

public enum Characteristics: String {
    case age
    case hometown
}

public struct Person {
    let name: String
    let characteristics: [Characteristics: AnyHashable]
    var interest: [Interest]
}

public class matchingAlgo {
    
    /// Using a singleton to share resources
    /// See https://www.hackingwithswift.com/example-code/language/what-is-a-singleton for more details
    static public let shared = matchingAlgo()
    
    private var people = [Person]()
    
    /* * * * * * * * * * * * * * * * * *
     *  Customize your userbase here   *
     *     Example user provided       *
     * * * * * * * * * * * * * * * * * */
    
    private var persons = [Person(name: "Erik", characteristics: [.age: 25, .hometown: "Hubert"], interest: [.programming])]
    
    private init() {
        /// OPTIONAL: Get a random number of people from 2-12 and add them to people
    }
    
    public func introduction() {
        for i in people {
            /// Print their introduction here
        }
    }
    
    public func announceInterest() {
        for i in people {
            /// Print their interest here
        }
    }
    
    public func match() {
        /// Create a matching function
    }
}


matchingAlgo.shared.introduction()
print("--")
matchingAlgo.shared.announceInterest()
print("--")
matchingAlgo.shared.match()
