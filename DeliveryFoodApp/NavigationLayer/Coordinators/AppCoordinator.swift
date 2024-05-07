import UIKit

/// Создание координатора, который будет использоваться со сценой
final class AppCoordinator: Coordinator {
    
    // MARK: Properties
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    /// Показывается, какой VC будет показан
    override func start() {
        showOnboardingFlow()
//        userStorage.passedOnboarding ?
//        showMainFlow() : showOnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator закончил свою работу")
    }
}

// MARK: Navigation methods

extension AppCoordinator {
    /// Реализация OnboardingFlow
    func showOnboardingFlow() {
        guard let navigationController else { return }
        factory.makeOnboardingFlow(
            coordinator: self,
            navigationController: navigationController,
            finishDelegate: self)
    }
    
    /// Реализация MainFlow
    func showMainFlow() {
        guard let navigationController else { return }
        
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        
        navigationController.pushViewController(tabBarController, animated: false)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        case.onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
