class Vampire
  @@coven = []
  @@outsite = []
  @@dead = []

  def self.create(name, age)
    vampire = Vampire.new(name, age)
    @@coven << vampire
  end

      def initialize(name, age)
        @name = name
        @age = age
        @in_coffin = true
        @drank_blood_today = true
      end

  def self.in
    @@coven
  end

  def self.out
    @@outsite
  end

  def self.dead
    @@dead
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today = false
      @@outsite << vampire
    end
    @@coven = []
  end

  def self.sunrise
    @@outsite.each do |vampire|
      numb = rand(2)
      if numb == 0
        vampire.drink_blood
        vampire.go_home
        @@coven << vampire
      elsif numb == 1
        @@dead << vampire
      end
    end
    @@outsite = []
  end

          def drink_blood
            @drank_blood_today = true
          end

          def go_home
            @in_coffin = true
          end

          attr :in_coffin, true
          attr :drank_blood_today, true

end

emilio = Vampire.create("Emilio", "150")
gustavo = Vampire.create("Gustavo", "300")

p Vampire.in
p Vampire.out
p Vampire.dead

puts "Sunset is here wake up"
Vampire.sunset
p Vampire.in
p Vampire.out
p Vampire.dead

Vampire.sunrise
p Vampire.in
p Vampire.out
p Vampire.dead
