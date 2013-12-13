require 'spec_helper'

describe "appointments/new" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :hour => "MyString",
      :date => "MyString",
      :active => false
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointments_path, "post" do
      assert_select "input#appointment_hour[name=?]", "appointment[hour]"
      assert_select "input#appointment_date[name=?]", "appointment[date]"
      assert_select "input#appointment_active[name=?]", "appointment[active]"
    end
  end
end
