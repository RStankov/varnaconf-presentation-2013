require 'spec_helper'

describe ExamEntry do
  describe "#result" do
    it "works ( I hope :P )" do
      exam = create :exam

      single_1 = create :single_question, exam: exam, points: 1
      single_2 = create :single_question, exam: exam, points: 2

      multi_1 = create :multi_question, exam: exam, points: 1
      multi_2 = create :multi_question, exam: exam, points: 2

      entry = create(:exam_entry, answers: [
        create(:answer, question: single_1, text: single_1.correct_answer),
        create(:answer, question: single_2, text: '-wrong-answer-'),
        create(:answer, question: multi_1,  text: multi_1.correct_answers.first),
        create(:answer, question: multi_2,  text: '-wrong-answer-')
      ])

      result = entry.result

      result.keys.should eq [:correct_answers, :wrong_answers, :score]
      result[:correct_answers].map(&:question).should eq [single_1, multi_1]
      result[:wrong_answers].map(&:question).should eq [single_2, multi_2]
      result[:score].should eq single_1.points + multi_1.points
    end
  end
end
