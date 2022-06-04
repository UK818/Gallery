//
//  Constants.swift
//  Gallery
//
//  Created by mac on 04/06/2022.
//

import Foundation
import UIKit

enum Constants {
	
	enum TabBarTitle {
		static let explore = "Explore"
		static let category = "Category"
		static let settings = "Settings"
	}
	
	enum Images {
		static let explore = UIImage(named: "explore")
		static let category = UIImage(named: "categories")
		static let settings = UIImage(named: "settings")
		static let topBackgroundImage = UIImage(named: "topbackgroundimage")
	}
	
	enum Identifier {
		static let MenuCollectionViewCell = "MenuCollectionViewCell"
		static let categoryCollectionViewCell =  "CategoryCollectionViewCell"
		
	}
	
	enum Colors {
		static let yellow = #colorLiteral(red: 1, green: 0.8248900771, blue: 0.2008669972, alpha: 1)
		static let deepBlue = #colorLiteral(red: 0, green: 0.002198057715, blue: 0.2281729579, alpha: 1)
	}
	
}
