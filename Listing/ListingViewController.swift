//
//  ListingViewController.swift
//  Listing
//
//  Created by Norbert Sroczyński on 03/09/2024.
//

import UIKit
import AccountLogic

public class ListingViewController: UIViewController {
    private let useCase: GetAccountUseCaseProtocol

    public init(useCase: GetAccountUseCaseProtocol) {
        self.useCase = useCase

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}
