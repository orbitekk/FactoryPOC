//
//  ModularContainer.swift
//  FactoryPoc
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import Factory
import Account
import Listing
import AccountLogic
import Networking

class ModularContainer: ManagedContainer {
    public let manager: ContainerManager = {
        let container = ContainerManager()
        container.defaultScope = .cached
        return container
    }()
}

extension ModularContainer {
    var listing: Factory<ListingContainer> {
        return Factory(self) {
            return ListingContainer(accountLogicContainer: self.accountLogic())
        }
    }

    var account: Factory<AccountContainer> {
        return Factory(self) {
            return AccountContainer(accountLogicContainer: self.accountLogic())
        }
    }

    var accountLogic: Factory<AccountLogicContainer> {
        return Factory(self) {
            return AccountLogicContainer(networkContainer: self.networking())
        }
    }

    var networking: Factory<NetworkingContainer> {
        return Factory(self) {
            return NetworkingContainer()
        }
    }
}
