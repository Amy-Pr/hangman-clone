module Hangman
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess

    def initialize
      @chances = 5
      @wrong_tries = 0
      @guess = ""
      @word = "ruby" #Dictionary.random
      
    end

    def play
      Graphics.clear_screen
      puts 'Guess this word: ' + Graphics.obfuscate_word(word, '')
      

      while true
        print "[#{chances - wrong_tries} chances left]: "

        char = gets.chomp
        Graphics.clear_screen

        def win
          placeholder = Graphics.obfuscate_word(word, guess)

          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            puts Graphics::ALIVE
            puts "\n\nWELL DONE!! YOU SURVIVED"
            exit
          end

          if wrong_tries == chances
            puts Graphics::DEAD
            puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
            exit
          else
            puts 'Try another: ' + placeholder
            
          end
        end 
       
        unless word.include? char
          if char.match?(/[A-Za-z]/)
            if (guess.include? char) 
              puts "It's still wrong"
              @wrong_tries = @wrong_tries + 0
            else
              puts "OH NOES! The word doesn't contain '#{char}'"
              guess << char
              @wrong_tries = @wrong_tries + 1
            end
          else
            puts "You must enter a letter" 
            @wrong_tries = @wrong_tries + 0
          end
         win
        end
        
        
        if word.include? char
          if guess.include? char
            puts "You already entered '#{char}'. Yes, it is still correct.. 🙄"
          else
            guess << char
            puts 'Whoop Whoop!! '
          end
          win
        end

        

      
      end
    end
  end
end



