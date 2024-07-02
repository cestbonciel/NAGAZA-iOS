//
//  NagazaBaseTableView.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/05.
//

import UIKit

public class NagazaTableView: UITableView {
    var disposeBag = DisposeBag()

    private var afterViewDidLoad = true
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.backgroundColor = DSKitAsset.Colors.white.color
        self.separatorInset = .zero
        self.sectionHeaderTopPadding = 0
        
        makeUI()
        bindViewModel()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set up constraints of view and add subviews
    open func makeUI() { }
    
    /// Data binding between view and model
    open func bindViewModel() { }
}

