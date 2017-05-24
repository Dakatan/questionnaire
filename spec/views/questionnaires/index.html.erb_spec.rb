require 'spec_helper'

describe "questionnaires/index" do
  before(:each) do
    assign(:questionnaires, [
      stub_model(Questionnaire),
      stub_model(Questionnaire)
    ])
  end

  it "renders a list of questionnaires" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
