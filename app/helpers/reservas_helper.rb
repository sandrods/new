module ReservasHelper
  def div_day(day)
    if day == Date.today
      cls = 'today'
    else
      cls = @cal.this_month?(day) ? 'day' : 'day1'
    end
    "<div class='#{cls}'>#{day.day}</div>"
  end
  
  def buttons_reserva(reserva)
    ret = []
    ret << delete_button(:salao, reserva) + image_tag('drg_salao.gif') + "&nbsp;" + reserva.user.login if reserva.salao
    ret << delete_button(:pizza, reserva) + image_tag('drg_pizza.gif') + "&nbsp;" + reserva.user.login if reserva.pizza
    ret << delete_button(:churras, reserva) + image_tag('drg_churras.gif') + "&nbsp;" + reserva.user.login if reserva.churras
    ret.join("<br/>\n")    
  end
  
  def delete_button(tipo, reserva)
    if reserva.user_id == current_user.id
      link_to_remote(image_tag('delete.gif'), 
                      :url=>{:action=>:destroy, :id=>reserva.id, :tipo=>tipo}, 
                      :confirm=>"Confirma exclusão desta Reserva ?") + "&nbsp;"
    else
      ''
    end
  end
  
  def nav_cal(cal)
    ret = ''
    ret << link_to(image_tag('arrow_left.gif', :style=>'vertical-align:middle;'), :action=>:index, :mes=>cal.last_month)
    ret << "&nbsp;&nbsp;"
    ret << cal.month
    ret << "&nbsp;&nbsp;"
    ret << link_to(image_tag('arrow_right.gif', :style=>'vertical-align:middle;'), :action=>:index, :mes=>cal.next_month)
  end
  
end
