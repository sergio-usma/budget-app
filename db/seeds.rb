user1 = User.create!(
  id: SecureRandom.uuid,
  name: "John Doe",
  email: "johndoe@example.com",
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.now
)

user1_categories = [
  {
    user_id: user1.id,
    name: "House",
    icon: "🏠"
  },
  {
    user_id: user1.id,
    name: "Car",
    icon: "🚗"
  },
  {
    user_id: user1.id,
    name: "Food",
    icon: "🍔"
  },
  {
    user_id: user1.id,
    name: "Entertainment",
    icon: "🎉"
  }
]

user1_categories.each do |category|
  Category.create!(category)
end

puts "Seeding complete!"