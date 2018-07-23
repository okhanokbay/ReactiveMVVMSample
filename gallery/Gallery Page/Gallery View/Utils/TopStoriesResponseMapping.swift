//
//  ResponseMappingUtil.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import Foundation

final class TopStoriesResponseMapping {
	
	static func map(_ topStories: TopStoriesResponse?) -> [CollectionViewModel] {
	
		return topStories?
			.results?
			.filter{$0.multiMedia?.count ?? 0 > 0} // Filter results for the sake of the example.
			.map({ (story: Story) -> CollectionViewModel in
			
				let desiredMedia = story.multiMedia!.filter({ (media: GalleryMedia) -> Bool in
					return media.format == desiredMediaQuality.rawValue // CollectionViewModel decides the desired format.
				}).first
			
				return CollectionViewModel(mediaURL: desiredMedia?.mediaURL, format: desiredMedia?.format)
			
		}) ?? []
	}
}
