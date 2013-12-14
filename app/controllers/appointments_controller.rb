class AppointmentsController < ApplicationController

  def index
    date_from_ajax_jquery_picker = params[:matched_date]
    find_date = Appointment.where(:date => date_from_ajax_jquery_picker)
    appointment_hours = find_date.collect {|x| x.hour}
    render :json => appointment_hours
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
     @appointment = Appointment.new(params[:appointment])
      if @appointment.save

        redirect_to root_path, notice: "An email was sent with your appointment details"
      else
        redirect_to root_path, notice: "Please try again"
      end
  end
end

