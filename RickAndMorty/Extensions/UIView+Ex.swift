//
//  UIView+Ex.swift
//  RickAndMorty
//
//  Created by Анна on 17.07.2024.
//

import UIKit


extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
