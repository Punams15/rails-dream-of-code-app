require 'rails_helper'

RSpec.describe 'Dashboard' , type: :request do   #The Outer describe, writing request specs end to end and "Dashboard" is a label for us to tell these tests are for the Dashboard feature
     before do
      # Current trimester
      @current_trimester = Trimester.create!(
        term: 'Current term',
        year: Date.today.year.to_s,
        start_date: Date.today - 1.day,
        end_date: Date.today + 2.months,
        application_deadline: Date.today - 16.days
      )

      # Upcoming trimester (starts within 6 months)
      @upcoming_trimester = Trimester.create!(
        term: 'Upcoming term',
        year: Date.today.year.to_s,
        start_date: Date.today + 1.month,
        end_date: Date.today + 3.months,
        application_deadline: Date.today + 15.days
      )
    end
     it 'returns a 200 OK status' do
      get "/dashboard"                    #The inner describe 'GET /dashboard',is also just a label (so your test output is readable).Inside this block, every it is testing something about the /dashboard request.
      expect(response).to have_http_status(:ok)
    end

    it 'displays the current trimester' do
      get "/dashboard"
      expect(response.body).to include("#{@current_trimester.term} - #{@current_trimester.year}")
    end

    it 'displays the upcoming trimester' do
      get "/dashboard"
      expect(response.body).to include("#{@upcoming_trimester.term} - #{@upcoming_trimester.year}")
    end
  end





#year: Date.today.year.to_s

	#Date.today → gives you today’s date (for example, 2025-08-27).

	#.year → extracts the year number from that date (2025).

	#.to_s → converts the number into a string ("2025") because your Trimester model probably expects year as a string.

	#So this line sets the trimester’s year to "2025" (or the current year).

# start_date: Date.today - 1.day

	#Date.today → today’s date (2025-08-27).

	#- 1.day → subtracts 1 day from today.

	#So the start_date becomes yesterday (2025-08-26).

	#This means the trimester already started.

# end_date: Date.today + 2.months

	#Date.today + 2.months → adds 2 months to today’s date.

	#So if today is 2025-08-27, the end_date becomes 2025-10-27.

	#This sets the trimester to end in the future.

#application_deadline: Date.today - 16.days

	#Date.today - 16.days → subtracts 16 days from today.

	#So if today is 2025-08-27, the application_deadline becomes 2025-08-11.

	#This sets the date by which students needed to apply for this trimester.



#Since all your dashboard tests failed, possible reasons include:

#1.Controller/action doesn’t exist

	#Maybe AdminDashboardController#index is missing.

#2.Route is missing

	#Check config/routes.rb has: (with the following line)

	#get '/dashboard', to: 'admin_dashboard#index'


#3.View doesn’t render the expected text

	#For the current/upcoming trimester tests, Rails couldn’t find the text in your index.html.erb.

#4.Instance variables not set correctly

	#@current_trimester or @upcoming_trimester might be nil.

    #Next step

#I should:

#Check routes.rb → make sure /dashboard exists.

#Check admin_dashboard_controller.rb → make sure index action sets @current_trimester and @upcoming_trimester.

#Check index.html.erb → make sure it displays:

#<h3><%= "#{@current_trimester.term} - #{@current_trimester.year}" %></h3>
#<h3><%= "#{@upcoming_trimester.term} - #{@upcoming_trimester.year}" %></h3>



#1. get

#This is the HTTP method.

#get means: “I want to read or view something from the server.”

#Other HTTP methods:

#post → create something

#patch/put → update something

#delete → remove something

#So get is used when you visit a URL in your browser.

#2.  '/dashboard'

#This is the URL path people type in the browser:

#http://localhost:3000/dashboard


#When someone visits this path, Rails will know which controller and action to run.

#3. to: 'admin_dashboard#index'

#This tells Rails where to send the request.

#admin_dashboard → the controller name (file: app/controllers/admin_dashboard_controller.rb)

#index → the action (method) inside the controller to run

#So Rails will do:

#AdminDashboardController#index



#Final Steps:
#1.Check the route--Open config/routes.rb--get '/dashboard', to: 'admin_dashboard#index'
#2.Check the controller--Open app/controllers/admin_dashboard_controller.rb--instance variables 
#3.Check the view,Open app/views/admin_dashboard/index.html.erb and make sure it displays the trimesters
#4.Run the tests again--bundle exec rspec spec/requests/admin_dashboard_spec.rb

#Inside controller first create :bin/rails generate controller AdminDashboard
