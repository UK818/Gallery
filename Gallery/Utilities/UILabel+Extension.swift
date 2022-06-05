//
//  UILabel+Extension.swift
//  Gallery
//
//  Created by mac on 05/06/2022.
//

import Foundation
import UIKit

extension UILabel {
	
	open override var intrinsicContentSize: CGSize {
		let size = super.intrinsicContentSize
		return CGSize(width: size.width + 10, height: size.height)
	}
	
}
