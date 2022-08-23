import UIKit

struct Todo {
    var todo : String
    var start : String
    var end : String
    var ReDays : [String?]
    var alarms : Bool
    var important : String
    var notes : String
    var done : Bool
}

class ViewController: UIViewController {
    var todos:Array = [Dictionary<String, Any>]()

    @IBOutlet var lblTodo: UILabel!
    @IBOutlet var btnCheckDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //그전의 todo 가져오기
        todos.append([
            "todo" : "밥먹기",
            "start" : "2022-08-12",
            "end" : "2022-08-14",
            "ReDays" : ["월"],
            "alarms" : false ,
            "important" : "상",
            "notes" : "밥먹고 잘자기",
            "done" : false
        ])//테스트 데이터 설정
        
        for Task in todos {
            lblTodo.text = Task["todo"] as? String
            if Task["done"] as? Bool == true {
                btnCheckDone.setImage(UIImage(systemName: "checkmark.square.fill"), for: UIControl.State.normal)
            }else{
                btnCheckDone.setImage(UIImage(systemName: "square"), for: UIControl.State.normal)
            }
        }
    }

    @IBAction func actionSortTodo(_ sender: UIButton) {
        //원하는 순으로 정렬
    }
    
    @IBAction func actionDetailTodo(_ sender: UIButton) {
    }
}

