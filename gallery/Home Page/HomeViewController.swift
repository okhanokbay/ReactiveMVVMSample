//
//  HomeViewController.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

	private let viewModel: HomeViewModel
	
	init(viewModel: HomeViewModel) {
		
		self.viewModel = viewModel
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	lazy var buttonShowGallery: UIButton = {
		
		let button = UIButton(type: .system)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.setTitle("Show GridView", for: .normal)
		button.addTarget(self, action: #selector(buttonShowGalleryTapped), for: .touchUpInside)
		
		return button
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
	
		navigationItem.title = "GridView Test"
		
		view.addSubview(buttonShowGallery)
		view.setNeedsUpdateConstraints()
    }
}

// MARK: Button Show Gallery Setup
extension HomeViewController {
	
	@objc func buttonShowGalleryTapped() {
		
		let galleryViewModel = viewModel.galleryViewModel
		let collectionViewDataSource = CollectionViewDataSource()
		let galleryViewController = GalleryViewController(viewModel: galleryViewModel, collectionViewDataSource: collectionViewDataSource)
		
		galleryViewController.view.backgroundColor = UIColor.white
		
		navigationController?.pushViewController(galleryViewController, animated: true)
	}
	
	override func updateViewConstraints() {
		buttonConstraints()
		super.updateViewConstraints()
	}
	
	private func buttonConstraints() {
		NSLayoutConstraint(
			item: buttonShowGallery,
			attribute: .centerX,
			relatedBy: .equal,
			toItem: view,
			attribute: .centerX,
			multiplier: 1.0,
			constant: 0.0)
			.isActive = true
		
		NSLayoutConstraint(
			item: buttonShowGallery,
			attribute: .centerY,
			relatedBy: .equal,
			toItem: view,
			attribute: .centerY,
			multiplier: 1.0,
			constant: 0.0)
			.isActive = true
	}
}
