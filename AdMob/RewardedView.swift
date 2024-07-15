//
//  RewardedView.swift
//  AdMob
//
//  Created by Jackie Lu on 2024/7/15.
//

import UIKit

class RewardedView: UIView {
    private let rewardLabel: UILabel
    
    init(rewardLabel: UILabel) {
        self.rewardLabel = rewardLabel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        rewardLabel.translatesAutoresizingMaskIntoConstraints = false
        rewardLabel.textAlignment = .center
        rewardLabel.font = UIFont.systemFont(ofSize: 16)
        
        addSubview(rewardLabel)
        
        NSLayoutConstraint.activate([
            rewardLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rewardLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func updateRewardLabel(with text: String) {
        rewardLabel.text = text
    }
}


