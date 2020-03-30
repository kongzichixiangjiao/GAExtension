//
//  ViewController.swift
//  GAExtension
//
//  Created by houjianan on 2020/3/28.
//  Copyright © 2020 houjianan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyDelegate = self
        
    }

    @IBAction func a(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func r(_ sender: Any) {
        tableView.ga_reloadData()
    }
}

extension ViewController: UITableViewPlaceHolderDelegate {
    func tableViewPlaceHolderViewOffSetY() -> CGFloat {
        return 100
    }
    
    func tableViewPlaceHolderView() -> UIView {
        let v = GAListPlaceholderView.ga_xibView()
        v.imgName = "scrollView_noData_icon"
        return v
    }
    
    func tableViewEnableScrollWhenPlaceHolderViewShowing() -> Bool {
        return false
    }
    
    func tableViewClickedPlaceHolderViewRefresh() {
        
    }
    
    func tableViewPlaceHolder_NoNetWork_View() -> UIView? {
        return nil
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
     func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ga_dequeueReusableCell(cellClass: ViewCell.self)
        
        return cell
    }
    
}

class ViewCell: UITableViewCell {
    
}
