//
//  iTunesView.swift
//  iTunes
//
//  Created by Sugat Nagavkar on 16/04/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

import UIKit

class iTunesView: UIView, UITableViewDelegate, UITableViewDataSource {

    //assiged value from the controller
    var viewData = [iTunesStruct]()
    
    let tableView : UITableView = {
            let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //tableView delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        //register tableViewCell
        tableView.register(iTunesCell.self, forCellReuseIdentifier: "itunesCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Draw function - constraints for tableView
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
    
    //MARK:- tableView: numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    //MARK:- tableView: cellForRowAt indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunesCell", for: indexPath) as! iTunesCell
        let item = viewData[indexPath.row]
        cell.nameLabel.text = item.artistName
        cell.setURLString(url: item.artworkUrl100)
        cell.contentType.text = "Apple Music"
        
        return cell
    }
    
    //MARK:- tableView's height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    
    
}















