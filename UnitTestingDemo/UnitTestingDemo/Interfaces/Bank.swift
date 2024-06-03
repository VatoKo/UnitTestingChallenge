//
//  Bank.swift
//  UnitTestingDemo
//
//  Created by Vato Kostava on 03.05.24.
//

import Foundation

protocol Bank: Organization, ParkingSpaceProvider {
    var clients: [Client] { get }
    func register(client: Client) throws
    func isClient(_ client: Client) -> Bool
    func account(of client: Client) -> Account?
    func transfer(amount: Double, from sourceClient: Client, to destinationClient: Client) throws
    func deposit(amount: Double, to client: Client) throws
}
