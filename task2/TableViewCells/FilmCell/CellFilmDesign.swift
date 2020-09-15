

import UIKit

class FilmDesignCell: UITableViewCell  {
    
    // MARK: - UiView Variable
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmName: UILabel!
    @IBOutlet weak var filmDescription: UITextView!
    
    
    // MARK: - Awake From Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

