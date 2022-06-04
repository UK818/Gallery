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
    }
	
	private func setUpTabBar() {
		viewControllers = [navigateToExplorePage(), navigateToCategoryPage(), navigateToSettingsPage()]
		self.tabBar.unselectedItemTintColor = UIColor.gray
		tabBar.tintColor = .white
		tabBar.backgroundColor = UIColor(white: 0.3, alpha: 0.4)
	}

	private func navigateToExplorePage() -> UINavigationController {
		let viewLayout = ViewLayout()
		let exploreViewController = ExploreViewController(viewLayout: viewLayout)
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.explore
		exploreViewController.tabBarItem.image = Constants.Images.explore?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}
	
	private func navigateToCategoryPage() -> UINavigationController {
		let exploreViewController = CategoryViewController()
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.category
		exploreViewController.tabBarItem.image = Constants.Images.category?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}
	
	private func navigateToSettingsPage() -> UINavigationController {
		let exploreViewController = SettingsViewController()
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.settings
		exploreViewController.tabBarItem.image = Constants.Images.settings?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}
    
}
