
import UIKit
import SQLite
import SearchTextField
class LoginVC: UIViewController  {
    
    // MARK: - Variable
    
    var screenH : CGFloat!
    var screenW : CGFloat!
    var userInformationDB = userSql()
    var alert = AlertShow()
    // UiView Variable
    
    
    @IBOutlet weak var logIn: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logIn.typeText("Log In" , typingSpeedPerChar: 0.3) {}
        userInformationDB =  DataBaseManager.usersDB
        style()
    }
    
    // MARK: - Button
    
    //  SignUp
    @IBAction func pressSignupButton(_ sender: Any) {
        
        if DataBaseManager.fristScreenOrNot == true {
            let Storyboard = UIStoryboard(name: "Main",bundle: nil)
            let Signup = Storyboard.instantiateViewController(withIdentifier: Constans.SignupVCID ) as! SignupVC
            DataBaseManager.fristScreenOrNot = true
            self.present(Signup, animated: true, completion: nil)
        }else{
            DataBaseManager.fristScreenOrNot = true
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // Login
    @IBAction func pressLoginButton(_ sender: Any) {
        
        let res = cheekUserInDataBase(UserData: userInformationDB.allUsres)
        if res.0{
            let sb = UIStoryboard(name: "Main",bundle: nil)
            let Profile = sb.instantiateViewController(withIdentifier: Constans.ProfileVCID ) as! UserProfileVc
            Profile.dataOfLoginUser = res.1!
            loginButton.setTitle("Log In", for: .normal)
            self.present(Profile, animated: true, completion: nil)
        }else {
            let myalert = alert.alert()
            myalert.image = #imageLiteral(resourceName: "wrong.png")
            myalert.massage = "Wrong Username or Password"
            present(myalert,animated: true)
        }
        
    }
    
}

