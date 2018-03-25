//
//  UIView+.swift
//  collection-view-woes
//
//  Created by Derrick Showers on 3/23/18.
//  Copyright © 2018 Derrick Showers. All rights reserved.
//

import UIKit

extension UIView {

    private enum Edge {
        case top, bottom, left, right
    }

    func addAsSubviewAndPinEdges(toContainer view: UIView) {

        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        if let superview = superview {
            pinEdgesToEdges(ofView: superview)
        }
    }

    private func pinEdgesToEdges(ofView view: UIView, excludeEdges: [Edge]? = nil) {

        var constraints = [NSLayoutConstraint]()

        if !(excludeEdges?.contains(.top) == true) {
            constraints.append(topAnchor.constraint(equalTo: view.topAnchor))
        }
        if !(excludeEdges?.contains(.left) == true) {
            constraints.append(leadingAnchor.constraint(equalTo: view.leadingAnchor))
        }
        if !(excludeEdges?.contains(.bottom) == true) {
            constraints.append(bottomAnchor.constraint(equalTo: view.bottomAnchor))
        }
        if !(excludeEdges?.contains(.right) == true) {
            constraints.append(trailingAnchor.constraint(equalTo: view.trailingAnchor))
        }
        NSLayoutConstraint.activate(constraints)
    }
}
