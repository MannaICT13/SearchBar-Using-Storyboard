//
//  ViewController.swift
//  SearchBar Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 2/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrayOfName = ["Manna","Munna","Lalon","Limon","Shaon"]
    var searchArray = [String]()
    var searching : Bool = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        createSearchBar()
      
       
    }


}




extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if searching {
            return searchArray.count
        }
        else{
             return arrayOfName.count
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if searching{
            cell?.textLabel?.text = searchArray[indexPath.row]
        }else{
            
              cell?.textLabel?.text = arrayOfName[indexPath.row]
        }
      
        
        return cell!
        
    }
    
    
    
}


extension ViewController : UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating{
  
    
    private func createSearchBar(){
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text  else {return}
        
        if searchText == ""{
            //
        }else{
            
            //
            
        }
        
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchArray = arrayOfName.filter({
            $0.prefix(searchText.count) == searchText ||
            $0.localizedCaseInsensitiveContains(searchText)
        })
        searching = true
        tableView.reloadData()
        
    }
    
    

    
    
    
    
    
}

