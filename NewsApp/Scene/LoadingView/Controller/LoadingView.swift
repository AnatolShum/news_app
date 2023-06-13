//
//  LoadingView.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 13/06/2023.
//
import Foundation
import UIKit

class LoadingView: UIViewController {
    
    let spinner: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        activityView.color = .black
        activityView.style = .medium
        activityView.startAnimating()
        return activityView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLayout()
    }
    
    func createLayout() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        view.addSubview(spinner)
       
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150)
        ])
    }
    
}

