require 'spec_helper'

describe "appointments/index" do
  before(:each) do
    assign(:appointments, [
      stub_model(Appointment,
        :hour => "Hour",
        :date => "Date",
        :active => false
      ),
      stub_model(Appointment,
        :hour => "Hour",
        :date => "Date",
        :active => false
      )
    ])
  end

  it "renders a list of appointments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hour".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
