//
//  LoadingViewController.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import UIKit

final class LoadingViewController: UIViewController {

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(indicator)
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    /*
      child view controllers get access to the exact same events as their parent view controller (things like viewDidLoad, viewWillAppear, etc), without having to be a subclass of it.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.activityIndicator.startAnimating()
    }
}
