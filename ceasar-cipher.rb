def caesar_cipher(string, number=1)
    newWord = String.new
    string.each_codepoint do |letter|
        if(letter.between?(65, 90))
            if number + letter > 90
                number -= 26
            elsif number + letter < 65
                number += 26
            end
            newWord += (letter + number).chr
        elsif(letter.between?(97, 122))
            if number + letter > 122
                number -= 26
            elsif number + letter < 97
                number += 26
            end
            newWord += (letter + number).chr
        else
            newWord += letter.chr
        end
    end
    newWord
end

