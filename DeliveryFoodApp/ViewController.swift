import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let title = UILabel()
        view.addSubview(title)
        title.text = "PIZDA"
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.textColor = .black
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
