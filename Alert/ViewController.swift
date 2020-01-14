//
//  ViewController.swift
//  Alert
//
//  Created by Haena Park on 15/04/2019.
//  Copyright © 2019 Haena Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lampImageView: UIImageView!
    
    let imgOn = UIImage(named: "LampON.png")
    let imgOff = UIImage(named: "LampOFF.png")
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImageView.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn) {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        
        } else {
            lampImageView.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampOn){
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?",
                preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title : "네", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImageView.image = self.imgOff
                self.isLampOn=false})
            let cancelAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니요 끕니다.", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImageView.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니요 켭니다.", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImageView.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImageView.image = nil
            self.isLampOn = false
        })

        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

