import UIKit

extension UIImage {
    static func backgroundImage(color: UIColor, alpha: CGFloat = 1.0) -> UIImage {
        guard alpha < 1.0, alpha >= 0.0 else {
            return backgroundImageFromColor(color)
        }
        
        let color = color.withAlphaComponent(alpha)
        return backgroundImageFromColor(color)
    }
    
    fileprivate static func backgroundImageFromColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
