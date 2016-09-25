class BookinghistoriesController < ApplicationController


  def show
    @bookinghistory=Bookinghistory.where("user_id = ?",session[:current_user_id])
  end
  private

    def bookinghistory_params
      params.require(:bookinghistory).permit()
    end
end

