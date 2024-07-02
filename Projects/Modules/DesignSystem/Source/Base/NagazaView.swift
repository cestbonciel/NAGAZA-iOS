//
//  NagazaBaseView.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

open class NagazaView: UIView {
    private var afterViewDidLoad = true

    public override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if afterViewDidLoad {
            afterViewDidLoad.toggle()
            adjustLayoutAfterRendering()
        }
    }
    
    /// Set up constraints of view and add subviews
    open func makeUI() { }
    
    /// Adjust layout after rendering
    open func adjustLayoutAfterRendering() { }
}

