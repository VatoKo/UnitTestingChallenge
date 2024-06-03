//
//  Person.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

protocol Person {
    var personalNumber: String { get }
    var name: String { get }
    var surname: String { get }
    var car: Car? { get }
}
