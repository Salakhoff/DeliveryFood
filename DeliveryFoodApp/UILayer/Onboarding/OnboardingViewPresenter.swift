import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

final class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
    
    // MARK: Properties
    
    weak var coordinator: OnboardingCoordinator!
    
    // MARK: Init
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}
