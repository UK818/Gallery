//
//  TabBarCoordinator.swift
//  Gallery
//
//  Created by mac on 04/06/2022.
//

import Foundation
import UIKit

class TabBarCordinator {
	
	static let shared = TabBarController()
	
	private func navigateToExplorePage() -> UINavigationController {
		let exploreViewController = ExploreViewController()
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.explore
		exploreViewController.tabBarItem.image = Constants.Images.explore?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}
	
	private func navigateToCategoryPage() -> UINavigationController {
		let exploreViewController = CategoryViewController()
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.explore
		exploreViewController.tabBarItem.image = Constants.Images.category?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}
	
	private func navigateToSettingsPage() -> UINavigationController {
		let exploreViewController = SettingsViewController()
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.explore
		exploreViewController.tabBarItem.image = Constants.Images.settings?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}
	
}
