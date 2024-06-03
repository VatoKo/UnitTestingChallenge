//
//  Organization.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

protocol Organization {
    var personnel: [Employee] { get }
    func hire(person: Person) throws
    func fire(employee: Employee) throws
    func warn(employee: Employee, _ type: WarningType)
    func isEmployer(of person: Person) -> Bool
}
