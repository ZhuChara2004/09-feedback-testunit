json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :name, :email, :body
  json.url feedback_url(feedback, format: :json)
end
