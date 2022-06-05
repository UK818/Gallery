//
//  ExploreCollectionViewCell.swift
//  Gallery
//
//  Created by mac on 04/06/2022.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
	
	let backgroundImageView: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleToFill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupCell() {
		contentView.addSubview(backgroundImageView)
		contentView.layer.cornerRadius = 15
		backgroundImageView.frame = contentView.bounds
		backgroundImageView.layer.cornerRadius = 15
	}
	
	func populateCell(with image: UIImage) {
		backgroundImageView.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
	}
	
}
