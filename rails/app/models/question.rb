class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    if is_number?(submission)
      words_for(submission.to_i.to_words) == words_for(answer)
    elsif is_number?(answer)
      words_for(submission) == words_for(answer.to_i.to_words)
    else
      words_for(submission) == words_for(answer)
    end
  end
  
  private
  
  def words_for(text)
    text.downcase.split
  end
  
  def is_number?(text)
    text[/\d+/] == text
  end
end
