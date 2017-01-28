json.extract! user, :id, :name, :id_company, :email, :password, :, :created_at, :updated_at
json.url user_url(user, format: :json)