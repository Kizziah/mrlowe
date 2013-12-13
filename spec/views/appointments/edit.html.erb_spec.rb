require 'spec_helper'

describe "appointments/edit" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :hour => "MyString",
      :date => "MyString",
      :active => false
    ))
  end

  it "renders the edit appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do
      assert_select "input#appointment_hour[name=?]", "appointment[hour]"
      assert_select "input#appointment_date[name=?]", "appointment[date]"
      assert_select "input#appointment_active[name=?]", "appointment[active]"
    end
  end
end
