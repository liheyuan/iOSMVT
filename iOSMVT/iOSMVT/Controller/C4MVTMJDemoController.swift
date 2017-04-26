//
//  C4MVTMJDemoController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/25.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit
import SnapKit
import MJRefresh

class C4MVTMJDemoController: C4MVTBaseController {

    // MARK: - Property
    fileprivate var lines: Int = 20

    override var navBarTitle: String {
        return "MJ Demo"
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
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self,
                                                        refreshingAction: #selector(loadMore))
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self,
                                                    refreshingAction: #selector(refresh))
    }

    fileprivate func render() {
        loadingSuccess()
    }

    override func loading() {
        // fake loading success
        render()
    }
    
}

// MARK: - Refresh & Auto load
extension C4MVTMJDemoController {
    func loadMore() {
        lines += 20
        tableView.reloadData()
        guard let mjFooter = tableView.mj_footer else {
            return
        }
        if lines >= 100 {
            mjFooter.endRefreshingWithNoMoreData()
        } else {
            mjFooter.endRefreshing()
        }
    }

    func refresh() {
        lines = 20
        tableView.reloadData()

        guard let mjHeader = tableView.mj_header else {
            return
        }
        mjHeader.endRefreshing()

        guard let mjFooter = tableView.mj_footer else {
            return
        }
        mjFooter.resetNoMoreData()
    }
}

// MARK: - UITableViewDataSource
extension C4MVTMJDemoController: UITableViewDataSource {
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines
    }

}

// MARK: - UITableViewDelegate
extension C4MVTMJDemoController: UITableViewDelegate {

}
