import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {
    answerSelected={}
    allAnswersSelected=false
    correctAnswersCount=0

    myQuestions=[
        {
            id:"Question1 : ",
            Question:"Which of the following is not a part of Template Looping",
            answers:{
                a:"for:each",
                b:"iterator",
                c:"map loop",
                d:"for:each"||"iterator"
            },
            correctAnswer:"c"
        },
        {
            id:"Question2 : ",
            Question:"Which of the file is invald in LWC component folder?",
            answers:{
                a:".svg",
                b:".apex",
                c:".js",
                d:".document"
            },
            correctAnswer:"b"
        },
        {
            id:"Question3 : ",
            Question:"Which one of the following is not a directive?",
            answers:{
                a:"for:each",
                b:"if:true",
                c:"@track",
                d:"if:false"
            },
            correctAnswer:"c"
        },
        {
            id:"Question4 : ",
            Question:"Which one army is the best in the world",
            answers:{
                a:"Indian Army",
                b:"U.S Army",
                c:"China Army",
                d:"Russia Army"
            },
            correctAnswer:"a"
        }
    ]

    get allAnswersNotSelected(){
        return !(Object.keys(this.answerSelected).length === this.myQuestions.length)
    }

    buttonHandler(event){
        const{name,value}=event.target
        this.answerSelected={...this.answerSelected, [name]:value}
        console.log(this.answerSelected)
    }


    handleSubmit(event){
        event.preventDefault()
        let correctAnswers=this.myQuestions.filter(item=>this.answerSelected[item.id] === item.correctAnswer)
        this.correctAnswersCount=correctAnswers.length
        this.allAnswersSelected=true
    }

    handleReset(){
        this.answerSelected={}
        this.correctAnswersCount=0
        this.allAnswersSelected=false
    }


}