//
//  PostDetailViewController.swift
//  SureWalk Driver
//
//  Created by Rohan Trivedi on 4/4/17.
//  Copyright © 2017 Rohan Trivedi. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var nameLabelB: UILabel!
    public var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabelB.text = name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
