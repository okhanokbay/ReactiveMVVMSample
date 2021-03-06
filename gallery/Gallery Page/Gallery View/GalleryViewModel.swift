//
//  GalleryViewModel.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import Foundation

import Moya

import ReactiveKit
import Bond

import ObjectMapper

final class GalleryViewModel {
	
	private let disposeBag: DisposeBag
	
	// Injectable
	public var collectionViewModels: Observable<[CollectionViewModel]>
	
	// Consumed by View Controller
	public var errorMessage: Observable<String>?
	
	init (collectionViewModels: [CollectionViewModel]) {
		
		disposeBag = DisposeBag()
		self.collectionViewModels = Observable(collectionViewModels)
		
		getTopStories()
	}
}

extension GalleryViewModel {
	
	private func getTopStories () {
		MoyaProvider<NewYorkTimesAPI>().request(.topStories(.home)) { [weak self] result in
			guard let strongSelf = self else { return }
			
			do {
				let response = try result.dematerialize()
				let responseJSONString = try response.mapString()
				let deserializedResponse = Mapper<TopStoriesResponse>().map(JSONString: responseJSONString)
				strongSelf.collectionViewModels.value = TopStoriesResponseMapping.map(deserializedResponse)

			} catch {
				let printableError = error as CustomStringConvertible
				strongSelf.errorMessage?.value = printableError.description
			}
		}
	}
}




