FactoryGirl.define do
  factory :upload do
    title { Faker::Name.title }
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'test_1.txt')) }
    user
  end
end
