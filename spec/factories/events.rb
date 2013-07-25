# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user
    stream
    type ""

    factory :rebroadcast, class: Rebroadcast do
      type "Rebroadcast"
    end
    factory :livestream, class: Livestream do
      type "Livestream"
    end
  end

end
