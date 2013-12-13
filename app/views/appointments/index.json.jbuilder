json.array!(@appointments) do |appointment|
  json.extract! appointment, :hour, :date, :active
  json.url appointment_url(appointment, format: :json)
end