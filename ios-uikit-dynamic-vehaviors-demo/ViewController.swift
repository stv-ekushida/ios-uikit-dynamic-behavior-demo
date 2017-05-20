//
//  ViewController.swift
//  ios-uikit-dynamic-vehaviors-demo
//
//  Created by Kushida　Eiji on 2017/05/21.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var borderView: UIView!


    var animator: UIDynamicAnimator?

    //関連クラス
    // UIDynamicAnimator
    // UIGravityBehavior
    // UICollisionBehavior
    //
    // その他 ---
    // UIAttachmentBehavior
    // UIDynamicItemBehavior
    // UIPushBehavior
    // UISnapBehavior

    override func viewDidLoad() {
        super.viewDidLoad()

        //アニメーションの土台
        animator = UIDynamicAnimator(referenceView: self.view)
        animator?.delegate = self

        //重力をつける
        let gravityBehavior = UIGravityBehavior(items: [targetView])

        //重力がかかる方向
        gravityBehavior.gravityDirection = CGVector(dx: 0, dy: 1)

        //衝突をつける
        let collisionBehavior = UICollisionBehavior(items: [targetView, borderView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true

        //境界線を作る
        let toPoint = CGPoint(x: borderView.frame.origin.x + borderView.frame.size.width,
                              y: borderView.frame.origin.y)

        collisionBehavior.addBoundary(withIdentifier: "borderView" as NSCopying,
                                      from: borderView.frame.origin,
                                      to: toPoint)

        //振る舞い（ビヘイビア）を追加する
        animator?.addBehavior(gravityBehavior)
        animator?.addBehavior(collisionBehavior)
    }
}

extension ViewController: UIDynamicAnimatorDelegate {

    // アニメーション開始時に呼ばれる
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        print(#function)
    }

    // アニメーション終了時に呼ばれる
    func dynamicAnimatorWillResume(_ animator: UIDynamicAnimator) {
        print(#function)
    }
}

