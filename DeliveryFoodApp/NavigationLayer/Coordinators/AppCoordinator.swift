import UIKit

/// Создание координатора, который будет использоваться со сценой
final class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    
    /// Показывается, какой VC будет показан
    override func start() {
        userStorage.passedOnboarding ? showMainFlow() : showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator свою работу")
    }
}

// MARK: Navigation methods

extension AppCoordinator {
    /// Реализация OnboardingFlow
    func showOnboardingFlow() {
        guard let navigationController else { return }
        
        let onboardingCoordinator = OnboardingCoordinator(
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: self
        )
        
        addChildCoordinator(onboardingCoordinator)
        
        onboardingCoordinator.start()
    }
    
    /// Реализация MainFlow
    func showMainFlow() {
        guard let navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: ""),
            tag: 0
        )
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(
            title: "Order",
            image: UIImage(systemName: ""),
            tag: 0
        )
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(
            title: "My List",
            image: UIImage(systemName: ""),
            tag: 0
        )
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: ""),
            tag: 0
        )
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController
        ]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
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
