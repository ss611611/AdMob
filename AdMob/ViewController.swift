//
//  ViewController.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/13.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    var bannerAdView: BannerAdView!
    var interstitialAdView: InterstitialAdView?
    var rewardedInterstitialAdView: RewardedInterstitialAdView?
    var rewardedAdView: RewardedAdView!
    var totalRewardAmount: Int = 0
    var totalRewardType: String = ""
    
    @IBOutlet weak var interstitialButton: UIButton!
    @IBOutlet weak var RewardedInterstitialButton: UIButton!
    @IBOutlet weak var RewardedButton: UIButton!
    @IBOutlet weak var rewardLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBannerAdView()
        setupAdViews()
    }
    
    private func setupBannerAdView() {
        let viewWidth = view.frame.inset(by: view.safeAreaInsets).width
        bannerAdView = BannerAdView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 50))
        
        view.addSubview(bannerAdView)
        bannerAdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerAdView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bannerAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        bannerAdView.loadAd(withAdUnitID: "ca-app-pub-8638863047626544/5236511938")
    }
    
    private func setupAdViews() {
        interstitialAdView = InterstitialAdView()
        interstitialAdView?.loadInterstitial()
        
        rewardedInterstitialAdView = RewardedInterstitialAdView()
        rewardedInterstitialAdView?.loadRewardedInterstitialAd()
        rewardedInterstitialAdView?.onRewardEarned = { [weak self] reward in
            self?.handleRewardEarned(reward)
        }
        
        rewardedAdView = RewardedAdView()
        rewardedAdView?.loadRewardedAd()
        rewardedAdView?.onRewardEarned = { [weak self] reward in
            self?.handleRewardEarned(reward)
        }
    }
    
    private func handleRewardEarned(_ reward: GADAdReward) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.totalRewardAmount += reward.amount.intValue
            self.totalRewardType += "\(reward.type)"
            self.updateRewardLabel()
        }
    }
    
    private func updateRewardLabel() {
        rewardLabel.text = "Reward: \(totalRewardAmount) \(totalRewardType)"
    }
    
    @IBAction func interstitialButtonTapped(_ sender: UIButton) {
        interstitialAdView?.presentInterstitialAd(from: self)
    }
    
    @IBAction func rewardedInterstitialButtonTapped(_ sender: UIButton) {
        rewardedInterstitialAdView?.presentRewardedInterstitialAd(from: self)
    }
    
    @IBAction func rewardedButtonTapped(_ sender: UIButton) {
        rewardedAdView?.presentRewardedAd(from: self)
    }
}
