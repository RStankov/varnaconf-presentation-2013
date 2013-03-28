FactoryGirl.define do
  factory :user do
  end

  factory :exam do
  end

  factory :single_question, class: :exam_question do
    exam
    type 'single'
    points 1
    correct_answer 'Correct'
  end

  factory :multi_question, class: :exam_question do
    exam
    type   'multi'
    points 1
    correct_answers ['Correct 1', 'Correct 2']
  end

  factory :exam_entry do
    exam
    user
  end

  factory :answer, class: :exam_answer do
    entry { create :exam_entry }
    question { create :single_question }
    text 'Text'
  end
end

