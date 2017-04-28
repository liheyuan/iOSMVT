//
//  C4MVTNavigationController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/26.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit

class C4MVTNavigationController: UINavigationController {

    // MARK: - Property
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.visibleViewController?.supportedInterfaceOrientations ?? .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return self.visibleViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension C4MVTNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        let isRoot = ( viewController == navigationController.viewControllers.first )
        var enable = !isRoot
        if enable {
            if let vc = viewController as? C4MVTBaseController {
                enable = vc.needPopGesture
            }
        }
        if enable {
            navigationController.interactivePopGestureRecognizer?.isEnabled = !isRoot
            navigationController.interactivePopGestureRecognizer?.delegate = self
        } else {
            navigationController.interactivePopGestureRecognizer?.isEnabled = false
            navigationController.interactivePopGestureRecognizer?.delegate = nil
        }
    }

}

extension C4MVTNavigationController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}
