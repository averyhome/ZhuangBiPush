//
//  ViewController.swift
//  ZhifubaoPush
//
//  Created by Sven on 2021/9/7.
//

import UIKit
import UserNotifications
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    var index = 0
    
    @IBOutlet weak var triggerTime: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playerHHH()
    }
    
    func playerHHH() {
        // 注册后台播放
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setActive(true)
            try session.setCategory(AVAudioSession.Category.playback)
        } catch {
            print(error)
        }
        guard let filePath = Bundle.main.path(forResource: "local_0.1", ofType: "m4a") else { return  }
        let fileUrl = URL.init(fileURLWithPath: filePath)
        do {
            try player = AVAudioPlayer.init(contentsOf: fileUrl)
            
        } catch {
            print(error)
        }
        
        player.prepareToPlay()
        player.volume = 0.0001
        player.numberOfLoops = -1
        player.play()
        
        
    }
    
    @IBAction func pushAction(_ sender: Any) {
//        let time = triggerTime.text ?? "5"
//        let t = TimeInterval.init(time) ?? 5
//        pushLocalNotice(t,money: "10000.00")
        
//        scheduPush()
        
//        pushdaozhang()
        self.iPhone13()
    }
    
    private func scheduPush() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { t in
//            let sc = Int(arc4random()%10)+1
//            let tt = TimeInterval.init(sc)
//            let money = Int(arc4random()%100)+1
//            let money1 = Int(arc4random()%2)+8
//
//            self.pushLocalNotice(tt,money: String.init(money) + String.init(money1) + ".00")
            self.iPhone13()
        }
    }
    
    
    private func iPhone13() {
        
        let content = UNMutableNotificationContent()
        content.sound = .default
        
        let str1 = "你订购的 Mac Studio M1 Ultra 2TB 快递员石布俏开始为您派送，请注意接听电话";
        let str2 = "你订购的 Studio Display shu 快递员柯裤开始为您派送，请注意接听电话";
        content.body = [str1,str2][index]
        content.body = bodyTextView.text
        
        let time = triggerTime.text ?? "5"
        let t = TimeInterval.init(time) ?? 5
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: t, repeats: false)
        let request = UNNotificationRequest.init(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    private func pushdaozhang() {
        let content = UNMutableNotificationContent()
        content.title = "你已成功收款1000000.00元"
        content.body = "已转入余额 用收钱码收钱，提现免费>>"
        content.sound = UNNotificationSound.init(named: .init(rawValue: "alipay_1000000_00.mp3"))
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest.init(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    private func pushLocalNotice(_ t: TimeInterval,money: String) {
        /*
         交易提醒
         你有一笔100000.00的支出，点此查看详情。
         */

        let content = UNMutableNotificationContent()
        content.title = "交易提醒"
        content.subtitle = "你有一笔" + money + "元的支出，点此查看详情。"
        content.sound = UNNotificationSound.init(named: .init(rawValue: "alipay_1000000_00.mp3"))
//        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: t, repeats: false)
        
        let request = UNNotificationRequest.init(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    


   
        
        


}

