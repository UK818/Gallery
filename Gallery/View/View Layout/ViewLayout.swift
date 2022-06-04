//
//  ViewLayout.swift
//  Gallery
//
//  Created by mac on 04/06/2022.
//

import Foundation
import UIKit

class ViewLayout {
	
	// Main: Explore View Layout
	
	let exploreImageView: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleToFill
		view.image = Constants.Images.exploreBannerImage
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var title: UILabel = {
		var titles = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
		titles.font = UIFont.boldSystemFont(ofSize: 30.0)
		titles.text = "Explore"
		titles.textColor = .white
		return titles
	}()
	
	let searchIcon: UIBarButtonItem = {
		let button = UIBarButtonItem()
		return button
	}()
	
	let collectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 100, height: 180)
		layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor(white: 0, alpha: 0)
		collectionView .register(
			ExploreCollectionViewCell.self,
			forCellWithReuseIdentifier: Constants.Identifier.explore
		)
		return collectionView
	}()
	  
	  
	
	// Main: Category View Layout
	
	let categoryImageView: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleToFill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
}
