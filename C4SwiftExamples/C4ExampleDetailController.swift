//
//  C4ExampleDetailController.swift
//  C4SwiftExamples
//
//  Created by David Schwartz on 2015-09-02.
//  Copyright © 2015 C4. All rights reserved.
//

import Foundation
import UIKit
import C4

class C4ExampleDetailController: UIViewController {
    
    @IBOutlet var canvasContainerView: UIView?
    private var canvasController: C4CanvasController?
    
    class func createController(canvasController: C4CanvasController) -> C4ExampleDetailController? {
        
        let sb = UIStoryboard(name: "C4ExampleDetailController", bundle: NSBundle.mainBundle())
        if let controller = sb.instantiateInitialViewController() as? C4ExampleDetailController {
            controller.canvasController = canvasController
            return controller
        }
        
        return nil
    }
    
    override func viewDidLoad() {
                
        canvasController!.willMoveToParentViewController(self)
        self.addChildViewController(canvasController!)
        canvasController!.didMoveToParentViewController(self)
        
        canvasController!.viewWillAppear(false)
        canvasContainerView!.add(canvasController!.view)
        canvasController!.viewDidAppear(false)

        canvasController!.setup()
    }
}
