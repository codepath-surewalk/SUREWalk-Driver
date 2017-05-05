//
//  PostDetailViewController.swift
//  SureWalk Driver
//
//  Created by Rohan Trivedi on 4/4/17.
//  Copyright © 2017 Rohan Trivedi. All rights reserved.
//

import UIKit
import ParseUI
import MapKit
import MessageUI


class PostDetailViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var nameLabelB: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    public var name: String!
    public var locationLatitude: Double!
    public var locationLongitude: Double!
    public var destinationLatitude: Double!
    public var destinationLongitude: Double!
    public var dateRequested: String!
    public var timeRequested: String!
    public var phoneNumber: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set Name of Rider
        nameLabelB.text = name
        //Set Date Requested
        dateLabel.text = dateRequested
        //Set Time Requested
        timeLabel.text = timeRequested
        //Set Point for Rider Location
        let spanA:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let locationA:CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationLatitude, locationLongitude)
        let regionA: MKCoordinateRegion = MKCoordinateRegionMake(locationA, spanA)
        map.setRegion(regionA, animated: true)
        let annotationA = MKPointAnnotation()
        annotationA.coordinate = locationA
        annotationA.title = "Rider Location"
        map.addAnnotation(annotationA)
        //Set Point for Rider Destination
        let spanB:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let locationB:CLLocationCoordinate2D = CLLocationCoordinate2DMake(destinationLatitude, destinationLongitude)
        let regionB: MKCoordinateRegion = MKCoordinateRegionMake(locationB, spanB)
        map.setRegion(regionB, animated: true)
        let annotationB = MKPointAnnotation()
        annotationB.coordinate = locationB
        annotationB.title = "Rider Destination"
        map.addAnnotation(annotationB)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        
        if annotation.title! == "My Place" {
            
            annotationView.pinTintColor = UIColor.green
            
        } else {
            
            annotationView.pinTintColor = UIColor.red
        }
        
        
        return annotationView
    }
    
    @IBAction func onAccept(_ sender: AnyObject)
    {
        let msgVC = MFMessageComposeViewController()
        msgVC.body = "Your ride has been accepted!"
        msgVC.recipients = [String(phoneNumber)]
        msgVC.messageComposeDelegate = self
        
        self.present(msgVC, animated: true) { 
            
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        
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
