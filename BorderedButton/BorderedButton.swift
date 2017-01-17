//
//  BorderedButton.swift
//
//  Created by Daniel Barros López on 1/17/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
/*
 MIT License
 
 Copyright (c) 2016 Daniel Barros
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */


import UIKit

/// UIButton subclass that imitates bordered buttons in the App Store app.
///
/// In order to change the button's title or border color use the button's tint color.
///
/// If used in a Storyboard make sure to set the button type to custom and the title's font to the one desired (it won't be replaced by the default font).
@IBDesignable
open class BorderedButton: UIButton {
    
    fileprivate enum Constants {
        static let disabledColor = UIColor(white: 0.485, alpha: 0.35)
        static let animationDuration = 0.35
        static let contentInsets = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        static let defaultFont = UIFont.boldSystemFont(ofSize: 15)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(replacingFont: false)
    }
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    fileprivate func setup(replacingFont: Bool = true) {
        
        setTitleColor(tintColor, for: .normal)
        setTitleColor(Constants.disabledColor, for: .disabled)
        setTitleColor(.white, for: .highlighted)
        
        if replacingFont {
            titleLabel?.font = Constants.defaultFont
        }
        
        layer.cornerRadius = 3.5
        layer.borderWidth = 1
        layer.borderColor = tintColor.cgColor
        
        contentEdgeInsets = Constants.contentInsets
    }
    
    override open var isEnabled: Bool {
        didSet {
            layer.borderColor = (isEnabled ? tintColor : Constants.disabledColor).cgColor
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                UIView.animate(withDuration: Constants.animationDuration) {
                    self.layer.backgroundColor = (self.isHighlighted ? self.tintColor : .clear)?.cgColor
                }
            }
        }
    }
}
