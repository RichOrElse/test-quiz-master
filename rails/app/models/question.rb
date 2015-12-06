class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    Answer.new(answer) == Answer.new(submission)
  end
end
