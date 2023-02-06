class InterestsController < ApplicationController

    def index
        if current_user_admin? == false
            redirect_previous
            flash[:alert] = "Unauthorized user!"
        else
            @interests = Interest.all 
        end

    end

    def new
        @interest = Interest.new
    end

    def create
        @interest = Interest.new(interest_params)

        if @interest.save
            redirect_to interests_path, notice:  "Interest successfully created!"
        else  
            render :new, status: :unprocessable_entity, alert: "Interest not created! Check errors!"
        end
    end

    def show
        @interest = Interest.find(params[:id])
    end

    def edit
        @interest = Interest.find(params[:id])
    end

    def update
        @interest = Interest.find(params[:id])

        if @interest.update(interest_params)
            redirect_to @interest, notice:"#{@interest.name} updated!"
        else
            render :edit, status: :unprocessable_entity, alert: "#{@interest.name} not updated! Check errors!"
        end
        
    end

    def destroy
        @interest = Interest.find(params[:id])
        @interest.destroy
        redirect_to interests_path
    end

    private

    def interest_params
        params.require(:interest).permit(:name)
    end

end