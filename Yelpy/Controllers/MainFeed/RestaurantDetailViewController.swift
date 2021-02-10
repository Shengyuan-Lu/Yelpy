//
//  DetailViewController.swift
//  Yelpy
//
//  Created by Memo on 5/26/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
import MapKit

// NOTE: Once you go through the lab this error will dissapear
class RestaurantDetailViewController: UIViewController, MKMapViewDelegate, PostImageViewControllerDelegate {
    

    // ––––– TODO: Configure outlets
    // NOTE: Make sure to set images to "Content Mode: Aspect Fill" on the
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    // LAB 6: Connect MapView + Add annotation view
    @IBOutlet weak var mapView: MKMapView!
    var annotationView: MKAnnotationView!
    
    // Initialize restaurant variable
    var r: Restaurant!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOutlets()
        // 11) purposely wait until last minute to configure this to explain to students delegation!
        // step 10) is running the app
        mapView.delegate = self
    }
    
    // Add image to MapView Annotation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostImageVC" {
            let postImageVC = segue.destination as! PostImageViewController
            // NOTE: PLEASE FOLLOW LAB BEFORE ASKING FOR HELP ON THIS
            postImageVC.delegate = self
        }
    }

    
    // ––––– LAB 6 TODO: Configure outlets :)
    func configureOutlets() {
        nameLabel.text = r.name
        reviewsLabel.text = String(r.reviews)
        starImage.image = Stars.dict[r.rating]!
        headerImage.af.setImage(withURL: r.imageURL!)
        
        // Extra: Add tint opacity to image to make text stand out
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3) //change to your liking
        tintView.frame = CGRect(x: 0, y: 0, width: headerImage.frame.width, height: headerImage.frame.height)

        headerImage.addSubview(tintView)
        
        // MARK: Lab 6 set region for map to be coordinates of restaurant
        // 1) get longitude and latitude from coordinates property
        
        
        
        // test coordinates are being printed
        
        
        // 2) initialize coordinate point for restaurant
        
        
        // 3) initialize region object using restaurant's coordinates
        
        
        // 4) set region in mapView to be that of restaurants
        
        
        // 5) instantiate annotation object to show pin on map
        
        
        // 6) set annotation's properties
        
        
        
        // 7) drop pin on map using restaurant's coordinates
        
        
    }
    
    // MARK: 8) Configure annotation view using protocol method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        return mapView.dequeueReusableAnnotationView(withIdentifier: "removeMe")
        
    }
    
    // MARK: 12) action to execute when user taps annotation views accessory buttons
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // 14) performSegue to PostImageVC
        
    }
    
    // MARK: 19) Conform to PostImageViewDelegate protocol
    func imageSelected(controller: PostImageViewController, image: UIImage) {
        // 9) Add info button to annotation view

    }
    
    
    
    // Unwind segue after user finishes uploading image for map annotation
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }
}
