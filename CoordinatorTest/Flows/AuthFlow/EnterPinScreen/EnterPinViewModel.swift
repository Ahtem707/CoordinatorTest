import UIKit

extension EnterPinViewModel {
    enum State {
        case success
        case error
        case forgot
    }
    
    struct Out {
        var state: State = .error
        var code: String?
    }
}

final class EnterPinViewModel: FinishScreenProtocol {
    
    var finish: ((Out?) -> Void)?
    
    var code: [Int] = [Int]()
    
    weak var delegate: EnterPinViewController?
    
    func btnClick(_ tag: Int) {
        let len = self.code.count
        if tag == 11 || tag == 12 {
            if tag == 11 {
                self.forgot()
            } else {
                if len != 0 {
                    self.code.remove(at: len - 1)
                    self.delegate?.setPointStyle(point: (len - 1), value: false)
                }
            }
        } else {
            if len < 4 && tag != 12 {
                self.code.insert(tag, at: len)
                self.delegate?.setPointStyle(point: len, value: true)
            }
            if self.code.count == 4 {
                self.codeEntered(self.code) {
                    self.code.removeAll()
                    self.delegate?.clearPoints()
                }
            }
        }
    }
    
    func codeEntered(_ code: [Int], completion: ()->Void) {
        let pinCode: [Int] = [1,2,3,4] // required pin code
        
        let pinStr = code.map {String($0)}.joined()
        
        
        if code == pinCode {
            finish?(Out(state: .success, code: pinStr))
        } else {
            finish?(Out(state: .error, code: pinStr))
            completion()
        }
    }
    func forgot() {
        finish?(Out(state: .forgot, code: nil))
    }
}

protocol EnterPinViewControllerDelegate {
    func clearPoints()
    func setPointStyle(point: Int, value: Bool)
}
