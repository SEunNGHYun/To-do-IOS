import UIKit
import DropDown

//todos.append([
//    "todo" : "밥먹기",
//    "start" : "2022-08-12",
//    "end" : "2022-08-14",
//    "ReDays" : ["월"],
//    "alarms" : false ,
//    "important" : "상",
//    "notes" : "밥먹고 잘자기",
//    "done" : false
//])//테스트 데이터 설정

protocol AddDelegate {
    func AddTodo (_ controller: AddViewController, todos : Dictionary<String, Any>)
}

class AddViewController: UIViewController {
    @IBOutlet var tdToDo: UITextField!
    @IBOutlet var tfMemo: UITextField!
    @IBOutlet var btnImportant: UIButton!
    @IBOutlet var lblToday: UILabel!
    
    var todo = Dictionary<String, Any>()
    
    var reDays = [String]()
    var alarmSet = false
    var startDay : String? = nil
    var endDay : String? = nil
    var important : String? = nil
    let menu = DropDown()
    var ReDays = [String]()
    
    @IBOutlet var btnMonday: UIButton!
    @IBOutlet var btnTuesday: UIButton!
    @IBOutlet var btnWednesday: UIButton!
    @IBOutlet var btnThursday: UIButton!
    @IBOutlet var btnFriday: UIButton!
    @IBOutlet var btnSaturday: UIButton!
    @IBOutlet var btnSunday: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menu.dataSource = [ "상", "중", "하" ]
        menu.anchorView = btnImportant
        menu.bottomOffset = CGPoint(x: 0, y: btnImportant.bounds.height)
        menu.selectionAction = { index, title in
            self.important = title
            self.btnImportant.setTitle(title, for: UIControl.State.normal)
        }
        let today = Date()
        let date = DateFormatter()
        date.dateFormat = "yyyy.MM.dd"
        lblToday.text = date.string(from: today)
    }

    @IBAction func choiceStartDay(_ sender: UIDatePicker) {
        let datePK = sender
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        startDay = dateFormatter.string(from: datePK.date)
    }
    
    @IBAction func choiceEndDay(_ sender: UIDatePicker) {
        let datePK = sender
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        endDay = dateFormatter.string(from: datePK.date)
    }
    
    @IBAction func toggleAlarm(_ sender: UISwitch) {
        alarmSet = sender.isOn
    }
    
    @IBAction func addTodo(_ sender: UIButton) {
        if (checkInputValue(tdToDo.text) && checkInputValue(startDay)
        && checkInputValue(endDay)) {
            todo["todo"] = tdToDo.text
            todo["start"] = startDay
            todo["end"] = endDay
            todo["alarms"] = alarmSet
            todo["important"] = important
            todo["notes"] = tfMemo.text
            todo["done"] = false
            //서버에 전송
            
            _ = navigationController?.popViewController(animated: true)
        }else{
            let alert = UIAlertController(title: "입력값 확인", message: "내용을 확인해 주세요", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
            
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
        print("todo: " , todo)
        
    }
    
    @IBAction func cancelTodo(_ sender: Any) {
        startDay = nil
        endDay = nil
        _ = navigationController?.popViewController(animated: true)
        //todo 목록으로 가기
    }
    
    func checkInputValue(_ val : String?) -> Bool {
        if (val == nil) || (val  == "") {
            return false
        }
        return true
    }

    @IBAction func btnChangeImportant(_ sender: UIButton) {
        menu.show()
    }
    
    @IBAction func btnMon(_ sender: UIButton) {
        ReDays.append("월")
        btnMonday.backgroundColor = .red
    }
    @IBAction func btnTue(_ sender: UIButton) {
        ReDays.append("화")
        btnTuesday.backgroundColor = .red
    }
    @IBAction func btnWed(_ sender: UIButton) {
        ReDays.append("수")
        btnWednesday.backgroundColor = .red
    }
    @IBAction func btnThu(_ sender: UIButton) {
        ReDays.append("목")
        btnThursday.backgroundColor = .red
    }
    @IBAction func btnFri(_ sender: UIButton) {
        ReDays.append("금")
        btnFriday.backgroundColor = .red
    }
    @IBAction func btnSat(_ sender: UIButton) {
        ReDays.append("토")
        btnSaturday.backgroundColor = .red
    }
    @IBAction func btnSun(_ sender: UIButton) {
        ReDays.append("일")
        btnSunday.backgroundColor = .red
    }
}

