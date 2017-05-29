//
//  InitViewController.swift
//  Test1
//
//  Created by Alex Mercer on 29/05/17.
//  Copyright © 2017 Beepquest. All rights reserved.
//

import UIKit

class InitViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var piker: UIPickerView!
    var json:NSDictionary = NSDictionary()
    var jsonCountry:NSDictionary = NSDictionary()

    var id: [String] = []
    var country:  [String]  = []

    override func viewDidLoad() {
        super.viewDidLoad()
        piker.dataSource = self
        piker.delegate = self

        getData()
    }
    
    func getData(){
        request(urlBase).responseJSON { response in
            
            if let JSON = response.result.value {
                print(JSON)
                self.json = JSON as! NSDictionary
                self.configureData();
            }
        }
    }
    func getDataCountry(_ id: String){
        request(urlBase+"/id/"+id).responseJSON { response in
            
            if let JSON = response.result.value {
                print(JSON)
                self.jsonCountry = JSON as! NSDictionary
                 self.validateResponse()
            }
        }
       
    }


    func configureData() {
        let datas = json["data"]as! NSDictionary
        let countryes = datas["countries"]as! NSArray
        for i in 0 ..< countryes.count {
            let objCountry = countryes[i]as! NSDictionary
            let nameCountry = objCountry["name"]as! String
            let idCountry = objCountry["code"]as! String
            
            self.id.append(idCountry)
            self.country.append(nameCountry)
        }
        piker.reloadAllComponents()
        configurePiker()
    }
    
    func configurePiker(){
        print (id)
        print (country)
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        print(country[row])
        getDataCountry(id[row])
        
    }
    func validateResponse(){
        let data = jsonCountry["data"]as! NSDictionary
        let identificator = data["identification"]as! NSDictionary
        if ((identificator["name"]as? String) != nil){
            gotoNext(identificator)
        }else{
            let alert = UIAlertController(title: "Alert", message: "This conuntry not have information", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    
    func gotoNext(_ identificator:NSDictionary){
    let go: CountryViewController = CountryViewController(nibName: "CountryViewController", bundle: nil, identificator: identificator)
    self.navigationController?.pushViewController(go, animated: true)
    }
    
    

}
