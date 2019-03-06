class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :verify_user_rights, only: [:show, :edit]

  def new
  	@profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @current_cart = current_user.carts.where("status = 0")[0]


    if @profile.save
       flash[:notice] = "Vous avez bien créé votre profil"
       redirect_to cart_path(@current_cart.id)
     else
      if @profile.errors.any?
        @profile.errors.full_messages.each do |message|
          flash[:error] =  "#{message}"
        end
      end
      redirect_to cart_path(@current_cart.id)
    end

  end

  def edit
  	@user = User.find(params[:id])
    @profile = Profile.find_by(user_id: @user.id)
  end

  def update
  	@user = User.find(params[:id])
    @profile = Profile.find_by(user_id: @user.id)
    @current_cart = @user.carts.where("status = 0")[0]
  	post_params = params[:profile]
    if @profile.update(first_name: post_params[:first_name], last_name: post_params[:last_name], street: post_params[:street], city: post_params[:city], zip_code: post_params[:zip_code], phone_number: post_params[:phone_number])
      flash[:notice] = "Vous avez bien créé votre profil"
      redirect_to cart_path(@current_cart.id)
    else
      if @profile.errors.any?
        @profile.errors.full_messages.each do |message|
          flash[:error] =  "#{message}"
        end
      end
      redirect_to cart_path(@current_cart.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
    @cart_all = Cart.all
    @cart = Cart.find_by(user_id: current_user.id, status: 1)
  end

  private

  def profile_params
  	params.permit(:first_name, :last_name, :street, :city, :zip_code, :phone_number)
  end

  def verify_user_rights
    @profile_page = Profile.find(params[:id])
    @profile_user = current_user.profile
    unless @profile_user.id == @profile_page.id
    flash[:error] = "Vous n'avez pas les droits"
    redirect_to root_path
    end
  end

end
