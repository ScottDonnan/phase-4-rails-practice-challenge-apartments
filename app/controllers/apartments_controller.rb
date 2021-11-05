class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all 
        render json: apartments, status: :ok
    end

    def create
        apartment = Apartment.create(number: params[:number])
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.update(number: params[:number])
            render json: apartment, status: :accepted
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end  
    end
end
