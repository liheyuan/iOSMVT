//
//  C4MVTLoadingView.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/27.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit
import FLAnimatedImage

class C4MVTLoadingView: UIView {

    // MARK: - UI Getter
    fileprivate lazy var loadingImageView: UIImageView = {
        let iv = FLAnimatedImageView()
        if let gifPath: String = Bundle.main.path(forResource: "Loading", ofType: "gif"),
            let gifData: Data = (try? Data(contentsOf: URL(fileURLWithPath: gifPath))) {
            iv.animatedImage = FLAnimatedImage(animatedGIFData: gifData)
        }
        return iv
    }()

    // MARK: - Funtions
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    fileprivate func setupUI() {
        backgroundColor = UIColor.UI_background

        addSubview(loadingImageView)

        loadingImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
    }
}
