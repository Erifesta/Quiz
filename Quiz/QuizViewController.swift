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
        choice1.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        choice1.titleLabel!.numberOfLines = 0
        choice1.titleLabel!.textAlignment = NSTextAlignment.center
        choice2.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        choice2.titleLabel!.numberOfLines = 0
        choice2.titleLabel!.textAlignment = NSTextAlignment.center          //quizArrayに問題文、２つの選択肢、答えの番号が入った配列を追加
         quizArray.append(["農園で半ば強制的にコーヒー豆の収穫作業をさせられている子供は児童労働に該当するか？", "Yes","NO",1])
    quizArray.append(["国際労働機関ILOによると、5～17歳の子どものおよそ1億5,200万人が児童労働をしています。(2016年調査) これは世界の子どもの25人に一人の割合ですか？", "Yes","No",2])
         quizArray.append(["子どもの就労人口は多い場所からアフリカ、アジア太平洋、南北アメリカ、欧州・中央アジア ですが、特に児童労働が多い国は？", "ブルキナファソ","チャド",2])
        quizArray.append(["2019年現在、フィリピンの大統領はドゥテルテです。彼は、麻薬の撲滅と児童の保護に注力し、犯罪者に対してはその場での射殺も辞さない超法規的な政策を掲げ、国際社会に波紋を投げかけました。正しいのはどちらですか？", "保護者以外の人物が一緒に街を歩いていても、逮捕されない。","危ない場所は、閉鎖または立ち入り禁止。",2])
         quizArray.append(["子どもたちの状況に改善があった指標は以下のとおりです。・5歳未満で死亡する子ども・発育阻害の子ども・学校に通う子ども　・児童労働に従事する子ども　・児童婚または強制的に結婚させられる少女　・10代で出産する少女　・殺害される子ども　その指標の中で、唯一、悪化している数値は、紛争により避難を強いられた子どもだと思いますか？", "Yes","NO",1])
         quizArray.append(["児童労働に従事している子どもを男女別に見ると、中東・北アフリカと、ラテンアメリカとカリブ海諸国では、男の子の割合が女の子よりもわずかに多くなっています。その他の地域においては、児童労働に従事している子どもの男女比はほぼ同じです。では家庭内での無給の労働を強いられる割合がより高いのはどちらですか？", "女の子","男の子",1])
        
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
        
        if tmpArray[3] as! Int == sender.tag{
            
            //正解数を増やす
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
