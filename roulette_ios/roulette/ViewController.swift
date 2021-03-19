
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    
    var nRouletteCount = 6
    var startDegree = 0
    var endDegree = 0
    var divDegree = 0
    var repeatDegree = 360
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(img1Tapped))
        img1.addGestureRecognizer(tapGesture1)
        img1.isUserInteractionEnabled = true
    }
    
    @objc func img1Tapped() {
        
        startDegree = divDegree
        let degree_rand = Int.random(in: 0..<360)
        endDegree = startDegree + 360 * nRouletteCount + degree_rand
        divDegree = endDegree % 360
        
        //print("degree_rand: \(degree_rand)")
        //print("startDegree: \(startDegree)")
        //print("endDegree: \(endDegree)")
        //print("divDegree: \(divDegree)")
        
        let nResult = getResult(angle: divDegree)
        switch nResult {
        case 1:
            repeatDegree = 360
        case 2:
            repeatDegree = 300
        case 3:
            repeatDegree = 240
        case 4:
            repeatDegree = 180
        case 5:
            repeatDegree = 120
        case 6:
            repeatDegree = 60
        default:
            repeatDegree = 360
        }
        print("nResult: \(nResult)")
    
        UIView.animate(withDuration: 2, delay:0, options:[.curveLinear],  animations: {
            
            for _ in 0..<10{
                self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1))
                self.img1.transform = CGAffineTransform(rotationAngle: 0)
            }
            
        }) { (completed) in
            
            self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(Double((self.repeatDegree)) * Double.pi)/180.0)
            
            //self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(360 * Double.pi)/180.0)
            //self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(300 * Double.pi)/180.0)
            //self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(240 * Double.pi)/180.0)
            //self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(180 * Double.pi)/180.0)
            //self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(120 * Double.pi)/180.0)
            //self.img1.transform = CGAffineTransform(rotationAngle: CGFloat(60 * Double.pi)/180.0)
        }
       
    }
    
    private func getResult(angle : Int) -> Int {
        
        var nResult = 0
        if ( angle > 330 || angle <= 30) {
            nResult = 1
        }else if (angle > 30 && angle <= 90){
            nResult = 2
        }else if (angle > 90 && angle <= 150){
            nResult = 3
        }else if (angle > 150 && angle <= 210){
            nResult = 4
        }else if (angle > 210 && angle <= 270){
            nResult = 5
        }else if (angle > 270 && angle <= 330){
            nResult = 6
        }
        return nResult
    }
    
}

