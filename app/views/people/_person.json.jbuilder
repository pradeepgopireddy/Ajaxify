json.extract! person, :id, :state_id, :city_id, :name, :email, :mobile, :created_at, :updated_at
json.url person_url(person, format: :json)
