require "rails_helper"

RSpec.describe "Trimesters", type: :request do
  let(:trimester) do
    Trimester.create!(
      term: "Fall",
      year: "2025",
      start_date: Date.new(2025, 9, 1),
      end_date: Date.new(2025, 12, 15),
      application_deadline: Date.new(2025, 8, 15)
    )
  end

  it "shows the edit form" do
    get edit_trimester_path(trimester)
    expect(response.body).to include("Application deadline")
  end

  it "updates with valid date" do
    put trimester_path(trimester), params: { trimester: { application_deadline: "2025-10-01" } }
    expect(trimester.reload.application_deadline).to eq(Date.parse("2025-10-01"))
  end

  it "fails with blank date" do
    put trimester_path(trimester), params: { trimester: { application_deadline: "" } }
    expect(response.status).to eq(422)
  end

  it "fails with invalid id" do
    put trimester_path(999), params: { trimester: { application_deadline: "2025-10-01" } }
    expect(response.status).to eq(404)
  end
end
