def welcome
   puts "Welcome to Congress Find"
end

def help
   help = <<-INTRO
   You have the following options:
   1. Select State (will be prompted to enter a state )
     A. Summary of congressmen by party
     B. See your senators and representatives
     C. See who is up for reelection in 2018
   2. Find Congressman (will be prompted to enter a name)
     A. View details about a specific person
     B. Review the committee membership
   3.  Find a Committee (will be prompted for name or abbreviation)
     A. Enter a committee name to see the details and membership
   4. Help to see this list again
   5. Exit
   INTRO
   puts help
end

def action
# to come
end

def exit_program
  puts 'Goodbye'
end


def state_loop(state_in_use)
  puts <<-OUTPUT
     Please select one of the following actions by number:
     1. state summary
     2. list of all congressmen and women for the state
     3. list of who is up for election in 2018
     4. home - return to main menu
  OUTPUT
  input2 = ""
  while input2
    input2 = gets.chomp
    case input2
  when '1'
     state_in_use.party_summary
   when '2'
      state_in_use.get_congressmen
    when '3'
      state_in_use.up_for_next_election
    when '4'
      break
    else
      "Please enter a valid option"
      end
    end
  end


  def person_loop(person_in_use)
    puts <<-OUTPUT
       Please select one of the following actions by number:
       1. summary and contact information
       2. list of all committees the congressman/woman is on
       3. home - return to main menu
    OUTPUT
    input2 = ""
    while input2
      input2 = gets.chomp
      case input2
    when '1'
       person_in_use.basic_info
     when '2'
        person_in_use.find_committees
      when '3'
        break
      else
        "Please enter a valid option"
        end
      end
    end


      def committee_loop(committee_input)
        if committee_input.length < 5
           Committee.info_initials(committee_input)
        elsif Committee.info_name(committee_input)
          Committee.info_name(committee_input)
        else
    end
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
      state_input = gets.chomp
      state_in_use = State.get_by_initials(state_input)
      state_loop(state_in_use)
    when 'find congressman'
      puts "Please enter a congressman's name"
      person_input = gets.chomp
      person_in_use = Congressman.lookup(person_input)
      person_loop(person_in_use)
    when 'find committee'
      puts "Please enter a committee abbreviation, name, or 'list' (to see a full list of committees)"
      committee_input = gets.chomp
      if committee_input == "list"
        Committee.list
      else
      committee_loop(committee_input)
     end
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
