require 'rails_helper'

RSpec.describe 'Dashboard' , type: :request do   #The Outer describe, writing request specs end to end and "Dashboard" is a label for us to tell these tests are for the Dashboard feature
    before do
        @current_trimester = Trimester.create!(...)
        @upcoming_trimester = Trimester.create!(...)
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
end
