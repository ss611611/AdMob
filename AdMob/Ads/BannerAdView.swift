//
//  BannerAdView.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/13.
//

import UIKit
import GoogleMobileAds

class BannerAdView: UIView {
    
    private var bannerView: GADBannerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBannerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBannerView()
    }
    
    private func setupBannerView() {
        let viewWidth = frame.inset(by: safeAreaInsets).width
        let adaptiveSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        bannerView = GADBannerView(adSize: adaptiveSize)
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bannerView)
        addConstraints(
            [NSLayoutConstraint(item: bannerView!,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: safeAreaLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView!,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: self,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    func loadAd(withAdUnitID adUnitID: String) {
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = UIApplication.shared.keyWindow?.rootViewController
        bannerView.load(GADRequest())
    }
}

