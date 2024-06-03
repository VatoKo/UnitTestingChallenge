//
//  PersonBackgroundChecker.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

protocol PersonBackgroundChecker {
    func passesBackgroundCheck(_ person: Person) -> Bool
}
