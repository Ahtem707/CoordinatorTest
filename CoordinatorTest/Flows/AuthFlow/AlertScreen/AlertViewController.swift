import UIKit

final class AlertViewController: UIViewController, FinishScreenProtocol {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var subText: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    
    var finish: ((InOutData.Empty?)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    enum AlertType {
        case success
        case error
    }
    
    var type: AlertType = .error
    
    func setup() {
        switch type {
        case .error:
            self.icon.image = UIImage(named: "error")
            self.text.text = "Ошибка"
            self.text.textColor = .red
            self.subText.text = "Доступ запрещен"
            self.okBtn.backgroundColor = .red
        case .success:
            self.icon.image = UIImage(named: "success")
            self.text.text = "Успешно"
            self.text.textColor = .green
            self.subText.text = "Доступ разрешен"
            self.okBtn.backgroundColor = .green
        }
    }
    
    @IBAction func okBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        if type == .success {
            finish?(nil)
        }
    }
}
