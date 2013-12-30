FactoryGirl.define do
  factory :inquiry do
    first_name "John"
    last_name "Doe"
    email	  "jd@gmail.com"
    subject   "Help Request"
    description "How to install factories"
  end
end
