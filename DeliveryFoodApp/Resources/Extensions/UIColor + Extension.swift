import UIKit

extension UIColor {
    /// Для работы с hex данными
    /// - Parameter rgbValue: Передается число Hex. Обязательно с добавлением 0x.
    /// - Returns: Возврощается цвет
    func hex(_ rgbValue: UInt64) -> UIColor {
        UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
