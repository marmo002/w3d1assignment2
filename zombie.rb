class Zombie
  @@horde = [] #collection of all zombies
  @@plague_level = 10 #Rate at which zombies are spawned
  @@max_speed = 5 #Max speed
  @@max_strength = 8 #Max strength
  @@default_speed = 1
  @@default_strength = 3

      def initialize(speed, strength)
        @speed = speed
        @strength = strength

        if @speed > @@max_speed
          @speed = @@default_speed
        end
        if @strength > @@max_strength
          @strength = @@default_strength
        end
      end

          def self.all
            @@horde
          end

          def self.new_day
            number = rand(1..3)
            if number == 1
              Zombie.spawn
            elsif number == 2
              Zombie.some_die_off
            elsif number == 3
              Zombie.increase_plague_level
            end
            p Zombie.all
            p @@plague_level
          end

          def self.spawn
            number = rand(1..@@plague_level)
            number.times do
              speed = rand(@@max_speed)
              strength = rand(@@max_strength)
              zombie = Zombie.new(speed, strength)
              @@horde << zombie
            end
          end

          def self.some_die_off
            number = rand(11)
            number.times do |n|
              @@horde.pop
            end
            number
          end

          def self.increase_plague_level
            number = rand(3)
            @@plague_level += number
          end

              def encounter
                if outrun_zombie?
                  "You've outrun the zombie. Well done!"
                elsif survive_attack
                  "You were stronger that the zombie, Well Done"
                else
                  zombie = Zombie.new(@@default_speed,  @@default_strength)
                  @@horde << zombie
                  "New zombie in town!"
                end
              end

              def outrun_zombie?
                my_speed = rand(@@max_speed)
                zombie_speed = @speed

                if my_speed > zombie_speed
                  return true
                else
                  return false
                end
              end

              def survive_attack
                my_strength = rand(@@max_strength)
                zombie_strength = @strength

                if my_strength > zombie_strength
                  return true
                else
                  return false
                end
              end

end
