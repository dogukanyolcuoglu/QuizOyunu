//
//  AnasayfaVC.swift
//  QuizOyunu
//
//  Created by Dogukan Yolcuoglu on 10.10.2020.
//  Copyright © 2020 Dogukan Yolcuoglu. All rights reserved.
//

import UIKit

class AnasayfaVC: UIViewController {
    
    var question = [Any] ();
    var questionIndex = 1;
    

    @IBOutlet weak var quesitonNumber: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.layer.cornerRadius = 3;
        questionLabel.layer.borderWidth = 1;
        questionLabel.layer.borderColor = UIColor.black.cgColor;
        questionLabel.layer.masksToBounds = true;
        
        addQuestions();

        updateQuestion();
        
    }
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        let selectedQuestion = question[questionIndex-1] as! [Any];
        let trueAnswer = selectedQuestion[5] as? Int
        
        if sender.tag == trueAnswer {
            print("Doğru Cevap");
        }else{
            print("Yanlış Cevap");
        }
        if questionIndex == question.count {
             
            questionIndex = 1;
        }
        else{
            
           questionIndex += 1;
        }
        updateQuestion();
    }
    func updateQuestion(){
        
        quesitonNumber.text = "Soru \(questionIndex)/\(question.count)";
        
        var selectedQuestion = question[questionIndex-1] as! [Any];
        
        questionLabel.text = selectedQuestion[0] as? String;
        button1.setTitle(selectedQuestion[1] as? String, for: .normal)
        button2.setTitle(selectedQuestion[2] as? String, for: .normal)
        button3.setTitle(selectedQuestion[3] as? String, for: .normal)
        button4.setTitle(selectedQuestion[4] as? String, for: .normal)

        
    }
    
    func addQuestions(){
        
        question.append(["Türkiyenin başkenti neresidir?","Ankara","İzmir","İstanbul","Muğla",1]);
        question.append(["Swift dilini beğendiniz mi?","Bilmiyorum","Görücez","Beğendim","Beğenmedim",3])
        question.append(["Türkiyenin Kurucusu Kimdir?","Ali","Veli","İsmail","Atatürk",4]);
        question.append(["Türkiyenin kaç bölgesi vardır?","3","7","4","5",2]);
        question.append(["Hangisi Mobil Programlama  dili değildir?","Swift","Flutter","C#","React native",3]);
        
        
        
        
    }
    
}
