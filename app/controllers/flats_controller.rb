class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = policy_scope(Flat)
    authorize @flats
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
    @flats = policy_scope(Flat).where(user: current_user)
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
