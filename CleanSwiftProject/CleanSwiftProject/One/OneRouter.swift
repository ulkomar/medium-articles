//
//  OneRouter.swift
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

@objc protocol OneRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    func routeToTwoViewController()
}

protocol OneDataPassing {
    var dataStore: OneDataStore? { get }
}

class OneRouter: NSObject, OneRoutingLogic, OneDataPassing {
    weak var viewController: OneViewController?
    var dataStore: OneDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    func routeToTwoViewController() {
        let destinationVC = TwoViewController()
        var destinationDS = destinationVC.router?.dataStore
        passDataToSomewhere(source: dataStore!, destination: &destinationDS!)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
    
    func navigateToSomewhere(source: UIViewController, destination: TwoViewController)
    {
//      source.show(destination, sender: nil)
        source.present(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToSomewhere(source: OneDataStore, destination: inout TwoDataStore)
    {
      destination.name = source.name
    }
}
