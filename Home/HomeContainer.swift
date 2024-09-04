//
//  HomeContainer.swift
//  Home
//
//  Created by Norbert Sroczyński on 04/09/2024.
//

import Factory

public class HomeContainer: ManagedContainer {
    public let manager = ContainerManager()

    private let homeDependencyProviding: HomeDependencyProviding

    public init(homeDependencyProviding: HomeDependencyProviding) {
        self.homeDependencyProviding = homeDependencyProviding
    }
}

extension HomeContainer {
    public var homeViewController: Factory<HomeViewController> {
        return Factory(self) {
            return HomeViewController(useCase: self.homeDependencyProviding.getAccountUseCase())
        }
    }
}
