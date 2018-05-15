//
//  VideoTableViewController.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/14.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {
    let cellReuseIdentifier = "VideoCell"
    let viewModel: VideoViewModel = VideoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 20;
        self.showLoading(show: true)
        viewModel.loadingDelegate = self
        viewModel.nextStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! VideoCell
        cell.setupUI(model: viewModel.modelAtIndex(indexPath: indexPath) as! VideoModel)
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.isLastModel(indexPath: indexPath) {
            self.showLoading(show: true)
            viewModel.nextStatus()
        }
    }
}

extension VideoTableViewController: WebServiceLoadingDelegate {
    func webServiceLoadingDone() {
        self.showLoading(show: false)
        self.tableView.reloadData()
    }
    
    func webServiceLoadingFail(code: Int, message: String) {
        self.showLoading(show: false)
        self.showAlertWithConfirmTitle(title: "Error(\(code))", message: message)
    }
}
