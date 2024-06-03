//
//  StandardAccount.swift
//  BrandBook
//
//  Created by Vato Kostava on 03.05.24.
//  Copyright © 2024 BOG. All rights reserved.
//

import Foundation

class StandardAccount: Account {
    
    let accountNumber: String = UUID().uuidString
    var balance: Double = .zero
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) throws {
        guard amount <= balance else {
            throw WithdrawalError.insufficientBalance
        }
        balance -= amount
    }
    
}

extension StandardAccount {
    
    enum WithdrawalError: Error {
        case insufficientBalance
    }
    
}
