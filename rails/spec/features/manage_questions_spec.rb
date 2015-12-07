require 'rails_helper'

describe "manage questions", :type => :feature do
  before :each do
    Question.create(:question => 'Which is first the chicken or the egg?', :answer => 'egg')
  end

  it "Create question" do
    visit '/questions/new'
    within("#new_question") do
      fill_in 'Question', :with => 'What is the largest ocean?'
      fill_in 'Answer', :with => 'Pacific'
    end
    click_button 'Create Question'
    expect(page).to have_content "success"
  end
  
  it "Edit question" do
    visit '/questions/1'
    within(".edit_question") do
      fill_in 'Answer', :with => 'chicken'
    end
    click_button 'Update Question'
    expect(page).to have_content "success"
  end
end
