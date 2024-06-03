//
//  ITAdministation.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

class ITAdministation: Department {

    private let carPark: CarPark
    
    init(carPark: CarPark) {
        self.carPark = carPark
    }
    
    func register(car: Car) {
        carPark.register(car: car)
    }
    
    func remove(car: Car) {
        carPark.remove(car: car)
    }
    
}
