//
//  C4MVTUIView.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/28.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit

class C4MVTUIView: UIView, C4MVTBaseApiAnimatingTarget {
    func startAnimating() {
        makeToastActivity(.center)
    }

    func stopAnimating() {
        hideToastActivity()
    }
}
