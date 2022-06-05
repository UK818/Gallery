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
	
	let exploreCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 100, height: 180)
		layout.sectionInset = UIEdgeInsets(top: 10, left: 150, bottom: 10, right: 150)
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor(white: 0, alpha: 0)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView .register(
			ExploreCollectionViewCell.self,
			forCellWithReuseIdentifier: Constants.Identifier.explore
		)
		return collectionView
	}()
	  
	  
	
	// Main: Category View Layout
	
	let scrollView: UIScrollView = {
		let view = UIScrollView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let categoryImageView: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleToFill
		view.image = Constants.Images.categoryBannerImage
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let container: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let categoryMenuCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 5
		layout.minimumInteritemSpacing = 5
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor(white: 0, alpha: 0)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView .register(
			MenuCollectionViewCell.self,
			forCellWithReuseIdentifier: Constants.Identifier.menu
		)
		return collectionView
	}()
	
	let categoryCardCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor(white: 0, alpha: 0)
		collectionView .register(
			CardCollectionViewCell.self,
			forCellWithReuseIdentifier: Constants.Identifier.card
		)
		return collectionView
	}()
	
}
