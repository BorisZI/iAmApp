//
//  User.swift
//  AboutMeApp
//
//  Created by Boris Zitserman on 05.07.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User (
            login: "Boris",
            password: "Pass",
            person: Person.getPerson()
    )
    }
}
struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
static func getPerson() -> Person {
    Person(name: "Boris", surname: "Zitserman", image: "I'm")
    }
}
