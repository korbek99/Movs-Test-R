//
//  InfoViewController.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 06-08-24.
//  Copyright © 2024 Jose David Bustos H. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Information"
        view.backgroundColor = .white
        setupInfoLabels()
    }
    
    private func setupInfoLabels() {
        
        let appInfoLabel = UILabel()
        appInfoLabel.text = "App Name: Movs-Test\nType App: Only Test\nCreador: JB"
        appInfoLabel.numberOfLines = 0
        appInfoLabel.textAlignment = .center
        appInfoLabel.font = UIFont.systemFont(ofSize: 18)
        appInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(appInfoLabel)
        
        NSLayoutConstraint.activate([
            appInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appInfoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            appInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

