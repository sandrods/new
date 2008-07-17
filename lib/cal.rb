class Cal
  attr_accessor :date, :weeks
  
  def initialize(data = nil)
    
    if data.is_a? String
      d = Date.parse(data) rescue nil
    else
      d = data
    end
    
    @date = d || Date.today
    @inicio = @date.beginning_of_month
    d = @inicio.beginning_of_week
    week = []
    @weeks = []
    while d <= @date.end_of_month do
      7.times do |i| 
        week << d.dup
        d += 1
      end
      @weeks << week.dup
      week = []
    end    
  end
  
  def this_month?(day)
    day.month == @date.month
  end
  
  def month
    @date.strftime('%m/%Y')
  end
  
  def last_month
    @date.last_month.strftime('%m/%Y')
  end

  def next_month
    @date.next_month.strftime('%m/%Y')
  end

  def range
    @date.beginning_of_month..@date.end_of_month
  end
  
  def combo
    (0..3).map { |m| Date.today.advance(:months=>m).strftime('%m/%Y') }
  end
  
end
