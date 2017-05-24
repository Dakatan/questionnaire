require 'spec_helper'

describe "questionnaires/show" do
  before(:each) do
    @questionnaire = assign(:questionnaire, stub_model(Questionnaire))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
