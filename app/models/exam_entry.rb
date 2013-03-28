class ExamEntry < ActiveRecord::Base
  belongs_to :exam
  belongs_to :user

  has_many :answers, class_name: 'ExamAnswer'

  validates_presence_of :user, :exam

  def result
    OpenStruct.new(
      correct_answers: answers.select(&:correct?),
      wrong_answers: answers.reject(&:correct?),
      score: answers.to_a.sum(&:points)
    )
  end
end
