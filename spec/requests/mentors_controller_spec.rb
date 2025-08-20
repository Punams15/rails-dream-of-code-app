require 'rails_helper'

RSpec.describe "Mentors", type: :request do

  # 1) Test the list of mentors (index route)
  describe "GET /mentors" do
    context "when there are mentors" do
      before do
        # create 2 sample mentors
        Mentor.create!(first_name: "First1", last_name: "Last1", email: "mentor1@gmail.com")
        Mentor.create!(first_name: "First2", last_name: "Last2", email: "mentor2@gmail.com")
      end

      it "shows the names of all mentors" do
        get '/mentors'  # send GET request to /mentors
        expect(response.body).to include('First1 Last1')
        expect(response.body).to include('First2 Last2')
        expect(response).to have_http_status(:ok) # HTTP 200 OK
      end
    end

    context "when there are no mentors" do
      it "shows an empty mentors page" do
        get '/mentors'
        expect(response.body).to include('Mentors') # page title should exist
        expect(response.body).not_to include('<li>') # no mentor list items
      end
    end
  end

  # 2) Test a single mentor page (show route)
  describe "GET /mentors/:id" do
    let(:mentor) { Mentor.create!(first_name: "Happy", last_name: "Joy", email: "happy@gmail.com") }

    it "shows that mentor's details" do
      get "/mentors/#{mentor.id}" # send GET request to /mentors/:id
      expect(response.body).to include('Happy Joy')
      expect(response.body).to include('happy@gmail.com')
      expect(response).to have_http_status(:ok)
    end
  end
end