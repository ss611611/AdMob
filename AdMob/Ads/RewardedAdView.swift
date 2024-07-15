//
//  RewardedAdView.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/15.
//

import GoogleMobileAds
import UIKit

class RewardedAdView: UIViewController {
    
    private var rewardedAd: GADRewardedAd?
    var onRewardEarned: ((GADAdReward) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRewardedAd()
    }
    
    func loadRewardedAd() {
        Task {
            do {
                rewardedAd = try await GADRewardedAd.load(
                    withAdUnitID: "ca-app-pub-8638863047626544/7087847322", request: GADRequest())
            } catch {
                print("Rewarded ad failed to load with error: \(error.localizedDescription)")
            }
        }
    }
    
    func presentRewardedAd(from viewController: UIViewController) {
        if let rewarded = rewardedAd {
            rewarded.present(fromRootViewController: viewController) {
                let reward = rewarded.adReward
                self.onRewardEarned?(reward)
            }
        } else {
            print("Rewarded interstitial ad wasn't ready.")
        }
    }
}
