import UIKit

final class EnterPinViewController: UIViewController {
    
    @IBOutlet var points: [UILabel]!
    
    let model = EnterPinViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model.delegate = self
        setup()
    }
    
    func setup() {
        // Установить стиль поинтов
        for i in points {
            i.layer.masksToBounds = true
            i.layer.cornerRadius = 7
            i.layer.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        }
    }
    
    @IBAction func btnGroup(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        self.model.btnClick(tag)
    }
}

extension EnterPinViewController: EnterPinViewControllerDelegate {
    func clearPoints() {
        for i in self.points {
            i.layer.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        }
    }
    
    func setPointStyle(point: Int, value: Bool) {
        self.points[point].layer.backgroundColor = (value) ? #colorLiteral(red: 0.1176470588, green: 0.6901960784, blue: 0.7647058824, alpha: 1) : #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
    }
}
