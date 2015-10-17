FactoryGirl.define do
  to_create { |i| i.save }

  factory :environment do
    sequence(:env){|n| "env_#{n}"}
    mail_settings do
      {
        delivery_method: 'smtp2',
        port: 26,
        address: 'smtp2.example.com',
        user_name: 'user_name2',
        user_password: 'user_password2',
        authentication: 'plain2'
      }
    end
  end
end
