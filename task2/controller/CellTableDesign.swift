

import UIKit

class CellTableDesign: UITableViewCell  {
    
    // MARK: - UiView Variable
    
    @IBOutlet weak var imageFilm : UIImageView!
    @IBOutlet weak var nameFilm : UILabel!
    @IBOutlet weak var Description : UITextView!
    
    
    // MARK: - Awake From Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

