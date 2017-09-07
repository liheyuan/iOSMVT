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

    fileprivate var cellIdentifier: String = "cell"

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

        tableView.register(FDDemoCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    fileprivate func render() {
        loadingSuccess()
    }

    override func loading() {
        // fake loading success
        render()
    }

    func configCell(cell: FDDemoCell, indexPath: IndexPath) {
        let id: Int = indexPath.row
        let idStr: String = "\(id)"
        let nameStr: String = "Name \(id)"
        cell.bindWith(id: idStr, name: nameStr, content: mockContent(length: indexPath.row + 1))
    }

    func mockContent(length: Int) -> String {
        var output = ""
        for _ in 0..<length {
            output.append("1234567890")
        }
        return output
    }

}

// MARK: - UITableViewDelegate
extension C4MVTFDDemoController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension C4MVTFDDemoController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? FDDemoCell {
            configCell(cell: cell, indexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: cellIdentifier, cacheBy: indexPath, configuration: { (cell) in
            if let cell = cell as? FDDemoCell {
                self.configCell(cell: cell, indexPath: indexPath)
            }
        })
    }
}
