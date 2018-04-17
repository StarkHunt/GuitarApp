//
//  ViewController.swift
//  iTunes
//
//  Created by Sugat Nagavkar on 16/04/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

import UIKit

//Model for fetching data from the downloaded NSArray
struct iTunesStruct {
    let artistName: String
    let artworkUrl100: String

}


class iTunesViewController: UIViewController{

    //create arrays of the iTunesStruct
    var structArray = [iTunesStruct]()
    
    //instance of iTunesView
    let itunesView : iTunesView = {
            let view = iTunesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        callGetDataWithCompletionHandler()
        buildViews()
    }
    
    
    //MARK:- Constraint for the View
    func buildViews(){
        
        view.addSubview(itunesView)
        NSLayoutConstraint.activate([
            itunesView.topAnchor.constraint(equalTo: view.topAnchor),
            itunesView.leftAnchor.constraint(equalTo: view.leftAnchor),
            itunesView.rightAnchor.constraint(equalTo: view.rightAnchor),
            itunesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    //MARK:- Call getData method with completion handler
    func callGetDataWithCompletionHandler(){
        getData { (data, error) in
            
            if let data = data{
                //print(data)
                
                for valueArray in data{
                    if let value = valueArray as? [String: Any]{
                        if let artistName = value["artistName"] as? String, let artworkUrl100 = value["artworkUrl100"] as? String{
                            self.structArray.append(iTunesStruct(artistName: artistName, artworkUrl100: artworkUrl100))
                        }
                    }
                }
                //pass the Struct Array to View's viewData variable
                self.itunesView.viewData = self.structArray
                
                //Reload iTunesView's tableview on main thread.
                DispatchQueue.main.async {
                    self.itunesView.tableView.reloadData()
                }
            }
        }
    }
    
    //MARK: Network call to the URl to fetch 20 results
    func getData(completion: @escaping (NSArray?, Error?)-> Void){
        
        //url
        let urlString = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/20/explicit.json")
        
        //datatask
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return completion(nil, error)
            }
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]{
                    if let feedArray = json?["feed"] as? [String : Any]{
                        if let resultsArray = feedArray["results"] as? NSArray{
                        completion(resultsArray, nil)
                        }
                    }
                }
            }.resume()
    }
    
    
    
    
    
    

    


}

