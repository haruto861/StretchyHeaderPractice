//
//  StretchyHeaderViewController.swift
//  StretchyHeaderPractice
//
//  Created by 松島悠人 on 2021/08/31.
//

import UIKit

final class StretchyHeaderViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var lastContentOffset = CGPoint.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(StretchyHeaderTableViewCell.nib(), forCellReuseIdentifier: StretchyHeaderTableViewCell.idetifier)
    }
}

extension StretchyHeaderViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0.0 {
            if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) {
                let deltaY = CGFloat(fabsf(Float(scrollView.contentOffset.y)) - fabsf(Float(lastContentOffset.y)))
                cell.frame = CGRect(x: 0.0, y: scrollView.contentOffset.y, width: cell.frame.size.width, height: cell.frame.size.height + deltaY)
                lastContentOffset = scrollView.contentOffset
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension StretchyHeaderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StretchyHeaderTableViewCell.idetifier) as! StretchyHeaderTableViewCell
        cell.configure(headerImageUrl: "curry")
        return cell
    }
}
