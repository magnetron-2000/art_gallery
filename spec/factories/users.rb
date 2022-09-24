FactoryBot.define do
  factory :user do
    nickname { random }
    sequence :email do |n|
      "person#{n}@mail.com"
    end
    password { random }
  end
end

def random
  ('a'..'z').to_a.shuffle.join
end