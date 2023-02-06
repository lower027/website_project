class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
  
    def show
      @user = User.find(params[:user_id])
      @profile = @user.profile
    end
  
    def new
      @user = current_user
      @profile = @user.profile || @user.build_profile
    end
  
    def create
      @user = current_user
      @profile = @user.profile || @user.build_profile
      @profile.assign_attributes(profile_params)
      if @profile.save
        redirect_to [@user, @profile], notice: "Let's set up your profile!"
      else
        render :new, status: :unprocessable_entity, notice: "Let's set up your profile!"
      end
    end
  
    def edit
      @user = current_user
      @profile = @user.profile
    end
  
    def update
      @user = current_user
      @profile = @user.profile
  
      if @profile.update(profile_params)
        redirect_to [@user, @profile], notice: "Profile updated!"
      else
        render :edit, status: :unprocessable_entity, alert: "Profile not updated! Check errors!"
      end
    end
  
  
  
  
    private
  
    def profile_params
      params.require(:profile).permit(:name, :mini_bio, :location, :avatar, :employment, :user_id, interest_ids: []).tap do |permitted_params|
        if permitted_params[:avatar].blank?
          permitted_params.delete(:avatar)
        end
      end
    end
    
  end