class AdminDashboardController < ApplicationController
    def index
    # Current trimester: started before today, ends today or later
    @current_trimester = Trimester.where("start_date <= ?", Date.today)
                                  .where("end_date >= ?", Date.today)
                                  .first

    # Upcoming trimester: starts within 6 months from today
    six_months_from_now = Date.today + 6.months
    @upcoming_trimester = Trimester.where("start_date > ?", Date.today)
                                   .where("start_date <= ?", six_months_from_now)
                                   .first
  end
end

