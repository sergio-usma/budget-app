FactoryBot.define do
  factory :category do
    name { 'Successful' }
    icon do
      io = File.open(Rails.root.join('spec', 'icon_tests', 'icon.png'))
      filename = 'icon.png'
      content_type = 'image/png'
      Rack::Test::UploadedFile.new(io, content_type, filename)
    end
  end
end
