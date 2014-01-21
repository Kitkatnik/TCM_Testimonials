json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :body
  json.url testimonial_url(testimonial, format: :json)
end
