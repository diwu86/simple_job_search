json.array!(@simple_searches) do |simple_search|
  json.extract! simple_search, :id, :keywords, :location
  json.url simple_search_url(simple_search, format: :json)
end
