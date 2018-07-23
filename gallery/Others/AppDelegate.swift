//
//  AppDelegate.swift
//  gallery
//
//  Created by Okhan on 21.07.2018.
//  Copyright © 2018 okhanokbay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		let homeViewModel = HomeViewModel()
		let homeViewController = HomeViewController(viewModel: homeViewModel)
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.backgroundColor = UIColor.white
		
		window?.rootViewController = UINavigationController.init(rootViewController: homeViewController)
		window?.makeKeyAndVisible()
		
		return true
	}
}

