//
//  FinancialDepartment.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 04.05.24.
//

import Foundation

class FinancialDepartment: Department {

    private var clientAccounts: [String: Account] = [:]
    
    func openAccount(for client: Client) {
        clientAccounts[client.clientId] = StandardAccount()
    }
    
    func account(of client: Client) -> Account? {
        return clientAccounts[client.clientId]
    }
    
}
