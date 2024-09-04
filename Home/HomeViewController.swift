//
//  HomeViewController.swift
//  Home
//
//  Created by Norbert Sroczyński on 04/09/2024.
//

import UIKit

public class HomeViewController: UIViewController {
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
