//
//  AccountContainer.swift
//  Account
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import Factory
import AccountLogic

public class AccountContainer: ManagedContainer {
    public let manager = ContainerManager()

    private let accountLogicContainer: AccountLogicContainer

    public init(accountLogicContainer: AccountLogicContainer) {
        self.accountLogicContainer = accountLogicContainer
    }
}

extension AccountContainer {
    public var accountViewController: Factory<AccountViewController> {
        return Factory(self) {
            return AccountViewController(useCase: self.accountLogicContainer.getAccountUseCase())
        }
    }
}
