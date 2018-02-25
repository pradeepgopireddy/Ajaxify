class CustomersController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    @customer = Customer.new
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

      if @customer.save
        render json: @customer.attributes.merge({state_name: @customer.state.name, city_name: @customer.city.name, customers_count: Customer.count})
        # format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        # format.json { render :show, status: :created, location: @customer }
      else
        render json: {errors: @customer.errors.full_messages}
        # format.html { render :new }
        # format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #/customers/check_email_present?email=
  def check_email_present
    @customer = Customer.find_by(email: params[:email])
    render json: @customer.nil? ? {'msg': 'email can be used'} : {'msg': 'email already taken'}
  end

  #/customers/check_mobile_present?mobile=
  def check_mobile_present
    @customer = Customer.find_by(mobile: params[:mobile])
    render json: @customer.nil? ? {'msg': 'mobile can be used'} : {'msg': ' mobile already taken'}
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:state_id, :city_id, :name, :email, :mobile)
    end
end
