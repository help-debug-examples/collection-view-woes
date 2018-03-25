//
//  CarouselViewController.swift
//  collection-view-woes
//
//  Created by Derrick Showers on 3/23/18.
//  Copyright © 2018 Derrick Showers. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var people = [Person]() {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup

    private func setup() {

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: String(describing: CarouselCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CarouselCell.self))
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = CGSize(width: 25, height: 25)
    }

    // MARK: - Private Methods

    private func calculateCellHeight() -> CGFloat {

        let collectionViewHeight = collectionView.frame.height
        guard let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGFloat.leastNonzeroMagnitude
        }

        let collectionViewVerticalInsets = collectionViewLayout.sectionInset.top + collectionViewLayout.sectionInset.bottom
        let cellHeight = collectionViewHeight - collectionViewVerticalInsets

        return cellHeight
    }
}

extension CarouselViewController: UICollectionViewDelegate {

}

extension CarouselViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CarouselCell.self), for: indexPath) as? CarouselCell else {
            return UICollectionViewCell()
        }

        cell.textLabel.text = people[indexPath.row].name
        cell.updateHeight(newHeight: calculateCellHeight())
        return cell
    }
}
