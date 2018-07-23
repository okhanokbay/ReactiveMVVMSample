//
//  CollectionViewCell.swift
//  gallery
//
//  Created by Okhan on 23.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
	
	var image: UIImageView
	
	override init(frame: CGRect) {
		
		image = UIImageView(frame: .zero)
		image.contentMode = .scaleAspectFill
		image.clipsToBounds = true
		
		super.init(frame: frame)
		
		image.frame = contentView.frame
		contentView.addSubview(image)
		contentView.backgroundColor = .clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(url: URL) {
		image.kf.setImage(with: url)
	}
}
