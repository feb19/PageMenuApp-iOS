//
//  ViewController.swift
//  PageMenuApp
//
//  Created by Nobuhiro Takahashi on 2018/06/24.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import UIKit
import PageMenu
import SideMenu

class ViewController: UIViewController {
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuFadeStatusBar = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var controllerArray : [UIViewController] = []
        
        // dummies
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        controller.title = "list1"
        controllerArray.append(controller)
        
        let controller2 = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        controller2.title = "list2"
        controllerArray.append(controller2)
        
        let controller3 = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        controller3.title = "list3"
        controllerArray.append(controller3)
        
        let controller4 = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        controller4.title = "list4"
        controllerArray.append(controller4)
        
        let controller5 = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        controller5.title = "list5"
        controllerArray.append(controller5)
        
        let controller6 = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        controller6.title = "list6"
        controllerArray.append(controller6)
        
        
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: controller.view)
        
        // setup
        let parameters: [CAPSPageMenuOption] = [
//            .menuItemSeparatorWidth(0.5),
            .useMenuLikeSegmentedControl(true),
//            .menuHeight(50),
            .menuItemSeparatorPercentageHeight(0.2),
            .centerMenuItems(true),
            .menuMargin(0),
            .menuItemFont(UIFont.boldSystemFont(ofSize: 16.0)),
            .selectedMenuItemLabelColor(UIColor.black),
            .unselectedMenuItemLabelColor(UIColor.gray),
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor.white),
            .bottomMenuHairlineColor(UIColor.gray),
            .selectionIndicatorColor(UIColor.red),
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMove(toParentViewController: self)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // iPhone X 対応
        let safeAreaInsets = self.view.safeAreaInsets
        var bounds = self.view.bounds
        bounds.origin.y += safeAreaInsets.top
        bounds.size.height -= safeAreaInsets.top + safeAreaInsets.bottom
        
        pageMenu!.view.frame = CGRect(x: 0, y: safeAreaInsets.top, width: bounds.size.width, height: bounds.size.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

