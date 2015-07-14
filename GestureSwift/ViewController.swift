//
//  ViewController.swift
//  GestureSwift
//
//  Created by MAEDAHAJIME on 2015/07/13.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivTarget: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 背景に画像をセットする
        let image:UIImage = UIImage(named:"bg01")!
        
        // 背景に画像をセットする
        self.view.backgroundColor = UIColor(patternImage:image)
        
        // タッチ / キーイベント許可設定 YES
        self.ivTarget.userInteractionEnabled = true
        
        // アニメーション開始
        animateStart(target: ivTarget, key: "Ani01")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Original Method

    // アニメーション開始 // アニメーション回転開始（要：QuartzCore.framework）
    func animateStart(#target: UIView, key: String!) {
    
        // アニメーション設定
        // (種類(Z軸回転))
        let ani:CABasicAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
        
        // 設定（変化値（ラジアン角））
        ani.fromValue = 0.0			// 0°
        ani.toValue   = 2.0 * M_PI	// 360°
    
        // (アニメーション時間(秒))
        ani.duration = 2.0;
    
        // (繰返し回数)
        ani.repeatCount = HUGE	// 無限
        // アニメーション開始
        target.layer.addAnimation(ani, forKey: key)
    }
    
    // MARK: - Action Method
    
    // ターゲットの移動（パンジェスチャー）
    @IBAction func panTarget(sender: UIPanGestureRecognizer) {
        
        // 移動処理
        sender.view!.center = sender.locationInView(view.superview)
    }
    
    // アニメーション停止
    func animateEnd(#target: UIView, key: String!) {
        
        // アニメーション削除
        target.layer.removeAnimationForKey(key)
    }
}

