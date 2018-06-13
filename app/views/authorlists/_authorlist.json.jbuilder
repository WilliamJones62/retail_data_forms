json.extract! authorlist, :id, :partcode, :dept, :custcode, :turns, :seq, :priority, :created_at, :updated_at
json.url authorlist_url(authorlist, format: :json)
