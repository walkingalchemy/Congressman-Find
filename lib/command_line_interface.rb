def welcome
   puts "Welcome to Congress Find"
end

def help
   help = <<-INTRO
   You have the following options:
   1. Enter a state to see your senators and representatives
   2. Enter a name to see details about a specific person
   3. Enter "name".committees to see the committee membership
   4. Enter a committee name to see the details and membership
   5. Enter "state".reelection to see the who is up for reelection in 2018
   6. Enter "commitee".subcommittees to see all of the the subcommittees
   7. Enter help to see this list again
   INTRO
   puts help
end

def action
# to come
end

def get_state_by_initials(state_initials)
  State.find_by(abbreviation: state_initials)
end

def exit_program
  puts 'Goodbye'
end

def run
  welcome
  input = ""
  while input
    puts "Please enter a command:"
    input = gets.chomp
    case input
    when 'action'
      puts "Action to come"
    when 'select state'
      puts "Please enter a state's initials (e.g. NJ)"
      state = get_state_by_initials(gets.chomp)
      puts state.abbreviation
      state.congressmen.each {|c| puts c.full_name}
    when 'help'
      help
    when 'exit'
      exit_program
      break
    else
      help
    end
  end
end

# binding.pry
