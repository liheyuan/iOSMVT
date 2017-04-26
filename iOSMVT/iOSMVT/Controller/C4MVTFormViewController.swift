//
//  C4MVTFormViewController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/26.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class C4MVTFormViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ButtonRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.textAlignment = .left
            cell.textLabel?.textColor = .UI_darkTextColor
            cell.accessoryType = .disclosureIndicator
        }
        
    }
}
