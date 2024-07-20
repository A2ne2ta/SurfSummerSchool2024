//
//  UIStackView+Ex.swift
//  RickAndMorty
//
//  Created by Анна on 17.07.2024.
//


import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
