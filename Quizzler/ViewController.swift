import UIKit

class ViewController: UIViewController {
    
    var mark = 0
    var index = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[index].questionText
        progressLabel.text = "1/\(questions.count)"
        progressBar.frame.size.width = view.frame.width / CGFloat(questions.count)
        scoreLabel.text = "总得分：0"
        
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        checkAnswer(tag: sender.tag)
        nextQuestion()
        updateUI()
   
    }
    
    func nextQuestion(){
        print(index)
        if index <= questions.count {
            index = index + 1
        }
    }
    
    func updateUI(){
        
        if (index < questions.count){
            scoreLabel.text = "总得分：\(mark)";
            
            questionLabel.text = questions[index].questionText
            
            progressLabel.text = "\(index+1)/\(questions.count)"
            
            progressBar.frame.size.width = (view.frame.width / CGFloat(questions.count )) * CGFloat(index+1)
        }else{
            print("game over")
            startOver()
        }
        
    }
    
    
    func checkAnswer(tag:Int){
        if index < questions.count{
            if(tag==1){
                //用户回答真
                if(true == questions[index].answer ){
                    mark = mark + 1
                    ProgressHUD.showSuccess("正确")
                }else{
                    ProgressHUD.showError("错误")
                }
            }else{
                //用户回答假
                if(false == questions[index].answer){//回答正确
                    mark = mark + 1
                    ProgressHUD.showSuccess("正确")
                }else{
                    ProgressHUD.showError("错误")
                }
            }
        }
        
    }
    
    
    func startOver() {
        let alert = UIAlertController(title: "GoodJob", message: "你已经都完成了，要重新来一遍吗？", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:.default, handler: { (_) in
            self.index = 0
            self.mark = 0
            self.questionLabel.text = questions[self.index].questionText
            self.progressLabel.text = "1/\(questions.count)"
            self.progressBar.frame.size.width = self.view.frame.width / CGFloat(questions.count)
            self.scoreLabel.text = "总得分：0"
           }))
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
