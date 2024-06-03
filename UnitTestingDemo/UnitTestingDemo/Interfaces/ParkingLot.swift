//
//  ParkingLot.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

protocol ParkingLot {
    var currentNumberOfCars: Int { get }
    init(capacity: Int)
    func enter(with car: Car) throws
    func leave()
}
