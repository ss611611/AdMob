//
//  GADBannerView.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/13.
//

import GoogleMobileAds
import UIKit

class ViewController: UIViewController {

  var bannerView: GADBannerView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let viewWidth = view.frame.inset(by: view.safeAreaInsets).width

    // Here the current interface orientation is used. Use
    // GADLandscapeAnchoredAdaptiveBannerAdSizeWithWidth or
    // GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth if you prefer to load an ad of a
    // particular orientation,
    let adaptiveSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
    bannerView = GADBannerView(adSize: adaptiveSize)

    addBannerViewToView(bannerView)
  }

  func addBannerViewToView(_ bannerView: GADBannerView) {
    bannerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(bannerView)
    view.addConstraints(
      [NSLayoutConstraint(item: bannerView,
                          attribute: .bottom,
                          relatedBy: .equal,
                          toItem: view.safeAreaLayoutGuide,
                          attribute: .bottom,
                          multiplier: 1,
                          constant: 0),
       NSLayoutConstraint(item: bannerView,
                          attribute: .centerX,
                          relatedBy: .equal,
                          toItem: view,
                          attribute: .centerX,
                          multiplier: 1,
                          constant: 0)
      ])
   }
   
}
