//
//  OnboardingPageController.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import UIKit

struct Page {
    var title: String
    var text: String
}

class OnboardingPageController: UIViewController, OnboardingInputHandler, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [OnboardingContentController]()
    
    var onFinishButtonTap: (() -> Void)?

    var pageViewController: UIPageViewController!
    
    private var _baseView: BaseView
    private var _baseModel: BaseModel
    
    var baseView: OnboardingPageView {
        return _baseView as! OnboardingPageView
    }
    
    var model: OnboardingPageModel {
        return _baseModel as! OnboardingPageModel
    }
    
    init(baseView: BaseView, baseModel: BaseModel) {
        self._baseView = baseView
        self._baseModel = baseModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self._baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.baseView.finishButton.addTarget(self, action: #selector(didTapFinishButton), for: .touchUpInside)
        
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        
        let page1 = ModuleFactory.createOnboardingContent(page: self.model.page(for: 0))
        let page2 = ModuleFactory.createOnboardingContent(page: self.model.page(for: 1))
        let page3 = ModuleFactory.createOnboardingContent(page: self.model.page(for: 2))
        
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        
        pageViewController.setViewControllers([page1], direction: .forward, animated: true, completion: nil)
        
        self.addChild(self.pageViewController)
        self.pageViewController.didMove(toParent: self)
        self.baseView.addSubview(pageViewController.view)
        self.baseView.pageControl.numberOfPages = self.pages.count
        self.baseView.pageControl.currentPage = 0
        
        self.baseView.bringSubviewToFront(self.baseView.finishButton)
    }
    
    @objc func didTapFinishButton() {
        self.onFinishButtonTap?()
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.index(of: viewController as! OnboardingContentController) {
            if viewControllerIndex == 0 {
                // no circular
                return nil
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.index(of: viewController as! OnboardingContentController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                return self.pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return nil
            }
        }
        return nil

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.index(of: viewControllers[0] as! OnboardingContentController) {
                self.baseView.pageControl.currentPage = viewControllerIndex
            }
        }
    }
}



