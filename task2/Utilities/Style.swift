




import UIKit

struct Style{
    
    // MARK: - UIButton Style
    
    static func Button(buttons:[UIButton],height:CGFloat, width:CGFloat,setTitle:[String],titleFount:UIFont,cornerRadius:CGFloat,tintColor:UIColor,backgroundColor:UIColor,shadowOpacity:Float,shadowRadius:CGFloat,CornerRadius:CGFloat){
        for (button,title) in zip(buttons,setTitle) {
            ScreenDimension.setWidthAndHeight(UIitem:button,width:width,height:height)
            button.setTitle(title, for: .normal)
            button.titleLabel!.font = titleFount
            button.layer.cornerRadius = cornerRadius
            button.tintColor = tintColor
            button.backgroundColor = backgroundColor
            button.layer.shadowOpacity = shadowOpacity
            button.layer.shadowRadius = shadowRadius
            button.layer.cornerRadius = CornerRadius
        }
    }
    
    // MARK: - UITextField Style
    
    static func UITextField (TextFields:[UITextField] ,height:CGFloat, width:CGFloat,titleFount:UIFont,cornerRadius:CGFloat,shadowOpacity:Float,shadowRadius:CGFloat,CornerRadius:CGFloat){
        for TextField in TextFields{
            ScreenDimension.setWidthAndHeight(UIitem:TextField,width:width,height:height)
            TextField.font = titleFount
            TextField.layer.shadowOpacity = shadowOpacity
            TextField.layer.shadowRadius = shadowRadius
            TextField.layer.cornerRadius = CornerRadius
        }
    }
    
    
    
}
