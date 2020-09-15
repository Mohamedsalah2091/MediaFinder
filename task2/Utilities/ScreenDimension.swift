





import UIKit

struct ScreenDimension{
    
    // MARK: - Screen Height
    
    static func ScreenHeight() -> CGFloat {
        return CGFloat(UIScreen.main.fixedCoordinateSpace.bounds.height)
    }
    
    // MARK: - Screen Width
    
    static func ScreenWidth() -> CGFloat {
        return CGFloat(UIScreen.main.fixedCoordinateSpace.bounds.width)
    }
    
    // MARK: - Set Width And Height
    
    static func setWidthAndHeight(UIitem:AnyObject,width:CGFloat,height:CGFloat){
        UIitem.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        UIitem.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    }
    
    
    
}
