//
//  CarPark.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

protocol CarPark {
    var cars: [Car] { get }
    func register(car: Car)
    func remove(car: Car)
    func isRegistered(car: Car) -> Bool
}
