//
//  ViewController.swift
//  collection-view-woes
//
//  Created by Derrick Showers on 3/23/18.
//  Copyright © 2018 Derrick Showers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carouselContainerView: UIView!

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
        setupCarousel()
        loadData()
    }

    // MARK: - Setup

    private func setupCarousel() {

        carouselContainerView.isHidden = true
        let carouselViewControllerStoryboard = UIStoryboard(name: "CarouselViewController", bundle: nil)
        if let carouselViewController = carouselViewControllerStoryboard.instantiateInitialViewController() {
            addChildViewController(carouselViewController)
            carouselViewController.view.addAsSubviewAndPinEdges(toContainer: carouselContainerView)
            carouselViewController.didMove(toParentViewController: self)
        }
    }

    // MARK: - Data

    private func loadData() {

        guard let carouselViewController = childViewControllers.filter({ $0 is CarouselViewController }).first as? CarouselViewController else {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.carouselContainerView.isHidden = false
            carouselViewController.people = PersonFactory.createPeople(amount: 10)
        }
    }
}

