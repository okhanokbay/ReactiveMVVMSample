//
//  GalleryResponse.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import Foundation

import ObjectMapper

struct TopStoriesResponse: Mappable {
	
	// Here, we can map other properties of the response JSON
	// Currently it has only the required fields mapped.
	var results: [Story]?
	
	init?(map: Map) {}
	
	mutating func mapping(map: Map) {
		results <- map["results"]
	}
}

struct Story: Mappable {
	
	// Here, we can map other properties of the response JSON
	// Currently it has only the required fields mapped.
	var multiMedia: [GalleryMedia]?
	
	init?(map: Map) {}
	
	mutating func mapping(map: Map) {
		multiMedia <- map["multimedia"]
	}
}

struct GalleryMedia: Mappable {

	// Here, we can map other properties of the response JSON
	// Currently it has only the required fields mapped.
	var mediaURL: String?
	var format: String?
	
	init?(map: Map) {}
	
	mutating func mapping(map: Map) {
		mediaURL <- map["url"]
		format <- map["format"]
	}
}
