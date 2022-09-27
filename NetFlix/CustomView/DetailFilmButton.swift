//
//  DetailFilmButton.swift
//  NetFlix
//
//  Created by MAC on 9/14/22.
//

import UIKit

class DetailFilmButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.size.height / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        layer.cornerRadius = frame.size.height / 2

    }
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    
                    self.transform = .init(scaleX: 0.4, y: 0.4)
                    self.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    
                    self.transform = .identity
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
  
}