//
//  MenuCollectionViewCell.swift
//  Gallery
//
//  Created by mac on 04/06/2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
	
	static let identifier = Constants.Identifier.menu
	
	private let titleLabel: UILabel = {
		let label = PaddedLabel()
		label.numberOfLines = 0
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		label.paddingLeft = 6
		label.paddingRight = 6
		label.paddingTop = 4
		label.paddingBottom = 4
		return label
	}()
	
	private let indicatorSelector: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = Constants.Colors.yellow
		return view
	}()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupCell() {
		contentView.addSubview(titleLabel)
		contentView.addSubview(indicatorSelector)
		contentMode = .scaleAspectFit
		indicatorSelector.isHidden = true
		
		NSLayoutConstraint.activate([
			contentView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			titleLabel.heightAnchor.constraint(equalToConstant: 30),
			titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			
//			indicatorSelector.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
			indicatorSelector.heightAnchor.constraint(equalToConstant: 5),
			indicatorSelector.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
			indicatorSelector.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			indicatorSelector.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
		])
		
	}
	
	public func populateMenuCell(with title: String, index: IndexPath) {
		titleLabel.text = title
		if index.row == 0 {
			menuIsSelected()
		}
	}
	
	public func menuIsDeSelected() {
		indicatorSelector.isHidden = true
		titleLabel.textColor = .white
		titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
	}
	
	public func menuIsSelected() {
		indicatorSelector.isHidden = false
		titleLabel.textColor = Constants.Colors.yellow
		titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
	}
	
}
