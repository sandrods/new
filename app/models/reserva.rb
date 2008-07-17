class Reserva < ActiveRecord::Base
  belongs_to :user
  
  def empty?
    !(self.salao || self.pizza || self.churras)
  end
  
  def validate
    # somente uma reserva por dia para cada local
    res = Reserva.find_all_by_data(self.data) - self.to_a
    res.each do |r|
      if (r.salao && self.salao) || (r.pizza && self.pizza) || (r.churras && self.churras)
        errors.add_to_base("Já existe reserva para este Local nesta data.")
      end
    end
    
    # somente reservas até 3 meses para frente
    if self.data > Date.today.advance(:months=>3) then
      errors.add_to_base("Não podem ser efetuadas reservas com antecedência superior a 90 dias.")
    end
    
  end
end
