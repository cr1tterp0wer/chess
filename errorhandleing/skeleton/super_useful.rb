require 'byebug'
# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts e
  end
end

# PHASE 3
class CoffeeError < StandardError
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  # debugger
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    if maybe_fruit == "coffee"
      raise CoffeeError
    else
      raise StandardError
    end
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts "Thanks for the Coffee"
    retry
  rescue StandardError =>e
    puts "Standard Error"
  end

end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      if yrs_known < 5
        raise "We're strangers"
      end
      raise "Need a name!" if name.length == 0
      raise "Need a pasttime!" if fav_pastime.length == 0
    end

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
