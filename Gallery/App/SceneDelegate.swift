//
//  SceneDelegate.swift
//  Gallery
//
//  Created by mac on 02/06/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func navigateToRootView(viewController: UIViewController) {
	  window?.rootViewController = viewController
	  window?.makeKeyAndVisible()
	}

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		AppDelegate.standard.window = window
		
		let tabBarController = TabBarController()

		let navigationController = UINavigationController(rootViewController: tabBarController)
		navigationController.modalTransitionStyle = .crossDissolve
		navigationController.modalPresentationStyle = .fullScreen
		navigationController.isNavigationBarHidden = true
		navigateToRootView(viewController: navigationController)
	}

	func sceneDidDisconnect(_ scene: UIScene) {
		
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
		
	}

	func sceneWillResignActive(_ scene: UIScene) {
		
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		
	}


}

