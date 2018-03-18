//
//  ViewController.swift
//  colourMixer
//
//  Created by Dean Ang on 28/2/18.
//  Copyright © 2018 Dean Ang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colourCanvas: UIView!
    @IBOutlet var rswitch: UISwitch!
    @IBOutlet var gswitch: UISwitch!
    @IBOutlet var bswitch: UISwitch!
    @IBOutlet var rslider: UISlider!
    @IBOutlet var gslider: UISlider!
    @IBOutlet var bslider: UISlider!
    @IBOutlet var rgbcode: UILabel!
    
    func updateColour(){
        rslider.isEnabled = (rswitch.isOn) ? true : false
        gslider.isEnabled = (gswitch.isOn) ? true : false
        bslider.isEnabled = (bswitch.isOn) ? true : false
        let colour = UIColor(red:CGFloat(rslider.value), green:CGFloat(gslider.value), blue:CGFloat(bslider.value), alpha:1)
        colourCanvas.backgroundColor = colour
        updatehex()
    }
    
    func updatehex(){
        let rhex:Int = Int(rslider.value*255)
        let ghex:Int = Int(gslider.value*255)
        let bhex:Int = Int(bslider.value*255)
        let rStr:String = (String(rhex, radix:16).count == 1) ? "0"+String(rhex, radix:16) : String(rhex, radix:16)
        let gStr:String = (String(ghex, radix:16).count == 1) ? "0"+String(ghex, radix:16) : String(ghex, radix:16)
        let bStr:String = (String(bhex, radix:16).count == 1) ? "0"+String(bhex, radix:16) : String(bhex, radix:16)
        rgbcode.text = "#"+rStr+gStr+bStr
        rgbcode.copy(<#T##sender: Any?##Any?#>)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        rslider.value = 0; gslider.value = 0; bslider.value = 0
        rswitch.setOn(false, animated: true)
        gswitch.setOn(false, animated: true)
        bswitch.setOn(false, animated: true)
        rswitch.isOn = false; gswitch.isOn = false; bswitch.isOn = false
        colourCanvas.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:1)
        updatehex()
    }
    
    @IBAction func compColor(_ sender: Any) {
        rswitch.setOn(true, animated: true)
        gswitch.setOn(true, animated: true)
        bswitch.setOn(true, animated: true)
        rslider.isEnabled = true; gslider.isEnabled = true; bslider.isEnabled = true;
        rslider.value = 1 - rslider.value
        gslider.value = 1 - gslider.value
        bslider.value = 1 - bslider.value
        let red = CGFloat(rslider.value)
        let green = CGFloat(gslider.value)
        let blue = CGFloat(bslider.value)
        let colour = UIColor(red:red, green:green, blue:blue, alpha:1)
        colourCanvas.backgroundColor = colour
        updatehex()
    }
    @IBAction func rslider(_ sender: UISlider) {
        updateColour()
    }
    @IBAction func gslider(_ sender: UISlider) {
        updateColour()
    }
    @IBAction func bslider(_ sender: UISlider) {
        updateColour()
    }
    @IBAction func rswitch(_ sender: UISwitch) {
        updateColour()
    }
    @IBAction func gswitch(_ sender: UISwitch) {
        updateColour()
    }
    @IBAction func bswitch(_ sender: UISwitch) {
        updateColour()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColour()
        colourCanvas.layer.borderColor = UIColor.blue.cgColor
        colourCanvas.layer.borderWidth = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

