class BookingsController < ApplicationController
  before_action :set_flat, only: %i[new create show]
  before_action :set_booking, only: %i[edit update destroy accept confirmation]

  def index
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def list
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user

    authorize @booking
    if @booking.save
      redirect_to booking_confirmation_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      @booking.update(confirmed_by_owner: false)
      redirect_to flat_path(@booking.flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to flat_path(@booking.flat), status: :see_other
  end

  def requests_list # for renter
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def accept
    authorize @booking
    if @booking.update(confirmed_by_owner: true)
      redirect_to flats_owner_requests_list_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirmation
    authorize @booking
  end
  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
