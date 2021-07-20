//
//  ViewController.swift
//  app1
//
//  Created by Akshaya Kumar N on 6/2/19.
//  Copyright © 2019 Akshaya Kumar N. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dob: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        dob?.inputView = picker
        picker.addTarget(self, action: #selector(handlePicker(sender:)), for:.valueChanged)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestures:)))
        view.addGestureRecognizer(gesture)
        
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem:.done , target:self , action:#selector(buttonClicked))
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([doneButton,space,cancel] ,animated: true)
        dob?.inputAccessoryView = toolbar
        
        
        //picker.addSubview(toolbar)
    }
    
    
    @objc func viewTapped(gestures:UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    
    @objc func handlePicker(sender:UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        dob?.text = formatter.string(from: sender.date)
        // view.endEditing(true)
        
        
    }
    @objc func buttonClicked()
    {
        view.endEditing(true)
        
    }
    @objc func cancelTapped()
    {
        self.dob?.text = ""
        view.endEditing(true)
    }
    
}

