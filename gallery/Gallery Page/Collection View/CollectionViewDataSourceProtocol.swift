//
//  CollectionViewDataSourceProtocol.swift
//  gallery
//
//  Created by Okhan on 23.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import Foundation

protocol CollectionViewDataSourceProtocol: class {
	var columnCount: Int { get }
	var collectionViewModels: [CollectionViewModel] { get set }
}
