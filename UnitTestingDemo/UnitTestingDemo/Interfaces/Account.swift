//
//  Account.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

protocol Account {
    var accountNumber: String { get }
    var balance: Double { get set }
    func deposit(amount: Double)
    func withdraw(amount: Double) throws
}
