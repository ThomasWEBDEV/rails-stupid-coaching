require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "h1", text: "Ask your coach anything"
  end

  test "saying I am going to work yields Great!" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "Ask"
    assert_text "Great!"
  end

  test "asking a question yields a silly response" do
    visit ask_url
    fill_in "question", with: "Can I sleep?"
    click_on "Ask"
    assert_text "Silly question, get dressed and go to work!"
  end

  test "saying anything else yields a grumpy response" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"
    assert_text "I don't care, get dressed and go to work!"
  end
end
