class Genre 
  extend Concerns::Findable 
  attr_accessor :name
   @@all = [] 
   
   def initialize(name)
     @name = name 
     @songs =[]
     save
  end 
  
  def songs 
    @songs
  end
 
   def self.all 
    @@all 
   end 
 
def save 
  @@all << self 
end 

def self.destroy_all 
    @@all.clear 
end 
   
   def self.create(name)
      self.new(name)
  end
  
  def artists
  new = []
   Song.all.collect do |x|
    if x.genre == self 
     new << x.artist
    end
   end
  new.uniq
 end
end 