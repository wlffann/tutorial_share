FactoryGirl.define do

  factory :category do
    sequence :name do |n|
      "#{n} name"
    end
  end

end