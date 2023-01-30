//
//  DetailedInteractor.swift
//  Medium-CleanSwift
//
//  Created by Uladzislau Komar on 30.01.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailedBusinessLogic {
    func doSomething(request: Detailed.Something.Request)
}

protocol DetailedDataStore {
    //var name: String { get set }
}

class DetailedInteractor: DetailedBusinessLogic, DetailedDataStore {
    var presenter: DetailedPresentationLogic?
    var worker: DetailedWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: Detailed.Something.Request) {
        worker = DetailedWorker()
        worker?.doSomeWork()
        
        let response = Detailed.Something.Response()
        presenter?.presentSomething(response: response)
    }
}