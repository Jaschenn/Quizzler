//
//  Question.swift
//  Quizzler
//
//  Created by jas chen on 2019/12/28.
//  Copyright © 2019 rongcosme. All rights reserved.
//

import Foundation

class Question{
    let answer : Bool
    let questionText : String
    
    init(text:String, correctAnswer:Bool) {
        questionText = text;
        answer = correctAnswer
    }
}

let questions = [Question(text: "马云是中国首富吗", correctAnswer: false),
                 Question(text: "海底捞好吃吗", correctAnswer: true),
                 Question(text: "我的学习成绩很好", correctAnswer: true),
                 Question(text: "苹果手机很好用", correctAnswer: true)]

