//
//  BadgeIconView.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/08.
//

import UIKit

import DSKit

enum BadgeIconType {
    case mud
    case soil
    case grass
    case flower
    case flowerGarden
    case life
    
    var title: String {
        switch self {
        case .mud:
            "진흙길"
        case .soil:
            "흙길"
        case .grass:
            "풀밭길"
        case .flower:
            "꽃길"
        case .flowerGarden:
            "꽃밭길"
        case .life:
            "인생테마"
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .mud:
            DSKitAsset.Colors.darkbrownMudText.color
        case .soil:
            DSKitAsset.Colors.brownSoilText.color
        case .grass:
            DSKitAsset.Colors.greenGrassText.color
        case .flower:
            DSKitAsset.Colors.blueFlowerText.color
        case .flowerGarden:
            DSKitAsset.Colors.pinkFlowerText.color
        case .life:
            DSKitAsset.Colors.darkbrownMudText.color
        }
    }
    
    var backgrouncColor: UIColor {
        switch self {
        case .mud:
            DSKitAsset.Colors.darkbrownMudBackground.color
        case .soil:
            DSKitAsset.Colors.brownSoilBackground.color
        case .grass:
            DSKitAsset.Colors.greenGrassBackground.color
        case .flower:
            DSKitAsset.Colors.blueFlowerBackground.color
        case .flowerGarden:
            DSKitAsset.Colors.pinkFlowerBackground.color
        case .life:
            DSKitAsset.Colors.yellowLifeBackground.color
        }
    }
}

final class BadgeIconView: NagazaView {
    private let titleText: UILabel = {
        let label = UILabel()
        
        label.font = DSKitFontFamily.Pretendard.medium.font(size: 8)
        
        return label
    }()
    
    convenience init(type: BadgeIconType) {
        self.init()
    
        setupType(with: type)
    }
    
    override func makeUI() {
        layer.cornerRadius = 8
        
        initSubviews()
        initConstraints()
    }
    
    private func initSubviews() {
        addSubview(titleText)
    }
    
    private func initConstraints() {
        titleText.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(3)
            make.horizontalEdges.equalToSuperview().inset(6)
        }
    }
    
    private func setupType(with type: BadgeIconType) {
        titleText.text = type.title
        titleText.textColor = type.textColor
        
        self.backgroundColor = type.backgrouncColor
    }
}
