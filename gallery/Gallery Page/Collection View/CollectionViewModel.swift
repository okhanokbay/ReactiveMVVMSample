//
//  CollectionViewModel.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import Foundation

enum MediaQuality: String {
	
	case veryLow = "Standard Thumbnail"
	case low = "thumbLarge"
	case normal = "Normal"
	case high = "mediumThreeByTwo210"
	case veryHigh = "superJumbo"
}

let desiredMediaQuality: MediaQuality = .normal

struct CollectionViewModel {

	var mediaURL: URL
	var format: MediaQuality
	
	init(mediaURL: String?, format: String?) {
		
		self.mediaURL = URL(string: mediaURL!)!
		self.format = MediaQuality(rawValue: format!)!
	}
}
