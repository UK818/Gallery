//
//  TabBarViewController.swift
//  Gallery
//
//  Created by mac on 03/06/2022.
//

import UIKit

class TabBarController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
		setUpTabBar()
		setTabbarOpacity()
    }
	
	private func setUpTabBar() {
		viewControllers = [navigateToExplorePage(), navigateToCategoryPage(), navigateToSettingsPage()]
		self.tabBar.unselectedItemTintColor = UIColor.white
		tabBar.tintColor = .white
	}
	
	private func setTabbarOpacity() {
		let transperentBlackColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.75)
		let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
		UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
		transperentBlackColor.setFill()
		UIRectFill(rect)
		
		if let image = UIGraphicsGetImageFromCurrentImageContext() {
			tabBar.backgroundImage = image
		}
		UIGraphicsEndImageContext()
	}

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
