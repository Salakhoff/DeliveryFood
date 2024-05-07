import Foundation

/// Реализация ProfileCoordinator
final class ProfileCoordinator: Coordinator {
    
    /// Инициализация ProfileCoordinator
    override func start() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Конец работы ProfileCoordinator
    override func finish() {
        navigationController?.popViewController(animated: true)
    }
}
