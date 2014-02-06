# Superuser Role factory
FactoryGirl.define do
  factory :superuser, :class => :user do
    sequence(:email) { |n| "superuser#{n}@test.com" }
    password 'abcdef'
    role 'superuser' 
    confirmed_at '2011-04-25 19:11:53'
    confirmation_sent_at '2011-04-24 19:11:53'     
  end
end  
# tech_manager Role factory
FactoryGirl.define do
  factory :tech_manager, :class => :user do
    sequence(:email) { |n| "tech_manager#{n}@test.com" }  
    password 'abcdef'
    role 'tech_manager'
    confirmed_at '2011-04-25 19:11:53'
    confirmation_sent_at '2011-04-24 19:11:53' 
  end
end  

# Regular logged in User Role factory
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password 'abcdef'
    role 'user'
    confirmed_at '2011-04-25 19:11:53'
    confirmation_sent_at '2011-04-24 19:11:53'  
  end
end  

# == Schema Information
#
# Table name: users
#
#  id                            :integer(4)      not null, primary key
#  email                         :string(255)     default(""), not null
#  encrypted_password            :string(128)     default(""), not null
#  reset_password_token          :string(255)
#  remember_created_at           :datetime
#  sign_in_count                 :integer(4)      default(0)
#  current_sign_in_at            :datetime
#  last_sign_in_at               :datetime
#  current_sign_in_ip            :string(255)
#  last_sign_in_ip               :string(255)
#  created_at                    :datetime
#  updated_at                    :datetime
#  role                          :string(255)
#  firstname                     :string(255)
#  lastname                      :string(255)
#  confirmation_token            :string(255)
#  confirmed_at                  :datetime
#  confirmation_sent_at          :datetime
#  show_email                    :boolean(1)      default(FALSE), not null
#  update_mail_chimp             :boolean(1)      default(FALSE)
#  subscribed_to_mail_chimp      :boolean(1)      default(TRUE)
#  show_public                   :boolean(1)      default(TRUE), not null
#  fb_uid                        :string(255)
#  fb_token                      :string(255)
#  gender                        :string(255)
#  time_zone                     :string(255)     default("Pacific Time (US & Canada)")
#  legacy_password_hash          :string(255)
#  subscribed_to_bssm_mail_chimp :boolean(1)      default(FALSE)
#  subscribed_to_ldp_mail_chimp  :boolean(1)      default(FALSE)
#  verify_bssm                   :datetime
#  show_facebook                 :boolean(1)      default(TRUE)
#  removal_request               :datetime
#
