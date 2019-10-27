class Waiter
  attr_accessor :name, :experience
  @@all =[]
  
  def initialize(name, experience)
    @experience = experience
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select{|meal| meal.waiter == self}
  end
  
  def best_tipper
    tip_array = Customer.all.select{|customer| customer.waiters.include?(self)}
    tip_array = tip_array.collect{|customer| customer.meals}.flatten
    tip_array = tip_array.sort{|a,b| b.tip <=> a.tip}.first.customer
  end
  
end