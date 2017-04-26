//
//  C4MVTTabBarController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/5.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class C4MVTTabBarController: UITabBarController {

    // Property
    static let shared: C4MVTTabBarController = C4MVTTabBarController(nibName: nil, bundle: nil)

    override var shouldAutorotate: Bool {
        return self.selectedViewController?.shouldAutorotate ?? false
    }

    // MARK: - Funtions
    fileprivate override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBarControllers()
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupTabBarControllers() {
        let vc1 = C4MVTFirstController()
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "HomeIcon"), selectedImage: nil)

        let vc2 = C4MVTSecondController()
        //let vc2 = C4MVTMJDemoController()
        //let vc2 = C4MVTSecondFormController()
        vc2.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(named: "CameraIcon"), selectedImage: nil)

        let vc3 = C4MVTThirdController()
        vc3.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "SettingIcon"), selectedImage: nil)

        self.tabBar.backgroundImage = UIImage.c4mvt_pureColorImage(color: .UI_navBackground)
        self.tabBar.shadowImage = UIImage.c4mvt_pureColorImage(color: .UI_navBackground)
        self.tabBar.clipsToBounds = true
        self.tabBar.tintColor = UIColor.UI_blue

        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: C4MVTGlobalConst.c4mvt_1PX)
        borderLayer.backgroundColor = UIColor.UI_darkBoundry.cgColor
        self.tabBar.layer.addSublayer(borderLayer)

        self.viewControllers = [vc1.c4mvt_wrapInNavigationController(),
                                vc2.c4mvt_wrapInNavigationController(),
                                vc3.c4mvt_wrapInNavigationController()]
    }

    func addLast() {
        guard let currentViewControllers = self.viewControllers,
            currentViewControllers.count == 3 else {
            return
        }

        var newvcs = Array(currentViewControllers)

        let vc4 = C4MVTFourthController()
        vc4.tabBarItem = UITabBarItem(title: "Crown", image: UIImage(named: "CrownIcon"), selectedImage: nil)

        newvcs.append(vc4.c4mvt_wrapInNavigationController())

        self.viewControllers = newvcs
    }

    func removeLast() {
        guard let currentViewControllers = self.viewControllers,
            currentViewControllers.count == 4 else {
            return
        }

        self.viewControllers?.remove(at: 3)
    }

}

// MARK: - UITabBarControllerDelegate
extension C4MVTTabBarController: UITabBarControllerDelegate {
    func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
        return selectedViewController?.supportedInterfaceOrientations ?? .all
    }

    func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: UITabBarController) -> UIInterfaceOrientation {
        return selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
}
