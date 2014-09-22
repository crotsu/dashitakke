json.array!(@sources) do |source|
  json.extract! source, :id, :filename, :content_type, :filesize, :code, :question_id
  json.url source_url(source, format: :json)
end
