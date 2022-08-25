import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    var todos:Array = [Dictionary<String, Any>]()
    var percent : Int = 0

    @IBOutlet var lblTodo: UILabel!
    @IBOutlet var btnCheckDone: UIButton!
    @IBOutlet var lblToday: UILabel!
    @IBOutlet var lblTodoPercent: UILabel!
    
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
            "done" : true
        ])//테스트 데이터 설정
        
        for Task in todos {
            lblTodo.text = Task["todo"] as? String
            if Task["done"] as? Bool == true {
                btnCheckDone.setImage(UIImage(systemName: "checkmark.square.fill"), for: UIControl.State.normal)
                percent = percent + 1
            }else{
                btnCheckDone.setImage(UIImage(systemName: "square"), for: UIControl.State.normal)
            }
            print("percent", percent, todos.count)
            percent = (percent / todos.count) * 100
            print("percent", percent)
            //done이 False인지 True인지에 따라 Checkbox의 모양을 변경
            //done이면 오늘의 달성율을 계산하기 위해 값 계산
            lblTodoPercent.text = "\(percent)%"
        }
        
        let today = Date()
        let date = DateFormatter()
        date.dateFormat = "yyyy.MM.dd"
        lblToday.text = date.string(from: today)
    }

    @IBAction func actionSortTodo(_ sender: UIButton) {
        //원하는 순으로 정렬
    }
    
    @IBAction func actionDetailTodo(_ sender: UIButton) {
    }
}

