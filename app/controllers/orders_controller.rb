class OrdersController < ApplicationController

  before_action :authorize
  before_action :correct_user

    def new
        # @order = Order.new
        @order = current_user.orders.build
      end
    
      def create
        # @order = Order.new(order_params)
        @order = current_user.orders.build(order_params)
        @order.delivery = "Out For Delivery"
        
        
        if @order.save
          flash[:notice] = "Order created successfully!"
          redirect_to orders_home_path
        else
          # If user fails model validation - probably a bad password or duplicate email:
          flash.now.alert = "Oops, couldn't create order."
        #   redirect_to pages_secret_path
        end
      end

      def history
        @orders = Order.all
      end

      def correct_user
        @order = current_user.orders.find_by(id: params[:id])
      end

      def edit
        @order = Order.find(params[:id])
      end

      def update
        @order = Order.find(params[:id])
        @order.update(delivery: params[:order][:delivery])
        redirect_to admin_history_path
      end   

    private
    
      def order_params
        params.require(:order).permit(:first, :last, :value, :number, :address, :user_id, :commission)
      end

end
