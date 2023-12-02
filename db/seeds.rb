user1 = User.create!(
  id: 1,
  name: "John Doe",
  email: "johndoe@example.com",
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.now
)

user1_categories = [
  {
    user_id: 1,
    name: "House",
    icon: "🏠"
  },
  {
    user_id: 1,
    name: "Car",
    icon: "🚗"
  },
  {
    user_id: 1,
    name: "Food",
    icon: "🍔"
  },
  {
    user_id: 1,
    name: "Entertainment",
    icon: "🎉"
  }
]

user1_categories.each do |category|
  Category.create!(category)
end

puts "Seeding complete!"