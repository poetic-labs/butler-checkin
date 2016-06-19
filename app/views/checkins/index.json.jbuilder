json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :notes, :short_term_goal
  json.url checkin_url(checkin, format: :json)
end
