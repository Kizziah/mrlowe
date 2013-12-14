require 'spec_helper'



describe Appointment do

  before(:each) do
    visit root_path
  end


  it 'schedule an appointemnt in form',  :js => true  do
    click_link 'Book'
    x = page.find('td', text: '26')
    x.click
    y = page.find('td', text: '2:00 pm')
    y.click
    click_button 'Create Appointment'
    click_link 'Book'
    x = page.find('td', text: '26')
    x.click
    page.should_not have_selector('td', text: '3:00 pm')
  end
end

