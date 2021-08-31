//
//  StretchyHeaderTableViewCell.swift
//  StretchyHeaderPractice
//
//  Created by 松島悠人 on 2021/08/31.
//

import UIKit

final class StretchyHeaderTableViewCell: UITableViewCell {

    @IBOutlet private weak var headerImageView: UIImageView!
    
    static var className: String {
        return String(describing: self)
    }

    static var idetifier: String {
        return className
    }

    static func nib() -> UINib {
        return UINib(nibName: idetifier, bundle: nil)
    }

    func configure(headerImageUrl: String) {
        headerImageView.image = UIImage(named: headerImageUrl)
    }
}
