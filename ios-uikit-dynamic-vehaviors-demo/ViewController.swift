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

        //アニメーター
        animator = UIDynamicAnimator(referenceView: self.view)

        //重力をつける
        let gravityBehavior = UIGravityBehavior(items: [targetView])

        //衝突をつける
        let collisionBehavior = UICollisionBehavior(items: [targetView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true

        animator?.addBehavior(gravityBehavior)
        animator?.addBehavior(collisionBehavior)
    }
}

