//
//  ViewController.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/13.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    var bannerAdView: BannerAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupBannerAdView()
    }
    
    private func setupBannerAdView() {
        let viewWidth = view.frame.inset(by: view.safeAreaInsets).width
        bannerAdView = BannerAdView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 50))
        
        view.addSubview(bannerAdView)
        bannerAdView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(
            [NSLayoutConstraint(item: bannerAdView!,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view.safeAreaLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerAdView!,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
        
        bannerAdView.loadAd(withAdUnitID: "ca-app-pub-8638863047626544/5236511938")
    }
}

