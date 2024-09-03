//
//  GetAccountUseCase.swift
//  AccountLogic
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import Foundation
import Networking

public class GetAccountUseCase {
    private let endpoint: AccountEndpointProtocol

    public init(endpoint: AccountEndpointProtocol) {
        self.endpoint = endpoint
    }
}

extension GetAccountUseCase: GetAccountUseCaseProtocol {
    public func get() -> Account {
        return Account(name: endpoint.get())
    }
}
