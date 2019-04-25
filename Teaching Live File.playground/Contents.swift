import UIKit


let tableview = UITableView()

class CustomCell: UITableViewCell { }
class CustomCellTwo: UITableViewCell { }

let id1 = "I'm An ID"
let id2 = "I'm An ID Also"

if let cell = tableview.dequeueReusableCell(withIdentifier: id1) as? CustomCell {
    // modifiy cell
//    return cell
} else if let cell = tableview.dequeueReusableCell(withIdentifier: id2) as? CustomCellTwo {
    // modify cell
//    return cell
}








































