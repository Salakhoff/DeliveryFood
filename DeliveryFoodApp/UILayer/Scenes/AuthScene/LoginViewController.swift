import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: Views
    
    private let bottomView = BottomView()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupAppearance()
        setupLayout()
        
        bottomView.facebookButtomAction = facebookButtonTapped
        bottomView.googleButtomAction = googleButtonTapped
    }
    
    // MARK: Actions
    
    private func facebookButtonTapped() {
        print("Нажали на facebook")
    }
    
    private func googleButtonTapped() {
        print("Нажали на google")
    }
}

// MARK: - EmbedViews

private extension LoginViewController {
    func embedViews() {
        view.addSubview(bottomView)
    }
}

// MARK: - SetupAppearance

private extension LoginViewController {
    func setupAppearance() {
        view.backgroundColor = .white
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - SetupLayout

private extension LoginViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
