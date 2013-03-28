class ExamEntry < ActiveRecord::Base
  belongs_to :exam
  belongs_to :user

  has_many :answers, class_name: 'ExamAnswer'

  validates_presence_of :user, :exam

  def result
    correct_answers = []
    answers.each do |answer|
      question = answer.question
      if question.correct_answer? answer.text
        correct_answers << answer
      end
    end

    wrong_answers = []
    answers.each do |answer|
      question = answer.question
      unless question.correct_answer? answer.text
        wrong_answers << answer
      end
    end

    score = 0
    correct_answers.each do |answer|
      score += answer.question.points
    end

    {
      correct_answers: correct_answers,
      wrong_answers: wrong_answers,
      score: score
    }
  end
end
