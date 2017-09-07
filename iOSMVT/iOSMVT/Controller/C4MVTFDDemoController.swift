//
//  C4MVTFDDemoController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/9/7.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit
import FDTemplateLayoutCell

class C4MVTFDDemoController: C4MVTBaseController {
    // MARK: - Property
    fileprivate var lines: Int = 20

    override var navBarTitle: String {
        return "FD Demo"
    }

    override var needLoginCover: Bool {
        return false
    }

    override var needRotate: Bool {
        return true
    }

    // MARK: - UI Getter
    fileprivate lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.tableFooterView = UIView()
        return tv
    }()

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // try loading
        tryLoading()
    }

    fileprivate func setupUI() {
        addSubviewToMain(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }

    fileprivate func render() {
        loadingSuccess()
    }

    override func loading() {
        // fake loading success
        render()
    }

}

// MARK: - UITableViewDelegate
extension C4MVTFDDemoController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension C4MVTFDDemoController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines
    }
}
