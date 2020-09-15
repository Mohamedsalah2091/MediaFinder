


import UIKit
import MapKit
import CoreLocation



protocol SendingLocationDelegate {
    func dataLocation(Location: String ,  dataOfLoginUser : User )
}

class MapViewVC: UIViewController{
    
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var delegate: SendingLocationDelegate?
    var dataOfLoginUser = User()
    var dataBase = userSql()
    var geocoder = CLGeocoder()
    let LocationManger = CLLocationManager()
    let regionInMeters: Double = 10000
    var previousLocation : CLLocation?
    var fristScreenOrNot : Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    
    
    func checkLocationServices(){
        // Here we cheek if the user open the or not the Location Serves
        if  CLLocationManager.locationServicesEnabled(){
            SetUpLocationManger()
            cheekAuthorizationStatus()
        }else{
            CreateAlert(title: "Services Error",message: "please open Location Services")
        }
    }
    
    // MARK: - Press Detection
    
    @IBAction func gestureRecog(_ sender: UIGestureRecognizer) {
        
        if sender.state == .ended{
            let locationInView = sender.location(in: MapView)
            let tappedCoordinate = MapView.convert(locationInView, toCoordinateFrom: MapView)
            addAnnotation(location: tappedCoordinate)
            
        }
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        CreateMapAlert(message: addressLabel.text!)
    }
    
    
    
    
}

extension MapViewVC : CLLocationManagerDelegate {
    
    // MARK: - 4 - > ??
    
    //   it will call when user change this location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        MapView.setRegion(region, animated: true)
    }
    
    // it will call when user change the  Authorization Status
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        cheekAuthorizationStatus()
    }
    
    func SetUpLocationManger(){
        LocationManger.delegate = self
        LocationManger.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // MARK: - Create Alert
    
    func CreateAlert(title : String , message: String ){
        let  alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let  action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)})
        alert.addAction(action)
        self.present(alert , animated: true ,completion: nil)
    }
    
    
    // MARK: - Cheek Authorization Status
    
    // Cheek user Authorization choose
    func cheekAuthorizationStatus(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways: // ->  get Location however it is in the back ground
            MapView.showsUserLocation = true
            LocationManger.startUpdatingLocation()
            
            
        case .authorizedWhenInUse: // ->get Location only when it is open
            SetUpLocationManger()
            //  previousLocation = getCenterLocation(for: MapView)
            
        case .denied: // -> user refuse to give you the permition to access services so he must give permition from setting
            CreateAlert(title: "Application Locked",message: "To use App Location Services go to setting and allow it")
            
        case .notDetermined: // -> user do not chose allow or not (Frist time)
            LocationManger.requestWhenInUseAuthorization()
            
        case .restricted: // -> hea
            break
        default:
            break
            
        }
        
    }
    
    // MARK: - 1 - > ??
    
    func addAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        geocode(lat: location.latitude, lng: location.longitude)
        
    }
    func geocode( lat : Double , lng : Double ){
        let location = CLLocation(latitude: lat, longitude: lng)
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            
            self.processResponse(withPlacemarks: placemarks, error: error)
        }
    }
    
    
}

// GioCode
extension MapViewVC: MKMapViewDelegate {
    
    // MARK: - 2 - > ??
    
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        
        if let placemarks = placemarks, let placemark = placemarks.first {
            addressLabel.text = placemark.compactAddress
            self.delegate?.dataLocation(Location: addressLabel.text!,dataOfLoginUser : dataOfLoginUser)
            
            
        } else {
            addressLabel.text = "No Matching Addresses Found"
        }
    }
    
    func CreateMapAlert(message: String){
        
        let alert = UIAlertController(title:"Is that the correct address ?", message: message, preferredStyle: .alert)
        var  action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
        )
        alert.addAction(action)
        action = UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        )
        alert.addAction(action)
        self.present(alert , animated: true ,completion: nil )
        
    }
    
    
}

extension CLPlacemark {
    
    // MARK: - 3 - > ??
    
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let street = thoroughfare {
                result += ", \(street)"
            }
            if let city = locality {
                result += ", \(city)"
            }
         
            return result
        }
        
        return nil
    }
    
}
