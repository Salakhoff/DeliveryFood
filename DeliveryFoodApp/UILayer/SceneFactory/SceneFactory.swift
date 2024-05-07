import UIKit

struct SceneFactory {
    
    // MARK: OnboardingFlow
    
    static func makeOnboardingFlow(
        coordinator: Coordinator,
        navigationController: UINavigationController,
        finishDelegate: CoordinatorFinishDelegate
    ) {
        let onboardingCoordinator = OnboardingCoordinator(
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: finishDelegate
        )
        
        coordinator.addChildCoordinator(onboardingCoordinator)
        
        onboardingCoordinator.start()
    }
    
    // MARK: MakeOnboardingScene
    
    static func makeOnboardingScene(
        coordinator: OnboardingCoordinator
    ) -> OnboardingViewController {
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
            coordinator: coordinator
        )
        let onboardingViewController = OnboardingViewController(
            pages: pages,
            viewOutput: onboardingViewPresenter
        )
        
        return onboardingViewController
    }
    
    // MARK: MakeMainFlow
    
    static func makeMainFlow(coordinator: CoordinatorProtocol, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: ""),
            tag: 0
        )
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(
            title: "Order",
            image: UIImage(systemName: ""),
            tag: 0
        )
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(
            title: "My List",
            image: UIImage(systemName: ""),
            tag: 0
        )
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: ""),
            tag: 0
        )
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController
        ]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        return tabBarController
    }
}
