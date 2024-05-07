import Foundation

/// Реализация ListCoordinator
final class ListCoordinator: Coordinator {
    
    /// Инициализация ListCoordinator
    override func start() {
        let vc = ListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Конец работы OnboardingViewController
    override func finish() {
        navigationController?.popViewController(animated: true)
    }
}
