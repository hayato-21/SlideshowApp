//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 大山隼人 on 2019/12/09.
//  Copyright © 2019 大山隼人. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var both: UIButton!
    @IBOutlet weak var modoru: UIButton!
    
    var timer: Timer!
    var currentView: String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 初期画像
        let image = UIImage(named: "images1.jpeg")
        imageView.image = image
    }
    // 表示している画像の番号
    var imageNo = 0
    // 写真を格納する
    let imageArray = ["images1.jpeg","images2.jpeg","images3.jpeg"]
    
    func showImage(){
        let imageName = imageArray[imageNo]
        let image = UIImage(named: imageName)
        imageView.image = image
    }
    
    @objc func updateTimer(_ timer: Timer){
        //タイマーと連動させる処理内容を書く。
        if imageNo < imageArray.count - 1 {
            imageNo += 1
            showImage()
        }else{
            imageNo = 0
            showImage()
        }
    }
    
    @IBAction func susumuPush(_ sender: Any) {
        if timer == nil {
            if imageNo < imageArray.count - 1 && timer == nil {
                imageNo += 1
                showImage()
            }else{
                imageNo = 0
                showImage()
            }
        }
    }
    @IBAction func bothPush(_ sender: Any) {
        //タイマーをどのように作動させるか、させないかだけ
        if timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            both.setTitle("停止", for: .normal)
        }else{
            self.timer.invalidate()
            self.timer = nil
            both.setTitle("再生", for: .normal)
        }
    }
    @IBAction func modoruPush(_ sender: Any) {
        if timer == nil{
            if imageNo > 0{
                imageNo -= 1
                showImage()
            }else{
                imageNo = imageArray.count-1
                showImage()
            }
        }
    }
    
    @IBAction func viewPush(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let expandViewController: ExpandViewController = segue.destination as! ExpandViewController
        
        currentView = self.imageArray[imageNo]
        expandViewController.x = currentView
        
        //修正箇所。再生中のみ、押した瞬間に処理を無効化する。
        if timer != nil{
            self.timer.invalidate()
            self.timer = nil
            both.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func unwind(_segue: UIStoryboardSegue){
        
    }

}
