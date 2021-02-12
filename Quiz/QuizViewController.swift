//
//  QuizViewController.swift
//  Quiz
//
//  Created by 横溝心美 on 2020/12/11.
//  Copyright © 2020 横溝心美. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数を数える為の変数
    var correctAnswer: Int = 0
    
    //クイズを表示する為のTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //quizArrayに問題文、２つの選択肢、答えの番号が入った配列を追加
         quizArray.append(["問題文1", "Yes","NO",2])
         quizArray.append(["問題文2", "Yes","no",2])
         quizArray.append(["問題文3", "Yes","No",1])
         quizArray.append(["問題文4", "選択肢1","選択肢2",2])
         quizArray.append(["問題文5", "選択肢1","選択肢2",1])
         quizArray.append(["問題文6", "選択肢1","選択肢2",2])
        
        //問題文をシャッフル
        quizArray.shuffle()
         
        choiceQuiz()
        
        // Do any additional setup after loading the view.
    }
     func choiceQuiz() {
         
        //一時的にきクイズを取り出しておく配列
        let tmpArry = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArry[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choice1.setTitle(tmpArry[1] as? String, for: .normal)
        choice2.setTitle(tmpArry[2] as? String, for: .normal)
       
       
    }

    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
        
    }

    
    @IBAction func choiceAnswer(sender: UIButton){
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            
            //生回数を増やす
            correctAnswer = correctAnswer + 1
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
        
    }
     
    //セグエを準備(perpre)するときに呼ばれるメゾット
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
