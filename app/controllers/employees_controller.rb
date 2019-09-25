class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def create
        @employee = Employee.create(employee_parms)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee = Employee.update(employee_parms)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            render :edit
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
    end
    

    private

    def employee_params
        params.require(:employee).permit!
    end

end
