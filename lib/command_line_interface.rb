def welcome
   puts "Welcome to Congress Find"
end

def help
   help = <<-INTRO

   You have the following options (select by number):
   1. Select State (will be prompted to enter a state )
   2. Find Congressman (will be prompted to enter a name)
   3. Find a Committee (will be prompted for name or abbreviation)
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


def state_loop(state_input)
  state_in_use = State.get_by_initials(state_input)
  if state_in_use

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
        puts <<-OUTPUT

           Please select one of the following actions by number:
           1. state summary
           2. list of all congressmen and women for the state
           3. list of who is up for election in 2018
           4. home - return to main menu

        OUTPUT
        end
      end
    else
    state_list = State.all.map {|s| s.abbreviation}
    state_list.sort!
    state_list.each {|s| puts "#{s}"}
    puts "Please enter a valid state ID:"
    state_input = gets.chomp
    state_loop(state_input)
    end
  end


  def person_loop(person_input)
      person_in_use = Congressman.lookup(person_input)
      if person_in_use
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
            # puts "Please enter a valid option"
            puts <<-OUTPUT

               Please select one of the following actions by number:
               1. summary and contact information
               2. list of all committees the congressman/woman is on
               3. home - return to main menu

            OUTPUT
            end
          end
        else
          puts "Please enter a valid name for a congressman or 'exit':"
          person_input = gets.chomp
         if person_input == "exit"
          person_loop("Mitch McConnell")
        else
          person_loop(person_input)
        end
      end
    end


      def committee_loop(committee_input)
        if Committee.name_list.include?(committee_input) || Committee.abbreviation_list.include?(committee_input)
          if committee_input.length < 5
            Committee.info_initials(committee_input)
          else
            Committee.info_name(committee_input)
          end
       elsif committee_input == "list"
            Committee.list
            puts "Please enter valid committee name or abbreviation"
            committee_input = gets.chomp
            committee_loop(committee_input)
      else
        puts "Please enter valid committee name or abbreviation"
        committee_input = gets.chomp
        committee_loop(committee_input)
      end
    end

def run
  welcome
  input = ""
  while input
    help
    puts "Please enter a command:"
    input = gets.chomp
    case input
    when '1'
      puts "Please enter a state's initials (e.g. NJ)"
      state_input = gets.chomp
      state_loop(state_input)
    when '2'
      puts "Please enter a congressman's name"
      person_input = gets.chomp
      person_loop(person_input)
    when '3'
      puts "Please enter a committee abbreviation, name, or 'list' (to see a full list of committees)"
      committee_input = gets.chomp
      if committee_input == "list"
        Committee.list
      else
      committee_loop(committee_input)
     end
   when 'help' || '4'
    when 'exit' || '5'
      exit_program
      break
    else
    end
  end
end




# binding.pry
