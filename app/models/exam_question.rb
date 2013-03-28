class ExamQuestion < ActiveRecord::Base
  belongs_to :exam
  has_many :answers, class_name: 'ExamAnswer'

  validates_presence_of :exam, :points, :type

  serialize :correct_answers, Array
end
