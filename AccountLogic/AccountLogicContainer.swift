//
//  AccountLogicContainer.swift
//  AccountLogic
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import Factory
import Networking

public class AccountLogicContainer: ManagedContainer {
    public let manager = ContainerManager()

    private let networkContainer: NetworkingContainer

    public init(networkContainer: NetworkingContainer) {
        self.networkContainer = networkContainer
    }
}

extension AccountLogicContainer {
    public var getAccountUseCase: Factory<GetAccountUseCaseProtocol> {
        return Factory(self) {
            return GetAccountUseCase(endpoint: self.networkContainer.accountEndpoint())
        }
    }
}
