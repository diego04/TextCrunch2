//
//  ProfileViewController.swift
//  TextCrunch
//
//  Created by George Coomber on 2015-02-02.
//  Copyright (c) 2015 Text Crunch. All rights reserved.
//

import UIKit

class SellerListingViewController: UIViewController, UITableViewDelegate{

    @IBOutlet weak var inactiveSwitch: UISwitch!
    
    
    @IBOutlet weak var activeSwitch: UISwitch!
    
    @IBOutlet weak var listingTable: UITableView!
    
    @IBOutlet weak var sellButton: UIButton!
    
    var tableDataSource : SellerListingViewTableDataSource
    var selectedListing: Listing?
    
    
    required init(coder aDecoder: NSCoder) {
        selectedListing = nil
        tableDataSource = SellerListingViewTableDataSource()
        //We initialize the table's data source here because of some issues with
        //it being deallocated while the table was still active, causing a crash.
        //For an unknown reason the table view was not storing a strong reference to
        //the data source and it was being unallocated.
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the back navigation button in this views
		self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = nil
        self.listingTable!.dataSource = tableDataSource
        self.listingTable!.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func switchClicked(sender: AnyObject) {
        if inactiveSwitch.on && activeSwitch.on{
            tableDataSource.modifyDisplay(.ALL)
            listingTable.reloadData()
        } else if inactiveSwitch.on && !activeSwitch.on{
            tableDataSource.modifyDisplay(.INACTIVE)
            listingTable.reloadData()
        } else if !inactiveSwitch.on && activeSwitch.on {
            tableDataSource.modifyDisplay(.ACTIVE)
            listingTable.reloadData()
        } else if !inactiveSwitch.on && !activeSwitch.on{
            tableDataSource.modifyDisplay(.NONE)
            listingTable.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedListing = tableDataSource.currentListings[indexPath.row]
        self.performSegueWithIdentifier("SellerViewCell", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "SellerViewCell") {
            var svc = segue.destinationViewController as ListingViewController;
            // Hide back bar to avoid resubmission of listing
            // Only occurs when ViewListing is accessed via EditListing
            svc.listing = selectedListing
        }
        super.prepareForSegue(segue, sender: sender)
    }



}
