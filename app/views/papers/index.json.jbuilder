json.array!(@papers) do |paper|
  json.extract! paper, :id, :index, :given_date, :set
  json.url paper_url(paper, format: :json)
end
