import UIKit

/// Реализация OnboardingCoordinator
final class OnboardingCoordinator: Coordinator {
    
    // MARK: Properties
    
    private let factory = SceneFactory.self
    
    // MARK: Init
    
    /// Инициализация OnboardingViewController
    override func start() {
        showOnboarding()
    }
    
    /// Конец работы OnboardingViewController
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        let onboardingViewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(onboardingViewController, animated: true)
    }
}
