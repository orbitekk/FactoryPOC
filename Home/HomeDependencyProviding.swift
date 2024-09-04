//
//  HomeDependencyProviding.swift
//  Home
//
//  Created by Norbert Sroczyński on 04/09/2024.
//

import Factory

public protocol HomeDependencyProviding {
    var getAccountUseCase: Factory<GetAccountUseCaseProtocol> { get }
}
