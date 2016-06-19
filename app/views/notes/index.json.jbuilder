json.array!(@notes) do |note|
  json.extract! note, :id, :public, :text, :created_by_id, :user_id
  json.url note_url(note, format: :json)
end
