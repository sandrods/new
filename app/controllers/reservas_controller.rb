class ReservasController < ApplicationController
  
  def index
    get_cal(params[:mes])
  end
  
  def create
    @reserva = Reserva.find_by_data_and_user_id(params[:day], current_user.id)
    @reserva = Reserva.new(:data=> params[:day], :user_id=>current_user.id) unless @reserva
    @reserva.salao = true if params[:id]=='drag_salao'
    @reserva.pizza = true if params[:id]=='drag_pizza'
    @reserva.churras = true if params[:id]=='drag_churras'
    @ok = @reserva.save
    get_cal(@reserva.data)
  end

  def destroy
    @reserva = Reserva.find params[:id]
    @reserva.update_attribute(params[:tipo], false) if @reserva.respond_to?("#{params[:tipo]}=")
    @reserva.destroy if @reserva.empty?
    get_cal(@reserva.data)
  end

  private
  
  def get_cal(mes)
    @cal = Cal.new(mes)
    @reservas = Reserva.find(:all, :conditions=>{:data=>@cal.range}).group_by(&:data)
  end

end
