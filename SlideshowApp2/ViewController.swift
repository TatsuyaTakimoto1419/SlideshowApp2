//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by 瀧本達也 on 2020/09/12.
//  Copyright © 2020 瀧本達也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    // 配列に指定するindex番号を宣言
       var nowIndex:Int = 0

       // スライドショーに使用するタイマーを宣言
       var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
       var imageArray:[UIImage] = [
           UIImage(named: "pic1")!,
           UIImage(named: "pic2")!,
           UIImage(named: "pic3")!,
          
       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // collectionView.delegate = self
              
                 
    }
    
    var selectedImage : UIImage?
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){

           if (segue.identifier == "ViewController2"){

               let subVC: ViewController2 = (segue.destination as? ViewController2)!

            selectedImage = imageArray[nowIndex]
            subVC.selectedImg = selectedImage
            

           }

       }
    
    
    @IBAction func tap(_ sender: Any) {
   

        
    }
    
   
    @IBAction func startButton(_ sender: Any) {
        if (timer == nil){
                          // 再生時の処理を実装

                                     // タイマーをセットする
                          timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
                          
                          // ボタンの名前を停止に変える
                          button.setTitle("停止", for: .normal)
            
            nextButton.isEnabled = false;
            
            
                      }
                      else {
                          // 停止時の処理を実装
                          // タイマーを停止する
                          timer.invalidate()

                          // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                        timer = nil

                          // ボタンの名前を再生に直しておく
                         button.setTitle("再生", for: .normal)
            
            nextButton.isEnabled = true;
            
                      }
        
    }
    
    
    @objc func changeImage() {
          // indexを増やして表示する画像を切り替える
          nowIndex += 1

          // indexが表示予定の画像の数と同じ場合
          if (nowIndex == imageArray.count) {
              // indexを一番最初の数字に戻す
              nowIndex = 0
          }
          // indexの画像をstoryboardの画像にセットする
          image.image = imageArray[nowIndex]
      }
    
    
    @IBAction func backButtonAct(_ sender: Any) {
        // indexをへらして表示する画像を戻す
                nowIndex -= 1

                
                if (nowIndex < 0) {
                     
                    nowIndex = 2
                }else{
                   
        }
        
       image.image = imageArray[nowIndex]
                // indexの画像をstoryboardの画像にセットする
               
    }
    
    
    
    @IBAction func nextButtonGo(_ sender: Any) {
        if timer == nil {
            changeImage()
            
                   
               }
    }
    
    

       
}

