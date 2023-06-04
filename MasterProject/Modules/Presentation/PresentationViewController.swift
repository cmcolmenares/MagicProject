
import UIKit

class PresentationViewController: ViewController<PresentationPresenter> {
    
    // MARK: - UI
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Private
    
    private func setupUI() {
        namelabel.text = UIGlobalUser.user
        emaillabel.text = UIGlobalUser.email
        datelabel.text = UIGlobalUser.date
        navigateButton.setTitle(LocalizedString("navigate").resolve(), for: .normal)
    }
    
    @IBAction func didPressNavigate(_ sender: Any) {
        presenter.navigateToHome()
    }
}
