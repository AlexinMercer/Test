import UIKit

extension Date {
    var milliseconds:Int {
        return Int((self.timeIntervalSince1970).rounded())
    }
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}

extension Int {
    var dateFull: Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    var getNumberDayOfMonth : Int {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.day, from: dateFull)
        return weekDay
    }
}


func sd(d:String!) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    return dateFormatter.date(from:d)!.milliseconds
}

let milliseconds_day = 86400000
let date_0 = "05-16-1970" //Inicial
let date_1 = "05-16-2017" //Final
var days_sundays_month = 0

let md = [sd(d:date_0),sd(d:date_1)]

var i: Int = md[0]
while i <= md[1] {
    let day_month = i.getNumberDayOfMonth
    let day_week = i.dateFull.dayOfWeek()
    if (day_month == 1 && day_week == "Sunday"){
        days_sundays_month += 1
    }
    i += milliseconds_day
}

print("De ", date_0, " a ", date_1," hay ",days_sundays_month, " dias que son Domingo y primer dia del mes")

