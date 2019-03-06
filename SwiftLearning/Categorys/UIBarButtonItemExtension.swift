//
//  UIBarButtonItemExtension.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/3/1.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit
import Foundation

//Any可以表示任何类型的实例, Anyobject可以表示class类型的实例

extension UIBarButtonItem {
    
    //MARK: 便利初始化方法1
    convenience init(title: String?,
                     titleColor: UIColor = .white,
                     titleFont: UIFont = UIFont.systemFont(ofSize: 15),
                     titleEdgeInsets: UIEdgeInsets = .zero,
                     target: Any?,
                     action: Selector?) {
        let btn = UIButton(type: .system)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = titleFont
        btn.titleEdgeInsets = titleEdgeInsets
        btn.sizeToFit()
        if action != nil {
            btn.addTarget(target, action: action!, for: .touchUpInside)
        }
        
        if btn.bounds.width < 40 || btn.bounds.height > 40 {
            let width = 40 / btn.bounds.height * btn.bounds.width
            btn.bounds = CGRect(x: 0, y: 0, width: width, height: 40)
        }
        self.init(customView: btn)
    }
    
    //MARK: 便利初始化方法2
    convenience init(image: UIImage?,
                     selectImage: UIImage? = nil,
                     imageEdgeInsets: UIEdgeInsets = .zero,
                     target: Any?,
                     action: Selector?) {
        let btn = UIButton(type: .system)
        btn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.setImage(selectImage?.withRenderingMode(.alwaysOriginal), for: .selected)
        btn.imageEdgeInsets = imageEdgeInsets
        btn.sizeToFit()
        if action != nil {
            btn.addTarget(target, action: action!, for: .touchUpInside)
        }
        if btn.bounds.width < 40 || btn.bounds.height > 40 {
            let width = 40 / btn.bounds.height * btn.bounds.width
            btn.bounds = CGRect(x: 0, y: 0, width: width, height: 40)
        }
        self.init(customView: btn)
    }
}


