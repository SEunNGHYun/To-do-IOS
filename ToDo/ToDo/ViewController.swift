import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todos:Array = [Dictionary<String, Any>]()
    var percent : Int = 0

    @IBOutlet var lblToday: UILabel!
    @IBOutlet var lblTodoPercent: UILabel!
    @IBOutlet var tableView: UITableView!
    
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
        ])
        todos.append([
            "todo" : "밥먹기",
            "start" : "2022-08-12",
            "end" : "2022-08-14",
            "ReDays" : ["월"],
            "alarms" : false ,
            "important" : "상",
            "notes" : "밥먹고 잘자기",
            "done" : false
        ])
        //테스트 데이터 설정
        
        for Task in todos {
            if Task["done"] as? Bool == true {
                percent = percent + 1
            }
        }
        
        print("percent", percent, todos.count)
        percent = (percent / todos.count) * 100
        print("percent", percent)
        //done이 False인지 True인지에 따라 Checkbox의 모양을 변경
        //done이면 오늘의 달성율을 계산하기 위해 값 계산
        lblTodoPercent.text = "\(percent)%"
        
        let today = Date()
        let date = DateFormatter()
        date.dateFormat = "yyyy.MM.dd"
        lblToday.text = date.string(from: today)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.registerTableViewCells()
    }

    @IBAction func actionSortTodo(_ sender: UIButton) {
        //원하는 순으로 정렬
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "TableViewCell", bundle: nil)
        
        self.tableView.register(textFieldCell, forCellReuseIdentifier:  "TableViewCell")
    }
    
    
}

