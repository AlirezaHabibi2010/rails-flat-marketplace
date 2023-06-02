class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = policy_scope(Flat)
    authorize @flats
    if params[:search].present?
      @flats = Flat.search_by_name_and_address(params[:search][:search]) if params[:search][:search]

      start_date = params[:search][:start_date].to_date
      end_date = params[:search][:end_date].to_date
      @flats = @flats.joins(:bookings).where.not("bookings.start_date < ? AND bookings.end_date > ? AND bookings.confirmed_by_owner = true",
                   start_date, end_date)
      # @flats = @flats.available(params[:search][:start_date].to_date, params[:search][:end_date].to_date)
    else
      @flats = Flat.all
    end


    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        name: flat.name,
        marker_html: render_to_string(partial: "marker", locals: {flat: flat})
      }
    end
  end

  def show
    authorize @flat
  end

  def list
    @flats = policy_scope(Flat, policy_scope_class: FlatPolicy::ScopeList)
    authorize @flats
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat

    if @flat.save
      redirect_to flat_path(@flat), notice: "Flat was successfully saved."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @flat
  end

  def update
    @flat.update(flat_params)
    authorize @flat

    if @flat.save
      redirect_to flat_path(@flat), notice: "Flat was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    authorize @flat
    redirect_to flats_path, status: :see_other, notice: "Flat was successfully destroyed."
  end

  def owner_requests_list # for renter
    @flats = policy_scope(Flat).where(user: current_user).order(:name)

    @declined = Array.new
    @accepted = Array.new
    @pending_requests = Array.new
    @flats.each do |flat|
      @declined_list = Array.new
      @accepted_list = Array.new
      @pending_requests_list = Array.new
      flat.bookings.where('start_date >= ?', Date.today).order(:start_date).each do |booking|
        if booking.declined
          @declined_list << booking
        elsif booking.confirmed_by_owner
          @accepted_list << booking
        else
          @pending_requests_list << booking
        end
      end
      @declined <<  [flat, @declined_list] if !@declined_list.empty?
      @accepted <<  [flat, @accepted_list] if !@accepted_list.empty?
      @pending_requests <<  [flat, @pending_requests_list] if !@pending_requests_list.empty?
    end
    authorize @flats
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price, photos: [])
  end
end
