import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

final class OnboardingViewPresenter: OnboardingViewOutput {
    
    // MARK: Properties
    
    weak var coordinator: OnboardingCoordinator!
    
    // MARK: Init
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
}
