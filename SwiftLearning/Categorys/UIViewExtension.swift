//
//  UIViewExtension.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/3/1.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

extension UIView {
    
    //结构体关联key
    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescriptiveName.blurView"
    }
    
    //private (set) var 只读类
    private (set) var blurView: BlurView {
        get {
            if let blurView = objc_getAssociatedObject(self, &AssociatedKeys.descriptiveName) as? BlurView {
                return blurView
            }
            self.blurView = BlurView(to: self)
            return self.blurView
        }
        set(blurView) {
            objc_setAssociatedObject(self, &AssociatedKeys.descriptiveName, blurView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //自定义类
    class BlurView {
        //属性
        private var editing: Bool = false
        private var superView: UIView
        // private (set) var 只读属性
        private (set) var blur: UIVisualEffectView?
        private (set) var blurContentView: UIView?
        
        var animationDuration: TimeInterval = 0.1
        
        var style: UIBlurEffect.Style = .light {
            didSet {
                guard oldValue != style, !editing else { return }
                applyBlurEffect()
            }
        }
        
        var alpha: CGFloat = 0 {
            didSet {
                guard !editing else { return }
                if blur == nil {
                    applyBlurEffect()
                }
                let alpha = self.alpha
                UIView.animate(withDuration: animationDuration) {
                    self.blur?.alpha = alpha
                }
            }
        }
        
        //init方法
        init(to view: UIView) {
            self.superView = view
        }
        
        func setup(style: UIBlurEffect.Style, alpha: CGFloat) -> Self {
            self.editing = true
            self.style = style
            self.alpha = alpha
            self.editing = false
            return self
        }
        
        func enable(isHidden: Bool = false) {
            if blur == nil {
                applyBlurEffect()
            }
            self.blur?.isHidden = isHidden
        }
        
        private func applyBlurEffect() {
            blur?.removeFromSuperview()
            applyBlurEffectHaveParams(style: style, blurAlpha: alpha)
        }
        
        private func applyBlurEffectHaveParams(style: UIBlurEffect.Style, blurAlpha: CGFloat) {
            superView.backgroundColor = UIColor.clear
            
            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
            let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
            blurEffectView.contentView.addSubview(vibrancyEffectView)
            
            blurEffectView.alpha = blurAlpha
            
            superView.insertSubview(blurEffectView, at: 0)
            
            blurEffectView.addAlignedConstraints()
            vibrancyEffectView.addAlignedConstraints()
            
            self.blur = blurEffectView
            self.blurContentView = blurEffectView.contentView
        }
    }
    
    //添加约束方法1
    private func addAlignedConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        addAlignConstraintToSuperView(attribute: NSLayoutConstraint.Attribute.top)
        addAlignConstraintToSuperView(attribute: NSLayoutConstraint.Attribute.leading)
        addAlignConstraintToSuperView(attribute: NSLayoutConstraint.Attribute.trailing)
        addAlignConstraintToSuperView(attribute: NSLayoutConstraint.Attribute.bottom)
    }
    
    //添加约束方法2
    private func addAlignConstraintToSuperView(attribute: NSLayoutConstraint.Attribute) {
        superview?.addConstraint(
            NSLayoutConstraint(
                //NSLayoutRelation.equal 已经被替换成 NSLayoutConstraint.Relation.equal
                item: self,
                attribute: attribute,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: superview,
                attribute: attribute,
                multiplier: 1,
                constant: 0
            )
        )
    }
}
