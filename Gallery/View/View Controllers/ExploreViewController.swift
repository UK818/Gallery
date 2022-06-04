//
//  ExploreViewController.swift
//  Gallery
//
//  Created by mac on 03/06/2022.
//

import UIKit

class ExploreViewController: UIViewController {
	
	private var viewLayout: ViewLayout!
	private var bannerImageView: UIImageView!
	private var centerCell: UICollectionViewCell!
	private var pageTitle: UILabel!
	private var searchIcon: UIBarButtonItem!
	private var collectionView: UICollectionView!
	
	private var imageCollection: [UIImage?]!
	
	init(viewLayout: ViewLayout) {
		super.init(nibName: nil, bundle: nil)
		self.viewLayout = viewLayout
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.title = "Explore"
		instantiateLayout()
		collectionViewSetup()
		setUplayoutConstraints()
		configureNavBar()
    }
	
	func configureNavBar() {
		self.searchIcon = UIBarButtonItem(
			image: Constants.Images.searchIcon,
			style: .plain,
			target: self,
			action: #selector(searchButtonTapped)
		)
  
		self.navigationItem.titleView = pageTitle
		navigationItem.rightBarButtonItem = searchIcon
		navigationItem.rightBarButtonItem?.tintColor = .white
	}
	
	private func instantiateLayout() {
		self.imageCollection = Constants.CellImages.imageCollection
		self.bannerImageView = viewLayout.exploreImageView
		self.collectionView = viewLayout.collectionView
		self.pageTitle = viewLayout.title
		self.searchIcon = viewLayout.searchIcon
		view.addSubview(bannerImageView)
	}
	
	private func collectionViewSetup() {
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.center = view.center
		
		view.addSubview(collectionView)
		
	}
	
	private func setUplayoutConstraints() {
		NSLayoutConstraint.activate([
			bannerImageView.topAnchor.constraint(equalTo: view.topAnchor),
			bannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			bannerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			bannerImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
			bannerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
			
			collectionView.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: -150),
			collectionView.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: bannerImageView.trailingAnchor),
			collectionView.heightAnchor.constraint(equalToConstant: 300),
			collectionView.widthAnchor.constraint(equalTo: view.widthAnchor)
		])
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let centerPoint = CGPoint(
			x: self.collectionView.frame.size.width / 2 + scrollView.contentOffset.x,
			y: self.collectionView.frame.size.height / 2 + scrollView.contentOffset.y
		)
		
		if let indexPath = self.collectionView.indexPathForItem(at: centerPoint) {
			self.centerCell = self.collectionView.cellForItem(at: indexPath) as? ExploreCollectionViewCell
			zoomIn()
		}
		
		if let cell = self.centerCell {
			let offsetX = centerPoint.x - cell.center.x
			if offsetX < -15 || offsetX > 15 {
				zoomOut()
				self.centerCell = nil
			}
		}
	}
	
	func zoomIn() {
		UIView.animate(withDuration: 0.2) {
			self.centerCell.transform = CGAffineTransform(scaleX: 1.20, y: 1.30)
		}
		let generator = UIImpactFeedbackGenerator(style: .light)
		generator.impactOccurred()
	}
	
	func zoomOut() {
		UIView.animate(withDuration: 0.2) {
			self.centerCell.transform = CGAffineTransform.identity
		}
	}
	
	@objc func searchButtonTapped() {
	  print("search button tapped")
	}

}

extension ExploreViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		imageCollection.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.explore, for: indexPath) as? ExploreCollectionViewCell else {
			return UICollectionViewCell()
		}
		if let image = imageCollection[indexPath.row] {
			cell.populateCell(with: image)
		}
		return cell
	}
	
}

extension ExploreViewController: UICollectionViewDelegate {
	
}
