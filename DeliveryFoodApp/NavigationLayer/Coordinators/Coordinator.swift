import UIKit

/// Описываются, какие координаты у нас есть
enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

/// Интерфейс координатора
protocol CoordinatorProtocol: AnyObject {
    /// Указывается тип координатора
    var type: CoordinatorType { get }
    /// Указывается дочерние коордианторы
    var childCoordinators: [CoordinatorProtocol] { get set }
    /// Указывается NavigationController
    var navigationController: UINavigationController? { get set }
    /// Делегируем действия, которые будут выполняться после завершения работы с флоу
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    /// Начало работы координатора
    func start()
    /// Конец работы координатора
    func finish()
}

extension CoordinatorProtocol {
    /// Добавление дочернего координатора
    /// - Parameter childCoordinator: дочерний координатор
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    
    /// Удаление дочернего координатора
    /// - Parameter childCoordinator: дочерний координатор
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}

/// Интерфейс, который показывает, что нужнл сделать при заврешения работы Coordinators
protocol CoordinatorFinishDelegate: AnyObject {
    /// Координатор закончил свою работу и начинает освобождать свои дочерние координаты
    /// - Parameter childCoordinator: тот самый дочерний координат
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}

/// Интерфейс TabBarCoordinator.
protocol TabBarCoordinatorProtocol: AnyObject, CoordinatorProtocol {
    var tabBarControoler: UITabBarController? { get set }
}

/// Описание абстрактного координатора.
class Coordinator: CoordinatorProtocol {
    var type: CoordinatorType
    var childCoordinators: [CoordinatorProtocol]
    var navigationController: UINavigationController?
    var finishDelegate: CoordinatorFinishDelegate?
    
    init(
        type: CoordinatorType,
        childCoordinators: [CoordinatorProtocol] = [],
        navigationController: UINavigationController,
        finishDelegate: CoordinatorFinishDelegate? = nil
    ) {
        self.type = type
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    func start() { }
    func finish() { }
    
    deinit {
        print("Coordinator deinited \(type)")
        childCoordinators.forEach { $0.finishDelegate = nil }
        childCoordinators.removeAll()
    }
}


