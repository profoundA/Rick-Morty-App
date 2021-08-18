//
//  UIImageViewExtension.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
//

import Foundation
import UIKit
import Kingfisher


extension UIImageView {
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}

