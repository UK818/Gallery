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
		static let exploreBannerImage = UIImage(named: "exploreBannerImage")
		static let categoryBannerImage = UIImage(named: "categoryBannerImage")
		static let searchIcon = UIImage(systemName: "magnifyingglass")
		static let pic1 = UIImage(named: "pic1")
		static let pic2 = UIImage(named: "pic2")
		static let pic3 = UIImage(named: "pic3")
		static let pic4 = UIImage(named: "pic4")
		static let pic5 = UIImage(named: "pic5")
		static let pic6 = UIImage(named: "pic6")
	}
	
	enum CellImages {
		static let imageCollection = [Images.pic4, Images.pic5, Images.pic6, Images.pic4, Images.pic5, Images.pic6]
	}
	
	enum Identifier {
		static let explore = "ExploreCollectionViewCell"
		static let menu = "MenuCollectionViewCell"
		static let card =  "CardCollectionViewCell"
		
	}
	
	enum Colors {
		static let yellow = #colorLiteral(red: 1, green: 0.8248900771, blue: 0.2008669972, alpha: 1)
		static let deepBlue = #colorLiteral(red: 0, green: 0.002198057715, blue: 0.2281729579, alpha: 1)
	}
	
}
