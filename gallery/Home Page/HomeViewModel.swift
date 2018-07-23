//
//  HomeViewModel.swift
//  gallery
//
//  Created by Okhan on 22.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import Foundation

final class HomeViewModel {
	
	lazy var galleryViewModel: GalleryViewModel = {
		return GalleryViewModel(collectionViewModels: [])
	}()
	
}
