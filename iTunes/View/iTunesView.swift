//
//  iTunesView.swift
//  iTunes
//
//  Created by Sugat Nagavkar on 16/04/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

import UIKit

class iTunesView: UIView, UITableViewDelegate, UITableViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let tableView : UITableView = {
            let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(iTunesCell.self, forCellReuseIdentifier: "itunesCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
            super.draw(rect)
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunesCell", for: indexPath) as! iTunesCell
        cell.backgroundColor = .yellow
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    

}

class iTunesCell: UITableViewCell {
    
    let imageViewContainer : UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .purple
        return imageView
        
    }()
    
    let nameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name Label"
        return label
    }()
    
    let contentType : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content Label"
        return label
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        buildViews()
    }
    
    func buildViews(){
        addSubview(imageViewContainer)
        addSubview(nameLabel)
        addSubview(contentType)
        
        NSLayoutConstraint.activate([
            imageViewContainer.topAnchor.constraint(equalTo: self.topAnchor),
            imageViewContainer.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageViewContainer.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageViewContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
        
        NSLayoutConstraint.activate([
            contentType.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor, constant: 8),
            contentType.leftAnchor.constraint(equalTo: self.nameLabel.rightAnchor, constant: 8),
            contentType.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            contentType.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
    }
}














