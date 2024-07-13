//
//  InterstitialAdView.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/13.
//

import GoogleMobileAds
import UIKit

class InterstitialAdView: UIViewController {
    
    private var interstitial: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInterstitial()
    }
    
    func loadInterstitial() {
        GADInterstitialAd.load(
            withAdUnitID: "ca-app-pub-8638863047626544/2627161477", request: GADRequest()) { [weak self] ad, error in
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                } else {
                    self?.interstitial = ad
                    print("Interstitial ad loaded successfully")
                }
            }
    }
    
    func presentInterstitialAd(from viewController: UIViewController) {
        if let interstitial = interstitial {
            interstitial.present(fromRootViewController: viewController)
            print("Presenting interstitial ad")
        } else {
            print("Interstitial ad wasn't ready")
        }
    }
}
