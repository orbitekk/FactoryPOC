//
//  ListingContainer.swift
//  Listing
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import Factory
import AccountLogic

public class ListingContainer: ManagedContainer {
    public let manager = ContainerManager()

    private let accountLogicContainer: AccountLogicContainer

    public init(accountLogicContainer: AccountLogicContainer) {
        self.accountLogicContainer = accountLogicContainer
    }
}

extension ListingContainer {
    public var listingViewController: Factory<ListingViewController> {
        return Factory(self) {
            return ListingViewController(useCase: self.accountLogicContainer.getAccountUseCase())
        }
    }
}
