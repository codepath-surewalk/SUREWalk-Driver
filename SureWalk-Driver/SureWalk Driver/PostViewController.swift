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
        /*
        let query = PFQuery(className: "Request")
        query.order(byDescending: "createdAt")
        //  query.includeKey("author")
        //query.limit = 20
        
        query.findObjectsInBackground { (requests: [PFObject]?, error: Error?) -> Void in
            if let requests = requests
            {
                self.requests = requests
                self.tableView.reloadData()
            }
            else
            {
                print(error!.localizedDescription)
            }
 */
        
    }
    @IBAction func onLogout(_ sender: Any)
    {
        print("Logging out current user")
        PFUser.logOutInBackground { (error: Error?) in
            if error != nil
            {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
