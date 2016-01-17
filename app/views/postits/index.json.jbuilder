json.array!(@postits) do |postit|
  json.extract! postit, :id
  json.url postit_url(postit, format: :json)
end
