//
//  DGYViewController.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/27.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class DGYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = UIColor.white
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
//            navi.barst
        }
    }

    
    // MARK: - Navigation


}
