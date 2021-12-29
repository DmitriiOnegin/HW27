//
//  Person.swift
//  HW27
//
//  Created by Dmitrii Onegin on 29.12.2021.
//

import Foundation

struct Person: Equatable {
    let name: String
    let sername: String
    let email: String
    let phone: String
    
    var fullName: String {
        "\(name) \(sername)"
    }
}

extension Person {
    static func getPersons() -> [Person] {
        var persons = [Person]()
        let dataManager = DataManager.shared
        while persons.count < 10 {
            let name = dataManager.names.randomElement() ?? ""
            let sername = dataManager.sernames.randomElement() ?? ""
            let email = dataManager.emails.randomElement() ?? ""
            let phone = dataManager.phones.randomElement() ?? ""
            let newPerson = Person(name: name, sername: sername, email: email, phone: phone)
            for person in persons {
                if person != newPerson {
                    persons.append(newPerson)
                }
            }
        }
        print(persons.count)
        return persons
    }
}
