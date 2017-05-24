require 'spec_helper'

describe "questionnaires/new" do
  before(:each) do
    assign(:questionnaire, stub_model(Questionnaire).as_new_record)
  end

  it "renders new questionnaire form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", questionnaires_path, "post" do
    end
  end
end
