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
        // Do any additional setup after loading the view.
        
        setupBannerAdView()
        setupInterstitialAdView()
        setupRewardedInterstitialAdView()
        setupRewardedAdView()
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
    
    private func setupInterstitialAdView() {
        interstitialAdView = InterstitialAdView()
        interstitialAdView?.loadInterstitial()
    }
    
    private func handleRewardEarned(_ reward: GADAdReward) {
        DispatchQueue.main.async { [weak self] in
            if let self = self {
                self.totalRewardAmount += reward.amount.intValue
                self.totalRewardType += "\(reward.type), "
                self.showRewardLabel()
            }
        }
    }
    
    private func showRewardLabel() {
        rewardLabel.text = "reward: \(totalRewardAmount) \(totalRewardType)"
    }
    
    private func setupRewardedInterstitialAdView() {
        rewardedInterstitialAdView = RewardedInterstitialAdView()
        rewardedInterstitialAdView?.loadRewardedInterstitialAd()
        rewardedInterstitialAdView?.onRewardEarned = { [weak self] reward in
            self?.handleRewardEarned(reward)
        }
    }
    
    private func setupRewardedAdView() {
        rewardedAdView = RewardedAdView()
        rewardedAdView?.loadRewardedAd()
        rewardedAdView?.onRewardEarned = { [weak self] reward in
            self?.handleRewardEarned(reward)
        }
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

