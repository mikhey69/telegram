//
//  MyViewController.swift
//  HWUIPageViewController
//
//  Created by mikhey on 07.06.2018.
//  Copyright © 2018 mikhey. All rights reserved.
//

import UIKit

class MyViewController: UIPageViewController {
    
    //MARK: - Properties
    var telegrams = [TelegramHelper]()
    var imageView: UIImageView!
    var arrayImage = [String]()
    let startButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Telegram"
        
        arrayImage = ["telegram", "fast", "free", "powerful", "secure", "cloud"]
        
        
        
        
        // init
        let telegramName = TelegramHelper(name: "Telegram",
                                          text1: "The world's fastest messsaging app.",
                                          text2:" It is free and secure ")
        
        let fastName = TelegramHelper(name: "Fast",
                                      text1: "Telegram delivers messages",
                                      text2:" faster than any other application.")
        
        let freeName = TelegramHelper(name: "Free",
                                      text1: "Telegram is free forever. No ads.",
                                      text2:"No subscription fees. ")
        
        let powerfulName = TelegramHelper(name: "Powerful",
                                          text1: "Telegram has no limits on",
                                          text2:" the size of your  chats and media. ")
        
        let secureName = TelegramHelper(name: "Secure",
                                        text1: "telegram keeps uour messages",
                                        text2:" safe from hacker attacks.")
        
        let cloudName = TelegramHelper(name: "Cloud-Based",
                                       text1: "Telegram lets you acces your",
                                       text2:" messages from multiple devices.")
        
        telegrams.append(telegramName)
        telegrams.append(fastName)
        telegrams.append(freeName)
        telegrams.append(powerfulName)
        telegrams.append(secureName)
        telegrams.append(cloudName)
        
        createImageView()
        createConstraints()
        createButton()
        createPageControl()
        
    }
    //MARK: - UIPageControl
    fileprivate func createPageControl() {
        //Creating - UIPageControl
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
    }
    
    //MARK: - Button
    func createButton() {
        startButton.backgroundColor = UIColor(red: 45/255,
                                              green: 165/255,
                                              blue: 225/255, alpha: 1)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.tintColor = .white
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        startButton.setTitle("Start Messaging", for: .normal)
        startButton.layer.cornerRadius = 17
        startButton.layer.masksToBounds = true
        
    }
    
    //MARK: - Init
    func createImageView() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "telegram")
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
    }
    
    
    lazy var subWiew: [UIView] = [self.imageView, self.startButton]
    
    //MARK: - NSLayout
    func createConstraints() {
        
        for view in subWiew { self.view.addSubview(view)}
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: imageView,
                               attribute: .height, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute,
                               multiplier: 1, constant: 150),
            
            //        NSLayoutConstraint(item: imageView,
            //                            attribute: .leading, relatedBy: .equal,
            //                            toItem: view, attribute: .leading,
            //                            multiplier: 1, constant: 50),
            //
            //        NSLayoutConstraint(item: imageView,
            //                            attribute: .trailing, relatedBy: .equal,
            //                            toItem: view, attribute: .trailing,
            //                            multiplier: 1, constant: -50),
            
            
            NSLayoutConstraint(item: imageView,
                               attribute: .centerX, relatedBy: .equal,
                               toItem: view, attribute: .centerX,
                               multiplier: 1, constant: 0),
            
            NSLayoutConstraint(item: imageView,
                               attribute: .top, relatedBy: .equal,
                               toItem: view, attribute: .top,
                               multiplier: 1, constant: view.bounds.size.height / 5),
            
            
            ])
        NSLayoutConstraint.activate([
            
            NSLayoutConstraint(item: startButton,
                               attribute: .leading, relatedBy: .equal,
                               toItem: view, attribute: .leading,
                               multiplier: 1, constant: 50),
            
            NSLayoutConstraint(item: startButton,
                               attribute: .trailing, relatedBy: .equal,
                               toItem: view, attribute: .trailing,
                               multiplier: 1, constant: -50),
            
            
            //            NSLayoutConstraint(item: startButton,
            //                               attribute: .width, relatedBy: .equal,
            //                               toItem: nil, attribute: .notAnAttribute,
            //                               multiplier: 1, constant: 150),
            
            NSLayoutConstraint(item: startButton,
                               attribute: .height, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute,
                               multiplier: 1, constant: 40),
            
            NSLayoutConstraint(item: startButton,
                               attribute: .top, relatedBy: .equal,
                               toItem: imageView, attribute: .bottom,
                               multiplier: 1, constant: 200),
            
            NSLayoutConstraint(item: startButton,
                               attribute: .bottom, relatedBy: .equal,
                               toItem: view, attribute: .bottom,
                               multiplier: 1, constant: -100),
            
            //            NSLayoutConstraint(item: startButton,
            //                               attribute: .centerX, relatedBy: .equal,
            //                               toItem: view, attribute: .centerX,
            //                               multiplier: 1, constant: 0),
            ])
        
        
        
    }
    
    //MARK: - Create VC
    lazy var arrayTelegramVC: [TelegramViewController] = {
        var telegramVC = [TelegramViewController]()
        for telegram in telegrams {
            telegramVC.append(TelegramViewController(telegramWith: telegram))
        }
        return telegramVC
    }()
    
    //MARK: - init UIPageVC
    override init(transitionStyle style: UIPageViewControllerTransitionStyle,
                  navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        view.backgroundColor = .white
        
        self.dataSource = self
        self.delegate = self
        
        setViewControllers([arrayTelegramVC[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Extension
extension MyViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewVC = viewController as? TelegramViewController else { return nil }
        if let index = arrayTelegramVC.index(of: viewVC) {
            
            UIView.animate(withDuration: 1, animations: {
                self.imageView.image = UIImage(named: self.arrayImage[index])
            })
            
            if index > 0 {
                
                return arrayTelegramVC[index - 1]
            }
            
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewVC = viewController as? TelegramViewController else { return nil }
        if let index = arrayTelegramVC.index(of: viewVC) {
            
            UIView.animate(withDuration: 1, animations: {
                self.imageView.image = UIImage(named: self.arrayImage[index])
            })
            
            if index < telegrams.count - 1 {
                
                return arrayTelegramVC[index + 1]
            }
            
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return telegrams.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
        
    }
    
}
