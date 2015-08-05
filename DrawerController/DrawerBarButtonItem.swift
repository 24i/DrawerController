// Copyright (c) 2014 evolved.io (http://evolved.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Foundation

public class DrawerBarButtonItem: UIBarButtonItem {
    
    let menuButton: AnimatedMenuButton
    
    // MARK: - Initializers
    
    public override init() {
        self.menuButton = AnimatedMenuButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        super.init()
    }
    
    public convenience init(target: AnyObject?, action: Selector) {
        self.init(target: target, action: action, menuIconColor: UIColor.grayColor())
    }
    
    public init(target: AnyObject?, action: Selector, menuIconColor: UIColor) {
        self.menuButton = AnimatedMenuButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30), strokeColor: menuIconColor)
        self.menuButton.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        super.init(customView: self.menuButton)
    }

    public required convenience init(coder aDecoder: NSCoder) {
        let barButtonItem = UIBarButtonItem(coder: aDecoder)
        self.init(target: barButtonItem.target, action: barButtonItem.action)
    }
    
    // MARK: - Animations
    
    public func animateWithPercentVisible(percentVisible: CGFloat, drawerSide: DrawerSide) {
        if let btn = self.customView as? AnimatedMenuButton {
            btn.animateWithPercentVisible(percentVisible, drawerSide: drawerSide)
        }
    }
}
