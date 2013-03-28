require 'spec_helper'

describe ExamAnswer do
  describe "#correct?" do
    it "returns true if answer is correct" do
      answer = build :answer, question: build(:question, correct_answer: 'Correct'), text: 'Correct'
      answer.should be_correct
    end

    it "returns false if answer is wrong" do
      answer = build :answer, text: 'Wrong'
      answer.should_not be_correct
    end
  end
end
