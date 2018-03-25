//
//  MockData.swift
//  collection-view-woes
//
//  Created by Derrick Showers on 3/23/18.
//  Copyright © 2018 Derrick Showers. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let age: Int
}

class PersonFactory {

    static func createPeople(amount: Int) -> [Person] {

        var people = [Person]()

        for _ in 1...amount {
            people.append(Person(name: "Cool Guy 😎", age: 22))
        }

        return people
    }
}
