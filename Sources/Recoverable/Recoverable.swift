//
//  Recoverable.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 13/05/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

protocol Recoverable {
    var viewState: RecoverableViewState? { get set }
    func saveViewState()
    func recoverViewState(forced: Bool)
}

extension UIView: Recoverable {
    
    @objc func saveViewState() {
        viewState = RecoverableViewState(view: self)
        setSkeletonViewState()
    }
    
    private func setSkeletonViewState() {
        isUserInteractionEnabled = false
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    @objc func recoverViewState(forced: Bool) {
        guard let safeViewState = viewState else { return }
        isHidden = safeViewState.isHidden
        isUserInteractionEnabled = safeViewState.isUserInteractionEnabled
        
        clipsToBounds = safeViewState.clipsToBounds
        layer.cornerRadius = safeViewState.cornerRadius
        layer.masksToBounds = safeViewState.masksToBounds
        
        if safeViewState.backgroundColor != backgroundColor || forced {
            backgroundColor = safeViewState.backgroundColor
        }
    }
}

extension UILabel {
    override func saveViewState() {
        super.saveViewState()
        viewState?.text = text
        viewState?.textColor = textColor
    }
    
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        text = text == " " || forced ? viewState?.text : text
        textColor = textColor == .clear || forced ? viewState?.textColor : textColor
    }
}

extension UITextView {
    override func saveViewState() {
        super.saveViewState()
        viewState?.text = text
        viewState?.textColor = textColor
    }
    
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        text = text == " " || forced ? viewState?.text : text
        textColor = textColor == .clear || forced ? viewState?.textColor : textColor
    }
}

extension UIImageView {
    override func saveViewState() {
        super.saveViewState()
        viewState?.image = image
    }
    
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        image = image == nil || forced ? viewState?.image : image
    }
}
