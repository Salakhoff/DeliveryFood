import Foundation

/// Реализация OrderCoordinator
final class OrderCoordinator: Coordinator {
    
    /// Инициализация OrderCoordinator
    override func start() {
        let vc = OrderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Конец работы OnboardingViewController
    override func finish() {
        navigationController?.popViewController(animated: true)
    }
}
