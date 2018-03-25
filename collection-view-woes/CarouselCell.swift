//
//  CarouselCell.swift
//  collection-view-woes
//
//  Created by Derrick Showers on 3/23/18.
//  Copyright © 2018 Derrick Showers. All rights reserved.
//

import UIKit

class CarouselCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!

    private var heightConstraint: NSLayoutConstraint?

    // MARK: - Lifecycle

    override func awakeFromNib() {

        super.awakeFromNib()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        configureHeightAnchor()
    }

    private func configureHeightAnchor() {

        heightConstraint = contentView.heightAnchor.constraint(equalToConstant: 10)
        heightConstraint?.priority = UILayoutPriority(rawValue: 999.0)
        heightConstraint?.isActive = true
    }

    // MARK: - Public Methods

    func updateHeight(newHeight: CGFloat) {
        heightConstraint?.constant = newHeight
    }
}
