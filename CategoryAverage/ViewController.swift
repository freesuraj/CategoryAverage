//
//  ViewController.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    
    var spinner: UIActivityIndicatorView!
    let categoryType: String = "Air Conditioners"

    var processedItems: [Product]! {
        didSet {
            tableView.reloadData()
            let validProducts = processedItems.filter { $0.category == self.categoryType }
            statusLabel.text = "Found " + "\(validProducts.count)" + " items out of \(processedItems.count)"
            if validProducts.count > 0 {
                averageLabel.text = String(format: "%.2f", Product.averageCubicWeight(validProducts))
            } else {
                averageLabel.text = "--"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.hidesWhenStopped = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: spinner)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reload))
        categoryLabel.text = "Category: " + categoryType
        reload()
    }
    
    func reload() {
        processedItems = []
        let firstPage = Constant.firstPage
        readProducts(categoryName: self.categoryType, page: firstPage)
    }
    
    func readProducts(categoryName: String, page: String) {
        self.title = "Processing page \(page) "
        spinner.startAnimating()
        ProductRequest(pageUrl: page)?.fetch({ [weak self] page in
            if let products = page?.products {
                self?.processedItems.append(contentsOf: products)
            }
            if let next = page?.nextUrl {
                self?.readProducts(categoryName: categoryName, page: next)
            } else {
                self?.title = "Kogan!"
                self?.spinner.stopAnimating()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Processed Items"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return processedItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        let cellIdentifier = "TableViewCell"
        if let validCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            cell = validCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        let product = processedItems[indexPath.row]
        cell.textLabel?.text = product.title
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = String(format: "%@ (%.2f)", product.category, product.cubicWeight)
        cell.textLabel?.textColor = product.category == self.categoryType ? .red : .black
        return cell
    }
    
}

