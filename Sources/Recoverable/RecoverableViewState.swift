//
//  RecoverableViewState.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 13/05/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

struct RecoverableViewState {
    var backgroundColor: UIColor?
    var cornerRadius: CGFloat
    var clipsToBounds: Bool
    var masksToBounds: Bool
    var isHidden: Bool
    var isUserInteractionEnabled: Bool
    
    // UI text
    var text: String?
    var textColor: UIColor?
    
    // UI image
    var image: UIImage?
}

extension RecoverableViewState {
    init(view: UIView) {
        self.backgroundColor = view.backgroundColor
        self.clipsToBounds = view.clipsToBounds
        self.masksToBounds = view.layer.masksToBounds
        self.cornerRadius = view.layer.cornerRadius
        self.isHidden = view.isHidden
        self.isUserInteractionEnabled = view.isUserInteractionEnabled
    }
}
