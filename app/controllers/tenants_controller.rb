class TenantsController < ApplicationController

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.update(tenant_params)
            render json: tenant, status: :accepted
        else
            render json: {error: "No tenant found"}, status: :not_found
        end
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.destroy
            head :no_content
        else
            render json: {error: "No tenant found"}, status: :not_found
        end
    end

    private
    
    def tenant_params
        params.permit(:name, :age)
    end

end
