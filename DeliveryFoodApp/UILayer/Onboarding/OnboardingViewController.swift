import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: Properties
    private var pages = [UIViewController]()
    weak var viewOutput: OnboardingViewOutput?
    
    // MARK: Views
    
    private var pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    
    private var pageControl = UIPageControl()
    
    // MARK: Init
    
    init(pages: [UIViewController], viewOutput: OnboardingViewOutput) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupAppearance()
        setupBehaviour()
        setupLayout()
    }
}

// MARK: - EmbedViews

private extension OnboardingViewController {
    func embedViews() {
        addChild(pageViewController)
        
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        view.addSubview(pageControl)
    }
}

// MARK: - SetupAppearance

private extension OnboardingViewController {
    func setupAppearance() {
        pageViewController.view.backgroundColor = AppColors.accentOrange
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - SetupBehaviour

private extension OnboardingViewController {
    func setupBehaviour() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
}

// MARK: - SetupLayout

private extension OnboardingViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController),
              currentIndex > 0 else {
            return nil
        }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController),
              currentIndex < pages.count - 1 else {
            return nil
        }

        return pages[currentIndex + 1]
    }
}

// MARK: - UIPageViewControllerDelegate

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        willTransitionTo pendingViewControllers: [UIViewController]
    ) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            pageControl.currentPage = index
        }
    }
}
