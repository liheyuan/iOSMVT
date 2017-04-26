//
//  C4MVTUIViewControllerExtension.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/5.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

extension UIViewController {

    func c4mvt_wrapInNavigationController() -> UINavigationController {
        return C4MVTNavigationController(rootViewController: self)
    }
}
