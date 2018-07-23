//
//  GalleryViewController.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import UIKit

import ReactiveKit
import Bond

final class GalleryViewController: UIViewController {

	private var disposeBag: DisposeBag
	private var viewModel: GalleryViewModel
	
	private var collectionView: UICollectionView
	private var collectionViewDataSource: (CollectionViewDataSourceProtocol & UICollectionViewDataSource)
	
	init(viewModel: GalleryViewModel, collectionViewDataSource: (CollectionViewDataSourceProtocol & UICollectionViewDataSource)) {
		
		disposeBag = DisposeBag()
		
		self.viewModel = viewModel
		self.collectionViewDataSource = collectionViewDataSource
		self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		self.collectionView.dataSource = collectionViewDataSource
		
		super.init(nibName: nil, bundle: nil)
		
		bindViewModel()
		setupCollectionView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Gallery"
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension GalleryViewController {
	
	private func bindViewModel() {
		
		viewModel.collectionViewModels.observeNext { [weak self] (viewModels: [CollectionViewModel]) in
			guard let strongSelf = self else { return }
			
			strongSelf.collectionViewDataSource.collectionViewModels = viewModels
			strongSelf.collectionView.reloadData()
			
			}.dispose(in: disposeBag)
		
		viewModel.errorMessage?.observeNext(with: { [weak self] (message: String) in
			guard let strongSelf = self else { return }
			
			strongSelf.showError(errorMessage: message)
			
		}).dispose(in: disposeBag)
	}
}

extension GalleryViewController {
	func setupCollectionView() {
		
		collectionView.backgroundColor = .white
		view.addSubview(collectionView)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		
		let spacing: CGFloat = 4
		let columns = collectionViewDataSource.columnCount
		let collectionViewSide = (view.bounds.width - (spacing * CGFloat(columns + 1))) / CGFloat(columns)
		// This formula should work for every column count
		
		layout.itemSize = CGSize(width: collectionViewSide, height: collectionViewSide)
		layout.sectionInset = UIEdgeInsets(top: spacing, left: 0, bottom: 0, right: 0)
		layout.minimumInteritemSpacing = spacing
		layout.minimumLineSpacing = spacing
		collectionView.collectionViewLayout = layout
		
		let collectionViewInsets = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
		collectionView.contentInset = collectionViewInsets
		collectionView.scrollIndicatorInsets = UIEdgeInsets(top: collectionViewInsets.top, left: 0, bottom: collectionViewInsets.bottom, right: 0)
		
		collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
	}
}

extension GalleryViewController {
	private func showError(errorMessage: String) {
		let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}
}
