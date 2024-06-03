//
//  BankOfWakanda.swift
//  BrandBook
//
//  Created by Vato Kostava on 03.05.24.
//  Copyright © 2024 BOG. All rights reserved.
//

import Foundation

class BankOfWakanda: Bank {
    
    private let hrDepartment: HRDepartment
    private let itAdministration: ITAdministation
    private let financialDepartment: FinancialDepartment
    let parkingLot: ParkingLot
    
    var clients: [Client] = []
    
    var personnel: [Employee] {
        hrDepartment.employees
    }
    
    init(
        hrDepartment: HRDepartment,
        itAdministration: ITAdministation,
        financialDepartment: FinancialDepartment,
        parkingLot: ParkingLot
    ) {
        self.hrDepartment = hrDepartment
        self.itAdministration = itAdministration
        self.financialDepartment = financialDepartment
        self.parkingLot = parkingLot
    }
    
}

// MARK: Organization Services
extension BankOfWakanda {
    
    func hire(person: Person) throws {
        try hrDepartment.hire(person: person)
        if let car = person.car {
            itAdministration.register(car: car)
        }
    }
    
    func fire(employee: Employee) throws {
        try hrDepartment.fire(employee: employee)
        if let car = employee.car {
            itAdministration.remove(car: car)
        }
    }
    
    func warn(employee: Employee, _ type: WarningType) {
        hrDepartment.warn(employee: employee, type)
    }
    
    func isEmployer(of person: Person) -> Bool {
        personnel.contains(where: { $0.personalNumber == person.personalNumber })
    }
    
}

// MARK: Banking Services
extension BankOfWakanda {
    
    func register(client: Client) throws {
        guard !isClient(client) else {
            throw RegistrationError.alreadyRegistered
        }
        clients.append(client)
        financialDepartment.openAccount(for: client)
    }
    
    func isClient(_ client: Client) -> Bool {
        return clients.contains(where: { $0.clientId == client.clientId })
    }
    
    func account(of client: Client) -> Account? {
        financialDepartment.account(of: client)
    }
    
    func transfer(amount: Double, from sourceClient: Client, to destinationClient: Client) throws {        
        guard isClient(sourceClient), isClient(destinationClient) else {
            throw TransferError.noSuchClients
        }
        
        let sourceAccount = financialDepartment.account(of: sourceClient)
        let destinationAccount = financialDepartment.account(of: destinationClient)
        
        do {
            try sourceAccount?.withdraw(amount: amount)
        } catch {
            throw TransferError.insufficientAmountOnSourceAccount
        }
        destinationAccount?.deposit(amount: amount)
    }
    
    func deposit(amount: Double, to client: Client) throws {
        guard isClient(client) else {
            throw DepositError.noSuchClient
        }
        financialDepartment.account(of: client)?.deposit(amount: amount)
    }
    
}

extension BankOfWakanda {
    
    enum RegistrationError: Error {
        case alreadyRegistered
    }
    
    enum TransferError: Error {
        case insufficientAmountOnSourceAccount
        case noSuchClients
    }
    
    enum DepositError: Error {
        case noSuchClient
    }
    
}
