//
//  UIViewController+ChildViewController.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import UIKit

extension UIViewController {

    func add(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }

    func remove() {
        guard parent != nil else { return }

        view.alpha = 1
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0
        }) { (_) in
            self.willMove(toParentViewController: nil)
            self.removeFromParentViewController()
            self.view.removeFromSuperview()
        }
    }
}
