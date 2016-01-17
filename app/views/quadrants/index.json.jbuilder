json.array!(@quadrants) do |quadrant|
  json.extract! quadrant, :id, :name, :title, :description
  json.url quadrant_url(quadrant, format: :json)
end
