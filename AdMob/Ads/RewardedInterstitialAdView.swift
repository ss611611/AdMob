//
//  RewardedInterstitialAdView.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/13.
//

import GoogleMobileAds
import UIKit

class RewardedInterstitialAdView: UIViewController {

    private var rewardedInterstitial: GADRewardedInterstitialAd?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRewardedInterstitialAd()
    }

    func loadRewardedInterstitialAd() {
        Task {
            do {
                rewardedInterstitial = try await GADRewardedInterstitialAd.load(
                    withAdUnitID: "ca-app-pub-8638863047626544/5419650234", request: GADRequest())
                print("Rewarded interstitial ad loaded successfully.")
            } catch {
                print("Failed to load rewarded interstitial ad with error: \(error.localizedDescription)")
            }
        }
    }
    
    func presentRewardedInterstitialAd(from viewController: UIViewController) {
        if let rewardedInterstitial = rewardedInterstitial {
            rewardedInterstitial.present(fromRootViewController: viewController) {
                // Handle user earning reward.
                let reward = rewardedInterstitial.adReward
                print("User earned reward of \(reward.amount) \(reward.type).")
            }
        } else {
            print("Rewarded interstitial ad wasn't ready.")
        }
    }
}
