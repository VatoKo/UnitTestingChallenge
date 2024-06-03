//
//  AveragePerson.swift
//  BrandBook
//
//  Created by Vato Kostava on 03.05.24.
//  Copyright © 2024 BOG. All rights reserved.
//

import Foundation

struct AveragePerson: Person {
    let personalNumber: String
    let name: String
    let surname: String
    let car: Car?
}

extension AveragePerson {
    
    init(personalNumber: String, name: String, surname: String) {
        self.personalNumber = personalNumber
        self.name = name
        self.surname = surname
        self.car = nil
    }
    
}
