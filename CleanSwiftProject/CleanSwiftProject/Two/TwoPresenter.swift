//
//  TwoPresenter.swift
//  CleanSwiftProject
//
//  Created by Uladzislau Komar on 21.01.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TwoPresentationLogic {
    func presentSomething(response: Two.Something.Response)
}

class TwoPresenter: TwoPresentationLogic {
    weak var viewController: TwoDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Two.Something.Response) {
        let viewModel = Two.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
