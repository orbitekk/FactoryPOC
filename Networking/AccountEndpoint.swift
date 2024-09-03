//
//  AccountEndpoint.swift
//  Networking
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

public class AccountEndpoint {
    public init() {}
}

extension AccountEndpoint: AccountEndpointProtocol {
    public func get() -> String {
        return "Name"
    }
}
