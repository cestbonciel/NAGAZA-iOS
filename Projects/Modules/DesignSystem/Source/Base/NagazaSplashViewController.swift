//
//  NagazaSplashViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

public final class NagazaSplashViewController: NagazaViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: DSKitAsset.Images.imgLaunch.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public override func makeUI() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    public override func navigationSetting() {
        navigationController?.navigationBar.isHidden = true
    }
    
//    func changeMainView() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            Application.shared.configurationMainInterface(window: keyWindow)
//        }
//    }
}
