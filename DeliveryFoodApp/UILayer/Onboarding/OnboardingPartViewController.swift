import UIKit

final class OnboardingPartViewController: UIViewController {
    
    // MARK: Views
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let stackView = UIStackView()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupAppearance()
        setupLayout()
    }
    
    // MARK: Configure
    
    func configure(onboardingModel: OnboardingModel) {
        imageView.image = UIImage(named: onboardingModel.imageString)
        titleLabel.text = onboardingModel.title
        descriptionLabel.text = onboardingModel.description
    }
}

// MARK: - EmbedViews

private extension OnboardingPartViewController {
    func embedViews() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        view.addSubview(stackView)
    }
}

// MARK: - SetupAppearance

private extension OnboardingPartViewController {
    func setupAppearance() {
        view.backgroundColor = AppColors.accentOrange
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.font = UIFont.Roboto.bold.size(of: 24)
        descriptionLabel.font = UIFont.Roboto.regular.size(of: 14)
        
        titleLabel.textColor = AppColors.white
        descriptionLabel.textColor = AppColors.white
        
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        titleLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
    }
}

// MARK: - SetupLayout

private extension OnboardingPartViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
        ])
    }
}
