FactoryBot.define do
  factory :art_work do
    title {random}
    attachment { File.new("#{Rails.root}/spec/fixtures/files/image.jpg")}
  end
end

def random
  ('a'..'z').to_a.shuffle.join
end