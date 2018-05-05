import UIKit
import ChameleonFramework

// MARK: - Color Themes
protocol ColorThemeableComponents {
    var background: UIColor { get }
    var navigationForeground: UIColor { get }
    var navigationBackground: UIColor { get }
}

struct ColorTheme: ColorThemeableComponents {
    private(set) var background: UIColor
    private(set) var navigationForeground: UIColor
    private(set) var navigationBackground: UIColor
}

struct Themes {
    static var home = ColorTheme(
        background: UIColor.groupTableViewBackground,
        navigationForeground: UIColor.white,
        navigationBackground: UIColor.clear
    )
    
    static var red = ColorTheme(
        background: UIColor(hexString: "#D32F2F")!,
        navigationForeground: UIColor.white,
        navigationBackground: UIColor(hexString: "#D32F2F")!
    )
    
    static var darkGray = ColorTheme(
        background: UIColor.darkGray,
        navigationForeground: UIColor.white,
        navigationBackground: UIColor.darkGray
    )
}
