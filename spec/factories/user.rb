# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  	factory :user, class: User do
    	password "user123456"
    	password_confirmation {|au| au.password}
  		name "user"
    	email "user@gmail.com"
  		admin false

	  	trait :admin do
	    	password "admin123456"
	    	password_confirmation {|au| au.password}
	    	name "admin"
	    	email "admin@gmail.com"
	    	admin true
	    end

	  	trait :invalid do
	  	end
	  	
	  	trait :admin_unique do
	  		password "adminunique123456"
	    	password_confirmation {|au| au.password}
	    	name "adminunique"
	    	email "adminunique@gmail.com"
	    	admin true
	  	end

	  	factory :admin_unique, traits: [:admin_unique]
	  	factory :admin, traits: [:admin]
	  	factory :user_invalid, traits: [:invalid]
  	end

end