json.array!(@questions) do |question|
  json.extract! question, :id, :index, :need_check, :point, :contents, :paper_id
  json.url question_url(question, format: :json)
end
