//
//  AroundOfficeParkingLot.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

class AroundOfficeParkingLot: ParkingLot {
    
    var currentNumberOfCars: Int = .zero
    private let capacity: Int
    private let carPark: CarPark!
    
    required init(capacity: Int) {
        self.capacity = capacity
        self.carPark = nil
    }
    
    init(capacity: Int, carPark: CarPark) {
        self.capacity = capacity
        self.carPark = carPark
    }
    
    func enter(with car: Car) throws {
        guard carPark.isRegistered(car: car) else {
            throw EntranceRejectionReason.unknownCar
        }
        guard currentNumberOfCars + 1 <= capacity else {
            throw EntranceRejectionReason.noEmptySpace
        }
        currentNumberOfCars = min(currentNumberOfCars + 1, capacity)
    }
    
    func leave() {
        currentNumberOfCars = max(currentNumberOfCars - 1, .zero)
    }
    
}

extension AroundOfficeParkingLot {
    
    enum EntranceRejectionReason: Error {
        case unknownCar
        case noEmptySpace
    }
    
}
