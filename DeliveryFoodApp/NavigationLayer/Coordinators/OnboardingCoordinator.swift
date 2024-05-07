import Foundation

/// Реализация OnboardingCoordinator
final class OnboardingCoordinator: Coordinator {
    
    /// Инициализация OnboardingViewController
    override func start() {
        let vc = OnboardingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Конец работы OnboardingViewController
    override func finish() {
        navigationController?.popViewController(animated: true)
    }
}
