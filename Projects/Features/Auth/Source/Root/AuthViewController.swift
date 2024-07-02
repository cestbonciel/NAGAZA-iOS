//
//  AuthViewController.swift
//  AuthInterface
//
//  Created by SeungMin on 6/14/24.
//

import Foundation

import DSKit
import Core

final class AuthViewController: NagazaViewController {
    let authViewModel: AuthViewModel!
    
    init(viewModel: AuthViewModel!) {
        self.authViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
