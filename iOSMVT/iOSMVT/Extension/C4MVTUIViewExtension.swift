//
//  C4MVTUIViewExtension.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/9/11.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

extension UIView {

    func c4mvt_layoutHeight() -> CGFloat {
        return systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
    }

    func c4mvt_layoutWidth() -> CGFloat {
        return systemLayoutSizeFitting(UILayoutFittingCompressedSize).width
    }

}
