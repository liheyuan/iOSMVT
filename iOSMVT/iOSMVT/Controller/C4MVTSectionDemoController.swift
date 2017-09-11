//
//  C4MVTSectionDemoController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/9/11.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit
import FDTemplateLayoutCell

class C4MVTSectionDemoController: C4MVTBaseController {
    // MARK: - Property
    fileprivate var lines: Int = 5

    fileprivate var cellIdentifier: String = "cell"

    override var navBarTitle: String {
        return "Section Demo"
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
        tv.separatorStyle = .none
        return tv
    }()

    fileprivate lazy var section1Header: SectionDemoHeaderView = {
        let v =  SectionDemoHeaderView()
        v.bindWith(title: "Section 1")
        return v
    }()

    fileprivate lazy var section2Header: SectionDemoHeaderView = {
        let v =  SectionDemoHeaderView()
        v.bindWith(title: "Section 2")
        return v
    }()

    fileprivate lazy var section3Header: SectionDemoHeaderView = {
        let v =  SectionDemoHeaderView()
        v.bindWith(title: "Section 3")
        return v
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
        let section: Int = indexPath.section
        let id: Int = indexPath.row
        let idStr: String = "\(id)"
        let nameStr: String = "Name \(id) Section \(section)"
        cell.bindWith(id: idStr, name: nameStr, content: mockContent(length: indexPath.row + 1), section: section)
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
extension C4MVTSectionDemoController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        makeToast("Click \(indexPath.row)")
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return section1Header
        case 1:
            return section2Header
        case 2:
            return section3Header
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: cellIdentifier, cacheBy: indexPath, configuration: { (cell) in
            if let cell = cell as? FDDemoCell {
                self.configCell(cell: cell, indexPath: indexPath)
            }
        })
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let sectionView = self.tableView(tableView, viewForHeaderInSection: section) {
            return sectionView.c4mvt_layoutHeight()
        }
        return 0
    }
}

// MARK: - UITableViewDataSource
extension C4MVTSectionDemoController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? FDDemoCell {
            configCell(cell: cell, indexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines
    }


}
