import Foundation

/// Реализация HomeCoordinator
final class HomeCoordinator: Coordinator {
    
    /// Инициализация OnboardingViewController
    override func start() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Конец работы OnboardingViewController
    override func finish() {
        navigationController?.popViewController(animated: true)
    }
}
