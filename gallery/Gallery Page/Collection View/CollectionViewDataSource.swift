//
//  CollectionViewDataSource.swift
//  gallery
//
//  Created by Okhan on 23.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource, CollectionViewDataSourceProtocol {
	
	let columnCount = 3
	var collectionViewModels: [CollectionViewModel]
	
	private var sectionCount: Int {
		get {
			return Int(ceil(Double(collectionViewModels.count) / Double(columnCount)))
		}
	}
	
	override init() {
		collectionViewModels = []
		super.init()
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return sectionCount
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return section == sectionCount - 1 ? collectionViewModels.count % columnCount : columnCount
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
		cell.configure(url: collectionViewModels[indexPath.section * columnCount + indexPath.item].mediaURL)
		return cell
	}
}
