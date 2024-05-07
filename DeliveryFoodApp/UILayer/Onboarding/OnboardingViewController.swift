import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: Properties
    
    private var pages = [UIViewController]()
    var viewOutput: OnboardingViewOutput?
    
    // MARK: Views
    
    private let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    private let pageControl = UIPageControl()
    private let nextButton = UIButton(type: .system)
    
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
        
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

// MARK: - EmbedViews

private extension OnboardingViewController {
    func embedViews() {
        addChild(pageViewController)
        
        view.addSubview(pageViewController.view)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        
        pageViewController.didMove(toParent: self)
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
    }
}

// MARK: - SetupAppearance

private extension OnboardingViewController {
    func setupAppearance() {
        pageViewController.view.backgroundColor = AppColors.accentOrange
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = false
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = AppColors.gray
        nextButton.titleLabel?.font = .Roboto.bold.size(of: 18)
        nextButton.setTitleColor(AppColors.black, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 12
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
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nextButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: Actions

private extension OnboardingViewController {
    @objc func buttonTapped() {
        guard pageControl.currentPage != pages.count - 1 else {
            viewOutput?.onboardingFinish()
            return
        }
        
        pageControl.currentPage += 1

        let nextViewController = pages[pageControl.currentPage]
        pageViewController.setViewControllers(
            [nextViewController],
            direction: .forward,
            animated: true
        )
        
        if pageControl.currentPage != pages.count - 1 {
            nextButton.setTitle("Next", for: .normal)
            return
        }
        
        nextButton.setTitle("Start", for: .normal)
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
        
        if pageControl.currentPage != pages.count - 1 {
            nextButton.setTitle("Next", for: .normal)
            return
        }
        
        nextButton.setTitle("Start", for: .normal)
    }
}
