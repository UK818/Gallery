//
//  CardCollectionViewCell.swift
//  Gallery
//
//  Created by mac on 04/06/2022.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
	
	static let identifier = Constants.Identifier.card
	
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
		backgroundImageView.frame = contentView.bounds
	}
	
	func populateCardCell(with image: UIImage) {
		backgroundImageView.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
	}
	
}
