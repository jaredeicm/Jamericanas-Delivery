//
//  ViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 23/02/22.
//
import GooglePlaces
import UIKit
import SwiftUI
class ViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    
    
    @IBOutlet weak var placeSelected: UILabel!
    var resultsViewController: GMSAutocompleteResultsViewController!
  var searchController: UISearchController!
  var resultView: UITextView?
  
    var orderPlace : [String] = ["","","",""]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderSegue"{
            let VCOrder =  segue.destination as! OrderViewController
            VCOrder.placeDetailText = placeSelected.text!
            VCOrder.orderPlace = orderPlace
        }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()

    resultsViewController = GMSAutocompleteResultsViewController()
    resultsViewController.delegate = self
        
        let filter = GMSAutocompleteFilter()
                filter.type = .establishment
                filter.countries = ["BR"]
                resultsViewController.autocompleteFilter = filter
                
        let fields: GMSPlaceField = [ .name, .formattedAddress]
                resultsViewController.placeFields = fields

    searchController = UISearchController(searchResultsController: resultsViewController)
    searchController?.searchResultsUpdater = resultsViewController

   // let subView = UIView(frame: CGRect(x: 0, y: 105.0, width: 350.0, height: 45.0))

        //  ESTUDAR ESSA PARTE PLACE PHOTOS
        
//        GMSPlacesClient?.fetchPlace(fromPlaceID: "INSERT_PLACE_ID_HERE",
//                                 placeFields: fields,
//                                 sessionToken: nil, callback: {
//          (place: GMSPlace?, error: Error?) in
//        if let place = place {
//            // Get the metadata for the first photo in the place photo metadata list.
//            let photoMetadata: GMSPlacePhotoMetadata = place.photos![0]
//
//            // Call loadPlacePhoto to display the bitmap and attribution.
//            self.placesClient?.loadPlacePhoto(photoMetadata, callback: { (photo, error) -> Void in
//              if let error = error {
//                // TODO: Handle the error.
//                print("Error loading photo metadata: \(error.localizedDescription)")
//                return
//              } else {
//                // Display the first image and its attributions.
//                self.imageView?.image = photo;
//                self.lblText?.attributedText = photoMetadata.attributions;
//              }
//            }
//                                              }

    subView.addSubview((searchController?.searchBar)!)
    view.addSubview(subView)
    searchController?.searchBar.sizeToFit()
    searchController?.hidesNavigationBarDuringPresentation = false

    // When UISearchController presents the results view, present it in
    // this view controller, not one further up the chain.
    definesPresentationContext = true
        
  }
//    func PushView (sender: AnyObject){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "OrderViewController")
//        self.navigationController!.pushViewController(vc, animated: true)
//    }
    
}

// Handle the user's selection.
extension ViewController: GMSAutocompleteResultsViewControllerDelegate {
  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didAutocompleteWith place: GMSPlace) {
    searchController?.isActive = false
    // Do something with the selected place.
    print("Place name: \(place.name)")
    print("Place address: \(place.formattedAddress)")
    //print("Place attributions: \(place.attributions)")
     // let placeSelected = place.name + place.formattedAddress)
      var placeName : String = String(place.name!)
      placeSelected.text = (placeName + "\n \n" + String(place.formattedAddress!))
      orderPlace[0] = place.name!
      orderPlace[1] = place.formattedAddress!
      //TENTAR NOVAMENTE MAIS TARDE
//     self.performSegue(withIdentifier: "orderSegue", sender: self)
//      var viewController: UIViewController = self.storyboard!.instantiateViewController(withIdentifier: "OrderView") //View 2 é o id que vc especificou na sua View Controller
//
      dismiss(animated: true) {
          
      self.performSegue(withIdentifier: "orderSegue", sender: self)
      }
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let vc = storyboard.instantiateViewController(withIdentifier:"OrderView") as! OrderViewController
//      //self.navigationController!.pushViewController(vc, animated: true)
//      vc.modalPresentationStyle = .fullScreen
//      present(vc, animated: true, completion: nil)
  }

  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didFailAutocompleteWithError error: Error){
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
}
