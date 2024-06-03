//
//  BOWCarPark.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

class BOWCarPark: CarPark {
    
    var cars: [Car]
    
    init() {
        self.cars = []
    }
    
    func register(car: Car) {
        cars.append(car)
    }
    
    func remove(car: Car) {
        cars.removeAll(where: { $0.numberPlate == car.numberPlate })
    }
    
    func isRegistered(car: Car) -> Bool {
        return cars.contains(where: { $0.numberPlate == car.numberPlate })
    }
    
}
