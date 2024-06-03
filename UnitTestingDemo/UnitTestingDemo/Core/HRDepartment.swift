//
//  HRDepartment.swift
//  BrandBook
//
//  Created by Vato Kostava on 03.05.24.
//  Copyright © 2024 BOG. All rights reserved.
//

import Foundation

class HRDepartment: Department {
    
    private var warnings: [String: WarningType] = [:]
    var employees: [Employee] = []

    private let personBackgroundChecker: PersonBackgroundChecker
    
    init(personBackgroundChecker: PersonBackgroundChecker) {
        self.personBackgroundChecker = personBackgroundChecker
    }
    
    func hire(person: Person) throws {
        guard !employees.contains(where: { $0.personalNumber == person.personalNumber }) else {
            throw RejectionReason.alreadyHired
        }
        guard !person.personalNumber.isEmpty, !person.name.isEmpty, !person.surname.isEmpty else {
            throw RejectionReason.noDataAboutPerson
        }
        guard personBackgroundChecker.passesBackgroundCheck(person) else {
            throw RejectionReason.badPerson
        }
        guard !employees.contains(where: { $0.surname == person.surname }) else {
            throw RejectionReason.conflictOfInterests
        }
        
        let newEmployee = SoftwareDeveloper(
            employeeId: UUID().uuidString,
            personalNumber: person.personalNumber,
            name: person.name,
            surname: person.surname,
            car: person.car
        )
        employees.append(newEmployee)
    }
    
    func fire(employee: Employee) throws {
        guard warnings.contains(where: { $0.key == employee.employeeId }) else {
            throw FiringError.employeeMustHaveAWarning
        }
        
        employees.removeAll(where: { $0.employeeId == employee.employeeId })
    }
    
    func warn(employee: Employee, _ type: WarningType) {
        if warnings[employee.employeeId] != nil {
            try? fire(employee: employee)
        } else {
            warnings[employee.employeeId] = type
        }
    }
    
}

extension HRDepartment {
    
    struct ScreeningTeam: PersonBackgroundChecker {
        
        func passesBackgroundCheck(_ person: Person) -> Bool {
            return true
        }
        
    }
    
}

extension HRDepartment {
    
    enum RejectionReason: Error {
        case alreadyHired
        case noDataAboutPerson
        case conflictOfInterests
        case badPerson
    }
    
}

extension HRDepartment {
    
    enum FiringError: Error {
        case employeeMustHaveAWarning
    }
    
}
