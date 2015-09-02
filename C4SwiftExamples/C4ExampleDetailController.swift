// Copyright © 2015 C4
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

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
