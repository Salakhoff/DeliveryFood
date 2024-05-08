import UIKit

enum FBButtonColorShemes {
    case white
    case orange
    case grey
}

final class FDButton: UIButton {
    
    // MARK: Properties
     
    var action: (() -> Void)?
    
    // MARK: Init
    
    init(buttonScheme: FBButtonColorShemes, title: String) {
        super.init(frame: .zero)
        setupAppearance()
        setColorButton(scheme: buttonScheme)
        setTitle(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setColorButton(scheme: FBButtonColorShemes) {
        switch scheme {
        case .white:
            backgroundColor = AppColors.white
            setTitleColor(AppColors.accentOrange, for: .normal)
        case .orange:
            backgroundColor = AppColors.accentOrange
            setTitleColor(AppColors.white, for: .normal)
        case .grey:
            backgroundColor = AppColors.gray
            setTitleColor(AppColors.black, for: .normal)
        }
    }
    
    public func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
    
    @objc func buttonPressed() {
        guard let action else { return }
        action()
    }
}

// MARK: - SetupAppearance

private extension FDButton {
    func setupAppearance() {
        backgroundColor = .clear
        
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = .Roboto.bold.size(of: 18)
        layer.cornerRadius = 12
        
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}
