import UIKit

/// Реализация OnboardingCoordinator
final class OnboardingCoordinator: Coordinator {
    
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
        var pages = [UIViewController]()
        
        let firstVC = OnboardingPartViewController()
        let firstModel = OnboardingModel(
            imageString: "chicken",
            title: "Delicious Food",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        )
        firstVC.configure(onboardingModel: firstModel)
        
        let secondVC = OnboardingPartViewController()
        let secondModel = OnboardingModel(
            imageString: "car",
            title: "Fast Shipping",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        )
        secondVC.configure(onboardingModel: secondModel)
  
        
        let thirdVC = OnboardingPartViewController()
        let thirdModel = OnboardingModel(
            imageString: "medal",
            title: "Certificate Food",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        )
        thirdVC.configure(onboardingModel: thirdModel)
        
     
        let fourthVC = OnboardingPartViewController()
        let fourthModel = OnboardingModel(
            imageString: "creditCard",
            title: "Payment Online",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
            
        )
        fourthVC.configure(onboardingModel: fourthModel)
       
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let onboardingViewPresenter = OnboardingViewPresenter(
            coordinator: self
        )
        let onboardingViewController = OnboardingViewController(
            pages: pages,
            viewOutput: onboardingViewPresenter
        )
        
        navigationController?.pushViewController(onboardingViewController, animated: true)
    }
}
