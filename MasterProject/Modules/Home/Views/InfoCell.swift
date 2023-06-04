
import UIKit

class InfoCell: UITableViewCell {
    
    // MARK: - UI
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        descriptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - Methods
    func set(name: String, description: String, icon: String?) {
        mainLabel.text = name
        descriptionLabel.text = description
        guard let icon = icon else { return }
        iconImageView.loadThumbnail(urlSting: icon)
    }
}

