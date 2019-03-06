//
//  DGYNavigationController.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/27.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

//MARK:定义一个导航栏样式枚举
enum DGYUINavigationBarStyle {
    case theme
    case clear
    case white
}

class DGYNavigationController: UINavigationController {

    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let interactionGes = interactivePopGestureRecognizer else { return }
        guard let targetView = interactionGes.view else { return }
        guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [NSObject] else { return }
        guard let internalTarget = internalTargets.first?.value(forKey: "target") else { return }
        
        let action = Selector(("handleNavigationTransition:"))
        
        let fullScreenGesture = UIPanGestureRecognizer(target: internalTarget, action: action)
        fullScreenGesture.delegate = self
        targetView.addGestureRecognizer(fullScreenGesture)
        interactionGes.isEnabled = false
    }
    
    //push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

//MARK: 手势代理扩展
extension DGYNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        guard let gesture = gestureRecognizer as? UIPanGestureRecognizer else { return true }
        
        if gesture.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0 || disablePopGesture {
            return false
        }
        
        return viewControllers.count != 1
    }
}


//MARK: 导航栏扩展
extension UINavigationController {
    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }
    
    //get和set方法
    var disablePopGesture: Bool {
        get {
            //as? 仅当一个值的类型在运行时（runtime）和as模式右边的指定类型一致  或者是该类型的子类的情况下，才会匹配这个值。如果匹配成功，被匹配的值的类型被转换成as模式左边指定的模式  ??表示为可选性，如果 为空，则使用默认false
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    //状态栏样式扩展
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let topVC = topViewController else { return .lightContent }
        return topVC.preferredStatusBarStyle
    }
    
    func barStyle(_ style: DGYUINavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            //...
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.shadowImage = nil
        }
    }
}

