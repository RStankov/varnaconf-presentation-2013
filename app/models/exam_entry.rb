class ExamEntry < ActiveRecord::Base
  belongs_to :exam
  belongs_to :user

  has_many :answers, class_name: 'ExamAnswer'

  validates_presence_of :user, :exam

  def result
    correct_answers = []
    wrong_answers = []
    score = 0

    answers.each do |answer|
      if answer.correct?
        correct_answers << answer
      else
        wrong_answers << answer
      end

      score += answer.points
    end

    {
      correct_answers: correct_answers,
      wrong_answers: wrong_answers,
      score: score
    }
  end
end
