//
//  ViewController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/5.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class ViewController: C4MVTBaseController {

    static fileprivate var count: Int = 0

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navBarType = .normal
        ViewController.count += 1
        navBarTitle = "Title \(ViewController.count)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

