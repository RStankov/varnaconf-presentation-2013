class ExamAnswer < ActiveRecord::Base
  belongs_to :question, class_name: 'ExamQuestion', foreign_key: 'exam_question_id'
  belongs_to :entry, class_name: 'ExamEntry', foreign_key: 'exam_entry_id'

  validates_presence_of :question, :entry, :text
end
