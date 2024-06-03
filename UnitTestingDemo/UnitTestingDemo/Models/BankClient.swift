//
//  BankClient.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 04.05.24.
//

import Foundation

struct BankClient: Client {
    let clientId: String = UUID().uuidString
    let personalNumber: String
    let name: String
    let surname: String
    let car: Car?
}

extension BankClient {
    
    init(personalNumber: String, name: String, surname: String) {
        self.personalNumber = personalNumber
        self.name = name
        self.surname = surname
        self.car = nil
    }
    
}
