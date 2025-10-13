require 'rails_helper'

RSpec.describe "Api::V1::Students", type: :request do
  describe "POST /api/v1/students" do
    let(:valid_attributes) do
      {
        student: {
          first_name: "Maggie",
          last_name: "Simpson",
          email: "maggie@simpsons.com"
        }
      }
    end

    let(:invalid_attributes) do
      {
        student: {
          first_name: "",
          last_name: "",
          email: ""
        }
      }
    end

    context "with valid parameters" do
      it "creates a new Student and returns JSON with status 201" do
        post "/api/v1/students", params: valid_attributes

        expect(response).to have_http_status(:created)

        json = JSON.parse(response.body)
        expect(json["student"]["first_name"]).to eq("Maggie")
        expect(json["student"]["email"]).to eq("maggie@simpsons.com")
      end
    end

    context "with invalid parameters" do
      it "does not create a student and returns error messages" do
        post "/api/v1/students", params: invalid_attributes

        expect(response).to have_http_status(:unprocessable_entity)

        json = JSON.parse(response.body)
        expect(json["errors"]).to include("First name can't be blank")
      end
    end
  end
end
