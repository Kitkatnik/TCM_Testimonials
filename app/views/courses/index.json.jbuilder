json.array!(@courses) do |course|
  json.extract! course, :id, :name, :date, :code
  json.url course_url(course, format: :json)
end
