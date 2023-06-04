
import UIKit

class DetailViewController: ViewController<DetailPresenter> {
    
    // MARK: - UI
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        guard let card = presenter.card else { return }
        namelabel.text = card.name
        textlabel.text = card.text
        if let icon = card.imageUrl {
            iconImageView.loadThumbnail(urlSting: icon)
        }
    }
}
