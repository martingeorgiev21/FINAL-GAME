import UIKit
class DragImageView: UIImageView {
    var startLocation: CGPoint?
    var myDelegate: subviewDelegate?
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLocation = touches.first?.location(in:self)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in:self)
        
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        var newCenter = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        //Constrain the movement to the phone screen bounds
        
        let halfx = self.bounds.midX
        newCenter.x = max(halfx, newCenter.x)
        newCenter.x = min(self.W*0.2 - halfx, newCenter.x)
        
        let halfy = self.bounds.midY
        newCenter.y = max(self.H*0.5 - self.W*0.1 + halfy, newCenter.y)
        newCenter.y = min(self.H*0.5 + self.W*0.1 - halfy, newCenter.y)
        
        self.center = newCenter
        
        self.myDelegate?.updateDirection(dx: dx*10, dy:dy*10, center: self.center)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.center = CGPoint(x: W*0.12, y: H*0.5)
        
        self.myDelegate?.releaseBall()
}

}
