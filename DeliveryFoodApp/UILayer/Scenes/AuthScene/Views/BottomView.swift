import UIKit

final class BottomView: UIView {
    
    // MARK: Views
    
    private let label = UILabel()
    private let lineView = UIView()
    private let hamburgerImageView = UIImageView()
    private let faceBookButton = UIButton()
    private let googleButton = UIButton()
    private let buttonsStackView = UIStackView()
    
    // MARK: Init
    
    init() {
        super.init(frame: .zero)
        embedViews()
        setupAppearance()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
    var facebookButtomAction: (() -> Void)?
    var googleButtomAction: (() -> Void)?
}

// MARK: - EmbedViews

private extension BottomView {
    func embedViews() {
        buttonsStackView.addArrangedSubview(faceBookButton)
        buttonsStackView.addArrangedSubview(googleButton)
        
        addSubview(lineView)
        addSubview(label)
        addSubview(hamburgerImageView)
        addSubview(buttonsStackView)
    }
}

// MARK: - SetupAppearance

private extension BottomView {
    func setupAppearance() {
        backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        hamburgerImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.backgroundColor = AppColors.colorBottom.withAlphaComponent(0.3)
        
        label.text = "Or connect with"
        label.font = UIFont.Roboto.regular.size(of: 14)
        label.textAlignment = .left
        label.textColor = AppColors.colorBottom
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        hamburgerImageView.image = UIImage(named: "hamburger")
        hamburgerImageView.contentMode = .scaleAspectFill
        
        faceBookButton.setImage(UIImage(named: "facebook"), for: .normal)
        faceBookButton.addTarget(
            self,
            action: #selector(facebookButtonTap)
            , for: .touchUpInside
        )
        
        googleButton.setImage(UIImage(named: "google"), for: .normal)
        googleButton.addTarget(
            self,
            action: #selector(googleButtonTap)
            , for: .touchUpInside
        )
    }
}

// MARK: - SetupLayout

private extension BottomView {
    func setupLayout() {
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 2),
            
            label.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            label.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: lineView.trailingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            buttonsStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            
            hamburgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hamburgerImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            hamburgerImageView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 12),
            hamburgerImageView.trailingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: -77)
        ])
    }
}

private extension BottomView {
    @objc func facebookButtonTap() {
        facebookButtomAction?()
    }
    
    @objc func googleButtonTap() {
        googleButtomAction?()
    }
}
