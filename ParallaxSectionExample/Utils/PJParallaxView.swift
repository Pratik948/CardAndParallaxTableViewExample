//
//  PJParallaxView.m
//  PJParallaxView
//
//  Created by Pratik on 06/03/17.
//  Copyright © 2017 The10Men. All rights reserved.
//
import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width

class PJParallaxViewCollectionReusableView:UICollectionReusableView {
    var scrollView: UIScrollView?
    var viewToStretch: UIView?
    
    func initializeDefaultSetup(with view: UIView) {
        scrollView = UIScrollView(frame: bounds)
        viewToStretch = view
        viewToStretch?.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleHeight, .flexibleWidth]
        viewToStretch?.contentMode = .scaleAspectFill
        scrollView?.addSubview(viewToStretch!)
        if let aView = scrollView {
            addSubview(aView)
        }
    }
    
    func layoutHeaderView(forScrollOffset offset: CGPoint) {
        var delta: CGFloat = 0.0
        var rect = CGRect(x: 0, y: 0, width: kScreenWidth, height: frame.size.height)
        delta = abs(min(0.0, offset.y))
        rect.origin.y -= delta
        rect.size.height += delta
        scrollView?.frame = rect
        clipsToBounds = false
    }
    
    func layoutHeaderViewReverse(forScrollOffset offset: CGPoint) {
        var delta: CGFloat = 0.0
        var rect = CGRect(x: 0, y: 0, width: kScreenWidth, height: self.frame.size.height)
        delta = abs(max(0.0, offset.y))
        rect.origin.y += delta
        rect.size.height -= delta
        scrollView?.frame = rect
        if (viewToStretch?.frame.minY ?? 0.0) > 0.0 {
            var frame: CGRect = viewToStretch!.frame
            frame.origin.y = 0
            if frame.height < (scrollView?.frame.height)! {
                frame.size.height = scrollView?.frame.height ?? 0
            }
            viewToStretch?.frame = frame
        }
        clipsToBounds = false
    }
}

class PJParallaxView:UIView {
    var scrollView: UIScrollView?
    var viewToStretch: UIView?
    var height: CGFloat = 0.0
    
    class func pj_parallaxViewForTableView(withHeight height: CGFloat, viewToStretch: UIView) -> PJParallaxView {
        let parallaxView = PJParallaxView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: height))
        parallaxView.initializeDefaultSetup(with: viewToStretch, forHeight: height)
        return parallaxView
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        var frame = scrollView?.frame
        frame?.size.width = self.frame.size.width
        scrollView?.frame = frame ?? self.frame
    }
    
    func initializeDefaultSetup(with view: UIView, forHeight height: CGFloat) {
        self.height = height
        scrollView = UIScrollView(frame: bounds)
        viewToStretch = view
        viewToStretch?.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleHeight, .flexibleWidth]
        viewToStretch?.contentMode = .scaleAspectFill
        scrollView?.addSubview(viewToStretch!)
        if let aView = scrollView {
            addSubview(aView)
        }
    }
    
    func layoutHeaderView(forScrollOffset offset: CGPoint) {
        var delta: CGFloat = 0.0
        var rect = CGRect(x: 0, y: 0, width: kScreenWidth, height: height)
        delta = abs(min(0.0, offset.y))
        rect.origin.y -= delta
        rect.size.height += delta
        scrollView?.frame = rect
        clipsToBounds = false
    }
    
    func layoutHeaderViewReverse(forScrollOffset offset: CGPoint) {
        var delta: CGFloat = 0.0
        var rect = CGRect(x: 0, y: 0, width: kScreenWidth, height: height)
        delta = abs(max(0.0, offset.y))
        rect.origin.y += delta
        rect.size.height -= delta
        scrollView?.frame = rect
        if (viewToStretch?.frame.minY ?? 0.0) > 0.0 {
            var frame: CGRect = viewToStretch?.frame ?? CGRect.zero
            frame.origin.y = 0
            if frame.height < (scrollView?.frame.height)! {
                frame.size.height = scrollView?.frame.height ?? 0
            }
            viewToStretch?.frame = frame
        }
        clipsToBounds = false
    }
}

