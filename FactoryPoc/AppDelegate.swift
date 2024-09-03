//
//  AppDelegate.swift
//  FactoryPoc
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import UIKit
import Listing
import Account
import AccountLogic
import Networking
import Factory

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let (listingViewController, accountViewController) = manual()
//        let (listingViewController, accountViewController) = shared()
//        let (listingViewController, accountViewController) = app()
//        let (listingViewController, accountViewController) = modular()

        listingViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        accountViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)

        let window = UIWindow()
        self.window = window

        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false

        tabBarController.viewControllers = [
            listingViewController,
            accountViewController
        ]

        window.rootViewController = tabBarController

        window.makeKeyAndVisible()

        return true
    }

    private func manual() -> (ListingViewController, AccountViewController) {
        // DATA

        let endpoint = AccountEndpoint()

        // LOGIC

        let useCase = GetAccountUseCase(endpoint: endpoint)

        // LISTING

        let listingViewController = ListingViewController(useCase: useCase)

        // ACCOUNT

        let accountViewController = AccountViewController(useCase: useCase)

        return (listingViewController, accountViewController)
    }

    private func shared() -> (ListingViewController, AccountViewController) {
        // LISTING
        let listingViewController = Container.shared.listingViewController()

        // ACCOUNT
        let accountViewController = Container.shared.accountViewController()

        return (listingViewController, accountViewController)
    }

    private func app() -> (ListingViewController, AccountViewController) {
        let appContainer = AppContainer()

        // LISTING
        let listingViewController = appContainer.listingViewController()

        // ACCOUNT
        let accountViewController = appContainer.accountViewController()

        return (listingViewController, accountViewController)
    }

    private func modular() -> (ListingViewController, AccountViewController) {
        let appContainer = ModularContainer()

        // LISTING
        let listingViewController = appContainer.listing().listingViewController()

        // ACCOUNT
        let accountViewController = appContainer.account().accountViewController()

        return (listingViewController, accountViewController)
    }
}

