require "big"

module Credit

    while true
        begin
            puts "Card Number: "
            numbertext = gets
            if numbertext
                number_u128 = numbertext.chomp.to_big_i
                if number_u128 > 370000000000000 && number_u128 < 5999999999999999
                    break
                end
            end    
        rescue 
            puts "Try again"
        end
    end
    # puts "\33c\e[3J"
    
    #  get length_u128 of number
    length_u128 = (numbertext.size)
    # Get first two digits from the left by dividing by 10^length_u128-2
    card_id_u128 = (number_u128 // (10_u128 ** (length_u128 - 2_u128)))
    # check cardsum
    if (double_evens(number_u128, length_u128) + sum_odds(number_u128, length_u128)) % 10 == 0
        if length_u128 == 15 && (card_id_u128 == 34 || card_id_u128 == 37)
            puts("AMEX")
        elsif length_u128 == 16 && (card_id_u128 > 50 && card_id_u128 < 56)
            puts("MASTERCARD")
        elsif (length_u128 == 16 || length_u128 == 13) && (card_id_u128 > 39 && card_id_u128 < 50)
            puts("VISA")
        else
            puts("INVALID")
        end
    else
        puts("INVALID")
    end
end

# multiply every other digit by 2
def double_evens(number_u128, length_u128)
    # initialise variables
    doubled_u128 = 0
    checksum_u128 = 0
    i_u128 = 0
    # cycle through digits in long integer
    while i_u128 < length_u128
        # to remove 1st digit from the right divide by 10
        if i_u128 == 0
            number_u128 = (number_u128 // 10)
        end
        # get new 1st number from right by using modulo
        doubled_u128 = (number_u128 % 10) * 2
        # if digit doubled_u128 is two digits split and add them
        if doubled_u128 > 9
            checksum_u128 = checksum_u128 + doubled_u128 % 10 + (doubled_u128 // 10)
        else
            # if single digit just add
            checksum_u128 += doubled_u128
        end
        # move left two digits
        i_u128 = i_u128 + 1_u128
        
        number_u128 = (number_u128 // 100)
    end
    
    puts checksum_u128
    return checksum_u128
end
    
# add odd digits of card number together
def sum_odds(number_u128, length_u128)
    # initialise variables
    checksum_u128 = 0
    k_u128 = 0
    # cycle through digits in long integer
    while k_u128 < length_u128
        # add 1st digit fromm right by usinng modulo
        checksum_u128 = checksum_u128 + (number_u128 % 10)
        # move left two digits
        number_u128 = (number_u128 // 100)
        k_u128 = k_u128 + 1_u128
 
    end
    puts checksum_u128
    return checksum_u128
end
