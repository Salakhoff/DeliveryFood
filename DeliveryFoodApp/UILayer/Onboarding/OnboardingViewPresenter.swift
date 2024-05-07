import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

final class OnboardingViewPresenter: OnboardingViewOutput {
    
    // MARK: Properties
    
    private let userStorage = UserStorage.shared
    weak var coordinator: OnboardingCoordinator!
    
    // MARK: Init
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    // MARK: Methods
    
    func onboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}
