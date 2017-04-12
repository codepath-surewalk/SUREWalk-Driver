//
//  PostViewController.swift
//  SureWalk Driver
//
//  Created by Rohan Trivedi on 3/27/17.
//  Copyright © 2017 Rohan Trivedi. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var requests: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool)
    {
        getRequests()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let requests = requests
        {
            return requests.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! PostCellTableViewCell
        
        if requests != nil
        {
            let request = requests![indexPath.row]
            cell.request = request
        }
        
        return cell
    }
    func getRequests()
    {
        API.loadData(items: 20, success: { (requests: [PFObject]) in
            self.requests = requests
            self.tableView.reloadData()
            print(requests.count)
        }) { (error: Error) in
            print(error.localizedDescription)
        }
    }
    @IBAction func onLogout(_ sender: Any)
    {
        PFUser.logOutInBackground { (error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("logging out")
                NotificationCenter.default.post(name: Notification.Name(rawValue: "UserLogout"), object: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("hi i'm runnning")
        if segue.identifier == "postDetailViewSegue" {
//            let postDetailViewController = segue.destination as! PostDetailViewController
//            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
//            
//            let request = requests?[indexPath!.row]
//            
//            let rider = request?["rider"] as! PFUser
//            let firstName = rider["firstName"] as? String
//            let lastName = rider["lastName"] as? String
            let postDetailViewController = segue.destination as! PostDetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            
            let request = requests?[indexPath!.row]
            
            //set name
            let rider = request?["rider"] as! PFUser
            let firstName = rider["firstName"] as? String
            let lastName = rider["lastName"] as? String
            let name = firstName! + " " + lastName!
            postDetailViewController.name = name
            //set rider location
            let locationLongitude = request?["locationLongitude"] as! Double
            let locationLatitude = request?["locationLatitude"] as! Double
            postDetailViewController.locationLatitude = locationLatitude
            postDetailViewController.locationLongitude = locationLongitude
            //set destination location
            let destinationLongitude = request?["destinationLongitude"] as! Double
            let destinationLatitude = request?["destinationLatitude"] as! Double
            postDetailViewController.destinationLatitude = destinationLatitude
            postDetailViewController.destinationLongitude = destinationLongitude
            //set date
            let date = request?["date"] as? String
            postDetailViewController.dateRequested = date
            //set time
            let time = request?["time"] as? String
            postDetailViewController.timeRequested = time
            //send phone number
            let phoneNumber = rider["phone"] as? Int
            postDetailViewController.phoneNumber = phoneNumber
        } else if segue.identifier == "logoutSegue" {
            print("derp")
        }
        
        
        
        

    }

}
