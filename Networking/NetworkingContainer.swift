//
//  NetworkingContainer.swift
//  Networking
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import Factory

public class NetworkingContainer: ManagedContainer {
    public let manager = ContainerManager()

    public init() {}
}

extension NetworkingContainer {
    public var accountEndpoint: Factory<AccountEndpointProtocol> {
        return Factory(self) {
            return AccountEndpoint()
        }
    }
}
