Fabricator(:user) do
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  username { sequence(:username) { |i| "user#{i}" } }
  password "password"
  password_confirmation "password"
end
