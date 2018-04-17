//
//  iTunesCell.swift
//  iTunes
//
//  Created by Sugat Nagavkar on 17/04/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

import UIKit

class iTunesCell: UITableViewCell {
    
    //imageViewContainer
    let imageViewContainer : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .purple
        return imageView
        
    }()
    
    //Name Label
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name Label"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    //Media Type
    let contentType : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content Label"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    //MARK:- Draw func
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        buildViews()
    }
    
    //MARK:- Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 0.5)
    }
    
    func buildViews(){
        
        //add subviews to the TableView cell
        addSubview(imageViewContainer)
        addSubview(nameLabel)
        addSubview(contentType)
        
        //constraint for imageViewContainer
        NSLayoutConstraint.activate([
            imageViewContainer.topAnchor.constraint(equalTo: self.topAnchor),
            imageViewContainer.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageViewContainer.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageViewContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.85)
            ])
        
        //constraint for nameLabel
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
        
        //constraint for contentType label
        NSLayoutConstraint.activate([
            contentType.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor),
            contentType.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            contentType.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentType.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
    }
    
    //MARK:- setURLString - to get Image's url and send it to download func
    func setURLString(url: String){
        downloadImage(url: url)
    }
    
    //MARK:- downloadImage- download Image with url on different thread and show it on the imageViewContainer
    func downloadImage(url: String){
        let urlString = url
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let data = data{
                let imageData = NSData(data: data)
                
                DispatchQueue.main.async {
                    self.imageViewContainer.image = UIImage(data: imageData as Data)
                }
            }
            }.resume()
    }
}

