//
//  AppContainer.swift
//  FactoryPoc
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import Factory
import Account
import Listing
import AccountLogic
import Networking

class AppContainer: ManagedContainer {
    public let manager = ContainerManager()
}

extension AppContainer {
    var listingViewController: Factory<ListingViewController> {
        return Factory(self) {
            return ListingViewController(useCase: self.getAccountUseCase())
        }
    }

    var accountViewController: Factory<AccountViewController> {
        return Factory(self) {
            return AccountViewController(useCase: self.getAccountUseCase())
        }
    }

    var getAccountUseCase: Factory<GetAccountUseCaseProtocol> {
        return Factory(self) {
            return GetAccountUseCase(endpoint: self.accountEndpoint())
        }
    }

    var accountEndpoint: Factory<AccountEndpointProtocol> {
        return Factory(self) {
            return AccountEndpoint()
        }
    }
}
