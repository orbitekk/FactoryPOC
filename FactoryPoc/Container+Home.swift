//
//  Container+Home.swift
//  FactoryPoc
//
//  Created by Norbert Sroczyński on 04/09/2024.
//

import Factory
import Home
import AccountLogic

//extension Container: HomeDependencyProviding {
//    public var getAccountUseCase: Factory<Home.GetAccountUseCaseProtocol> {
//        return GetAccountUseCase(endpoint: self.accountEndpoint())
//    }
//}

class InversionContainer: ManagedContainer {
    public let manager = ContainerManager()
}

extension InversionContainer: HomeDependencyProviding {
    var getAccountUseCase: Factory<Home.GetAccountUseCaseProtocol> {
        return Factory(self) {
            return GetAccountUseCase(endpoint: Container.shared.accountEndpoint())
        }
    }
}

extension GetAccountUseCase: Home.GetAccountUseCaseProtocol {
    public func get() -> Home.Account {
        return Home.Account(name: "AAA")
    }
}
