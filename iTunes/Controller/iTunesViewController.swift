//
//  ViewController.swift
//  iTunes
//
//  Created by Sugat Nagavkar on 16/04/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

import UIKit

class iTunesViewController: UIViewController {

    let itunesView : iTunesView = {
            let view = iTunesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .red
        
        buildViews()
    }
    
    func buildViews(){
        
        view.addSubview(itunesView)
        NSLayoutConstraint.activate([
            itunesView.topAnchor.constraint(equalTo: view.topAnchor),
            itunesView.leftAnchor.constraint(equalTo: view.leftAnchor),
            itunesView.rightAnchor.constraint(equalTo: view.rightAnchor),
            itunesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    


}

