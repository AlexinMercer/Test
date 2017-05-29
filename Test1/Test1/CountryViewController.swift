//
//  CountryViewController.swift
//  Test1
//
//  Created by Alex Mercer on 29/05/17.
//  Copyright © 2017 Beepquest. All rights reserved.
//

import UIKit

extension String {
    func getType(_ input: UITextField)-> UIKeyboardType {
        
        switch self {
        case "number":
            return UIKeyboardType.numbersAndPunctuation
        case "capital":
           input.autocapitalizationType = UITextAutocapitalizationType.allCharacters
             return UIKeyboardType.default
        default:
            return UIKeyboardType.default
        }
    }
}

class CountryViewController: UIViewController {
    
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var input: UITextField!
    
    var json: NSDictionary = NSDictionary()
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, identificator: NSDictionary) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       self.json = identificator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.input.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        configureData()
    }
    
    
    func configureData() {
        print(json)
        let name = json["name"]as! String
        let help_url = json["help_url"]as! String

        let input_type = json["input_type"]as! String
        
        self.input.keyboardType = input_type.getType(self.input)
        self.input.placeholder = name
        self.url.text = help_url
        
    }
    func validateRegex(_ regex: String, text: String) -> String {
        var backToString = regex

        let toArray = regex.components(separatedBy: "^d")
        backToString = toArray.joined(separator: "\\d")
        
        let tosegArray = backToString.components(separatedBy: "?d")
        backToString = tosegArray.joined(separator: "?\\d")
        
        if let range = text.range(of: backToString, options: .regularExpression){
            print(range)
            let result = text.substring(with: range)
            return result
        }
        return ""
    }
    

    func textFieldDidChange(_ textField: UITextField) {
       
        let pattern = json["pattern"]as! String
        

         print(pattern)
       
        let result = self.validateRegex(pattern,text: self.input.text!)
        if (result != ""){
            print("si")
            self.input.text = result
             self.input.textColor = UIColor.white
            self.input.layer.backgroundColor = UIColor.green.cgColor
        }else{
            print("no")
             self.input.textColor = UIColor.black
            self.input.layer.backgroundColor = UIColor.red.cgColor
        }
    }
    
    
    @IBAction func actionButton(_ sender: Any) {
        let url = NSURL(string:  self.url.text!)!
        UIApplication.shared.openURL(url as URL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
