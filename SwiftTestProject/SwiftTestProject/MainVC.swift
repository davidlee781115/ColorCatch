//
//  MainVC.swift
//  SwiftTestProject
//
//  Created by 李秉達 on 2019/12/5.
//  Copyright © 2019 李秉達. All rights reserved.
//

import UIKit
import DavidSwift
import IISI_SwiftLib
class MainVC: UIViewController {
    @IBOutlet var testView: UIView!
    @IBOutlet weak var vwColor: UIView!
    @IBOutlet weak var tfHex: UITextField!
    @IBOutlet weak var tfRed: UITextField!
    @IBOutlet weak var tfGreen: UITextField!
    @IBOutlet weak var tfBlue: UITextField!
    @IBOutlet weak var tfAlpha: UITextField!
    @IBOutlet weak var sdRed: UISlider!
    @IBOutlet weak var sdGreen: UISlider!
    @IBOutlet weak var sdBlue: UISlider!
    @IBOutlet weak var sdAlpha: UISlider!
    
    @IBOutlet weak var btnCatch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.frame = CGRect(x: 0, y: 0, width: UIScreen.WIDTH - 100, height:  300)
        testView.alpha = 0
        self.view.addSubview(testView)
        // UISlider 的最小值
        sdRed.minimumValue = 0
        sdGreen.minimumValue = 0
        sdBlue.minimumValue = 0
        sdAlpha.minimumValue = 0
        
        // UISlider 的最大值
        sdRed.maximumValue = 255
        sdGreen.maximumValue = 255
        sdBlue.maximumValue = 255
        sdAlpha.maximumValue = 100
        
        
        // UISlider 預設值
        sdRed.value = 0
        sdGreen.value = 0
        sdBlue.value = 0
        sdAlpha.value = 100
        
        // UISlider 是否可以在變動時同步執行動作
        // 設定 false 時 則是滑動完後才會執行動作
        sdRed.isContinuous = true
        sdGreen.isContinuous = true
        sdBlue.isContinuous = true
        sdAlpha.isContinuous = true
        //textField初始值
        tfHex.text = "000000"
        tfRed.text = "\(Int(sdRed.value))"
        tfGreen.text = "\(Int(sdGreen.value))"
        tfBlue.text = "\(Int(sdBlue.value))"
        tfAlpha.text = "\(Int(sdAlpha.value))"
        //手動改變ＲＧＢ值的時候
        tfRed.addTarget(self, action: #selector(changeTFvalue(tf:)), for: .editingChanged)
        tfGreen.addTarget(self, action: #selector(changeTFvalue(tf:)), for: .editingChanged)
        tfBlue.addTarget(self, action: #selector(changeTFvalue(tf:)), for: .editingChanged)
        tfAlpha.addTarget(self, action: #selector(changeTFvalue(tf:)), for: .editingChanged)
        //手動改變hex值的時候
        tfHex.addTarget(self, action: #selector(changeTFvalue(tf:)), for: .editingChanged)
        
        
    }
    //取得色塊顏色
    func getHexColor() {
        vwColor.backgroundColor = UIColor(red: Int(sdRed.value), green: Int(sdGreen.value), blue: Int(sdBlue.value))
        tfHex.text = rgbToHex(color: vwColor.backgroundColor!).uppercased()
    }
    //16進位字串轉Int
    func strHex2Int(strHex:String)
    {
        var rCorrect = false
        var gCorrect = false
        var bCorrect = false
        let r = (strHex as NSString).substring(with: NSMakeRange(0, 2))
        if Int(r, radix: 16) != nil{
            rCorrect = true
        }
        let g = (strHex as NSString).substring(with: NSMakeRange(2, 2))
        if Int(g, radix: 16) != nil{
            gCorrect = true
        }
        let b = (strHex as NSString).substring(with: NSMakeRange(4, 2))
        if Int(b, radix: 16) != nil{
            bCorrect = true
        }
        if rCorrect && gCorrect && bCorrect {
            tfRed.text = "\(Int(r, radix: 16)!)"
            sdRed.value = Float(Int(r, radix: 16)!)
            tfGreen.text = "\(Int(g, radix: 16)!)"
            sdGreen.value = Float(Int(g, radix: 16)!)
            tfBlue.text = "\(Int(b, radix: 16)!)"
            sdBlue.value = Float(Int(b, radix: 16)!)
            
            vwColor.backgroundColor = UIColor(red: Int(sdRed.value), green: Int(sdGreen.value), blue: Int(sdBlue.value))
        }else{
            let alert = UIAlertController(title: "", message: "查無此代碼", preferredStyle: .alert)
            let ok = UIAlertAction(title: "確認", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        
    }
    func isUnlockSuccess(n1:Int,n2:Int) -> Bool {
        if n1 == 3 && n2 == 7{
            return true
        }else{
            return false
        }
    }
    
    //從rgb取得Hex
    func rgbToHex(color: UIColor) -> String {
        
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format: "%06x", rgb)
    }
    //滑slider
    @IBAction func changeRed(_ sender: UISlider) {
        tfRed.text = "\(Int(sdRed.value))"
        getHexColor()
    }
    @IBAction func changeGreeen(_ sender: UISlider) {
        tfGreen.text = "\(Int(sdGreen.value))"
        getHexColor()
    }
    @IBAction func changeBlue(_ sender: UISlider) {
        tfBlue.text = "\(Int(sdBlue.value))"
        getHexColor()
    }
    @IBAction func changeAlpha(_ sender: UISlider) {
        vwColor.alpha = CGFloat(sdAlpha.value/sdAlpha.maximumValue)
        tfAlpha.text = "\(Int(vwColor.alpha*100))"
    }
    
    @IBAction func onlcickRamdom(_ sender: UIButton) {
        sdRed.value = Float.random(in: 0...255)
        tfRed.text = "\(Int(sdRed.value))"
        sdGreen.value = Float.random(in: 0...255)
        tfGreen.text = "\(Int(sdGreen.value))"
        sdBlue.value = Float.random(in: 0...255)
        tfBlue.text = "\(Int(sdBlue.value))"
        getHexColor()
    }
    
    @IBAction func onclickCatch(_ sender: UIButton) {
        let vc = TakePhotoVC()
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    //改變textField值x
    @objc func changeTFvalue(tf:UITextField)  {
        
        switch tf {
        case tfHex:
            if tf.text?.count == 6 {
                strHex2Int(strHex: tf.text!)
            }
        case tfRed:
            if let t = tfRed.text {
                if let i =   Int(t) {
                    if i > 255 {
                        tfRed.text = "255"
                    }
                    sdRed.value = Float(i)
                    changeRed(sdRed)
                }else{
                    //                            tfRed.text = "0"
                    sdRed.value = 0
                }
            }
        case tfGreen:
            if let t = tfGreen.text {
                if let i =   Int(t) {
                    if i > 255 {
                        tfGreen.text = "255"
                    }
                    sdGreen.value = Float(i)
                    changeGreeen(sdGreen)
                }else{
                    //                        tfGreen.text = "0"
                    sdGreen.value = 0
                }
            }
            
        case tfBlue:
            if let t = tfBlue.text {
                if let i =   Int(t) {
                    if i > 255 {
                        tfBlue.text = "255"
                    }
                    sdBlue.value = Float(i)
                    changeBlue(sdBlue)
                }else{
                    //                        tfBlue.text = "0"
                    sdBlue.value = 0
                }
            }
        case tfAlpha:
            if let t = tfAlpha.text {
                if let i =   Int(t) {
                    if i > 100 {
                        tfAlpha.text = "100"
                    }
                    sdAlpha.value = Float(i)
                    changeAlpha(sdAlpha)
                }else{
                    //                     tfAlpha.text = "0"
                    sdAlpha.value = 0
                }
            }
            
        default:
            break
        }
    }
    //轉大寫
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if let text = sender.text {
            let uppercase = text.uppercased()
            sender.text = uppercase
        }
    }
}
extension MainVC : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfHex{
            textField.keyboardType = .asciiCapable
        }else{
            textField.keyboardType = .numberPad
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == ""{
            textField.text = "0"
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfHex {
            //限制长度
            let proposeLength = (textField.text?.lengthOfBytes(using: String.Encoding.utf8))! - range.length + string.lengthOfBytes(using: String.Encoding.utf8)
            if proposeLength > 6 { return false }
            //限制只能输入数字跟英文
            let alphANum = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
            let cs = NSCharacterSet(charactersIn: alphANum).inverted
            let filtered = (string.components(separatedBy: cs) as NSArray).componentsJoined(by: "")
            
            return string == filtered
        }
        return true
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension MainVC:MainDelegate{
    func getColor(color: UIColor) {
        let hexStr = color.toHexString()
        strHex2Int(strHex: hexStr)
        tfHex.text = hexStr.uppercased()
    }
    
    
}
extension UIColor{
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"%06x", rgb) as String
    }
}

