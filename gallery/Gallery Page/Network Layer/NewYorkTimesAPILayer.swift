//
//  APILayer.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import Foundation

import Moya

fileprivate let url = "https://api.nytimes.com/svc"
fileprivate let topStoriesAPIPath = "/topstories"
fileprivate let apiVersion = "/v2"
fileprivate let responseFormat = ".json"

fileprivate let apiKey = API_KEY_HERE

public enum TopStorySection: String {
	// We can write all categories here as a new case.
	// world, opinion, technology...
	case home = "/home"
}

public enum NewYorkTimesAPI {
	// We can write all API names here as a new case.
	// article search, archive, books...
	case topStories(TopStorySection)
}

extension NewYorkTimesAPI: TargetType {
	public var baseURL: URL { return URL(string: url)! }
	
	public var path: String {
		switch self {
		case .topStories(let category):
			// Using rawValue prevents adding another switch - case.
			return topStoriesAPIPath + apiVersion + category.rawValue + responseFormat
		}
	}
	
	public var method: Moya.Method {
		return .get
	}
	
	// Sample data not added since there are no tests in this sample project.
	public var sampleData: Data {
		return "".data(using: .utf8)!
	}
	
	public var task: Task {
		return .requestPlain
	}
	
	public var headers: [String: String]? {
		return ["api-key": apiKey]
	}
}


