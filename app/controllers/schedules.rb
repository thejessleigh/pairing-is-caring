get '/schedule' do
  @user = User.find(session[:user_id])
  @appointments = Appointment.all
  @available_appointments = []
  @scheduled_appointments = []
  @appointments.each do |appointment|
    if appointment.mentee_id == nil
      @available_appointments << appointment
    else
      @scheduled_appointments << appointment
    end
  end
  # binding.pry
  erb :schedule
end

get '/schedule/create' do
  @user = User.find(session[:user_id])
  erb :create_appointment
end

get '/schedule/:appointment_id' do
  @user = User.find(session[:user_id])
  @appointment = Appointment.find(params[:appointment_id])
  erb :schedule_session
end




#============================================POST

post '/schedule/create' do
  Appointment.create(start_time: params[:start_time], end_time: params[:end_time], mentor_id: session[:user_id], mentee_id: nil)
  redirect '/schedule'
end

post '/schedule/:appointment_id' do
  Appointment.find(params[:appointment_id]).update(mentee_id: session[:user_id])
  redirect '/schedule'
end
