//
//  BaseButton.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    var image:UIImageView?
    var label:UILabel?
    var origFrame = CGRectZero
    let touchDownMargin:CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.origFrame = frame
        
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = touchDownMargin / 3
        self.layer.cornerRadius = self.frame.width / 10
        self.autoresizesSubviews = true
        
        image = UIImageView(frame: CGRectMake(touchDownMargin * 2, touchDownMargin, self.frame.width - touchDownMargin * 4, self.frame.width - touchDownMargin * 4))
        image?.layer.masksToBounds = true
        image?.layer.cornerRadius = image!.frame.width / 10
        self.addSubview(image!)
        
        label = UILabel(frame: CGRectMake(0, self.frame.height * 5/6 - 20, self.frame.width, self.frame.height / 6))
        label?.backgroundColor = .clearColor()
        label?.textColor = .whiteColor()
        label?.font = UIFont.systemFontOfSize(label!.frame.height / 1.5)
        label?.textAlignment = .Center
        label?.numberOfLines = 0
        self.addSubview(label!)
    }
    
    func animate(small:Bool) {
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [], animations: {
            self.frame = small ? CGRectMake(self.origFrame.origin.x + self.touchDownMargin, self.origFrame.origin.y + self.touchDownMargin, self.origFrame.width - self.touchDownMargin * 2, self.origFrame.height - self.touchDownMargin * 2) : self.origFrame
            }, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animate(true)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let p = touches.first?.locationInView(self) else { return }
        let inside = p.x > 0 && p.x < origFrame.width && p.y > 0 && p.y < origFrame.height
        let big = self.frame.width == origFrame.width
        
        if big && inside {
            animate(true)
        } else if !big && !inside {
            animate(false)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animate(false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
