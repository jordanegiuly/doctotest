json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :address, :postal_code, :city, :specialty
  json.url user_url(user, format: :json)
end
