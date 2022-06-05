//
//  CategoryViewController.swift
//  Gallery
//
//  Created by mac on 03/06/2022.
//

import UIKit

class CategoryViewController: UIViewController {
	
	private var viewLayout: ViewLayout!
	private var bannerImageView: UIImageView!
	private var scrollViewContainer: UIScrollView!
	private var container: UIView!
	private var menuCollectionView: UICollectionView!
	private var cardCollectionView: UICollectionView!
	
	private var menuTitleCollection: [String?] = []
	private var cardImageCollection: [UIImage?] = []
	var selectedCell = [IndexPath]()
	
	init(viewLayout: ViewLayout) {
		self.viewLayout = viewLayout
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupVC()
		collectionViewSetup()
    }
	
	override func viewDidLayoutSubviews() {
		setupLayoutConstraints()
	}
	
	private func setupVC() {
		menuTitleCollection = Constants.Collections.menuLabelCollection
		cardImageCollection = Constants.Collections.cardImageCollection
		scrollViewContainer = viewLayout.scrollView
		bannerImageView = viewLayout.categoryImageView
		container = viewLayout.container
		menuCollectionView = viewLayout.categoryMenuCollectionView
		cardCollectionView = viewLayout.categoryCardCollectionView
		
		view.addSubview(scrollViewContainer)
		
		scrollViewContainer.frame = view.bounds
		scrollViewContainer.addSubview(bannerImageView)
		scrollViewContainer.addSubview(container)
		
		container.addSubview(menuCollectionView)
		container.addSubview(cardCollectionView)
		
		self.navigationController?.navigationBar.isHidden = true
		
	}
	
	private func collectionViewSetup() {
		menuCollectionView.dataSource = self
		menuCollectionView.delegate = self
		cardCollectionView.dataSource = self
		cardCollectionView.delegate = self
		
		menuCollectionView.center = view.center
		cardCollectionView.center = view.center
	}
	
	func setupLayoutConstraints() {
		
		NSLayoutConstraint.activate([
			scrollViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			bannerImageView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor),
			bannerImageView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
			bannerImageView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
			bannerImageView.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
			bannerImageView.heightAnchor.constraint(equalTo: scrollViewContainer.heightAnchor, multiplier: 0.3),
			
			container.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor),
			container.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
			container.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
			container.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
			container.heightAnchor.constraint(equalTo: scrollViewContainer.heightAnchor, multiplier: 0.7),
			container.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor),
			
			menuCollectionView.topAnchor.constraint(equalTo: container.topAnchor),
			menuCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			menuCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			menuCollectionView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.08),
			menuCollectionView.widthAnchor.constraint(equalTo: container.widthAnchor),
			menuCollectionView.bottomAnchor.constraint(equalTo: cardCollectionView.topAnchor),
			
			cardCollectionView.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor),
			cardCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			cardCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			cardCollectionView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.92),
			cardCollectionView.widthAnchor.constraint(equalTo: container.widthAnchor)
		])
		
	}

}

extension CategoryViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == menuCollectionView {
			return menuTitleCollection.count
		} else {
			return cardImageCollection.count
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if collectionView == menuCollectionView {
			guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
				return UICollectionViewCell()
			}
			if let title = menuTitleCollection[indexPath.row] {
				menuCell.populateMenuCell(with: title)
			}
			return menuCell
		} else {
			guard let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
				return UICollectionViewCell()
			}
			if let image = cardImageCollection[indexPath.row] {
				cardCell.populateCardCell(with: image)
			}
			return cardCell
		}
		
	}
	
}

extension CategoryViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if collectionView == menuCollectionView {
			let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
			selectedCell.append(indexPath)
			cell?.menuIsSelected()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		if selectedCell.contains(indexPath) {
			let menuCells = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
			selectedCell.remove(at: selectedCell.firstIndex(of: indexPath)!)
			menuCells?.menuIsDeSelected()
		}
	}
	
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		if collectionView == menuCollectionView {
			return CGSize(width: menuCollectionView.frame.width / 4.5, height: menuCollectionView.frame.height)
		}
		else {
			return CGSize(width: (cardCollectionView.frame.size.width - 20) / 3, height: 218.67)
		}
	}
	
}

extension CategoryViewController: UIScrollViewDelegate {

	public func scrollViewDidScroll(_ scrollView: UIScrollView) {
			
		if self.scrollViewContainer.panGestureRecognizer.translation(in: self.scrollViewContainer).y <= 0 {
			UIView.animate(withDuration: 1) {
				self.scrollViewContainer.contentOffset.y = self.container.frame.origin.y - 30
				self.bannerImageView.isHidden = true
				self.view.layoutIfNeeded()
			}
		} else {
			UIView.animate(withDuration: 1) {
				self.scrollViewContainer.contentOffset.y = 0
				self.bannerImageView.isHidden = false
				self.view.layoutIfNeeded()
			}
		}
	
	}

}
