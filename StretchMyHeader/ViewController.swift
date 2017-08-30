//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Jaewon Kim on 2017-08-29.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var newsArray:[News] = []
    fileprivate let kTableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!


}

    // MARK: - Life Cycle
extension ViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoSizeCellHegiht()
        
        initNews()
        
        setupTableView()
        
        updateHeaderView()
        tableView.delegate = self

    }
    
}



    //MARK: - scrollview
extension ViewController:UIScrollViewDelegate,UITableViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}


    //MARK: - tableView DataSource Methods
extension ViewController:UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell{
            
            configureCell(cell: cell, row: indexPath.row)
            
            return cell
        } else {
            print("error")
            return UITableViewCell()
        }
    }
}

// MARK: - fucntions
extension ViewController{
    func configureCell(cell:CustomTableViewCell, row:Int){
        
        cell.categoryLabel.textColor = newsArray[row].category.color()
        cell.categoryLabel.text = newsArray[row].category.rawValue
        cell.headLineLabel.text = newsArray[row].headLine
    }
    
    func autoSizeCellHegiht(){
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func initNews() {
        let news1:News = News(category: Category.world,
                              headLine: "Climate change protests, divestments meet fossil fuels realities")
        
        let news2:News = News(category: Category.europe,
                              headLine: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        
        let news3:News = News(category: Category.middelEast,
                              headLine: "Summary: Airstrikes boost Islamic State, FBI director warns more hostages possible")
        
        let news4:News = News(category: Category.africa,
                              headLine: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        
        let news5:News = News(category: Category.asiaPacific,
                              headLine: "Despite UN ruling, Japan seeks backing for whale hunting")
        
        let news6:News = News(category: Category.americas,
                              headLine: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        
        let news7:News = News(category: Category.world,
                              headLine: "South Africa in $40 billion deal for Russian nuclear reactors")
        
        let news8:News = News(category: Category.europe,
                              headLine: "'One million babies' created by EU student exchanges")
        
        newsArray = [news1,news2,news3,news4,news5,news6,news7,news8]
        
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }
    
    func setupTableView(){
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
    }
}


