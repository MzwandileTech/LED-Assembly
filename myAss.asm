    movlw 07h
    movwf 1fh
    bsf 03h,5 
    bsf 85h,5 ; Move to bank 1
    bsf 85h,3 ; set RA3 as input 
    bsf 86h,1 ; set RB1 as input 
    bcf 86h,7 ; set RB7 as output
    bcf 03h,5 ; Go to bank 0 

start
    btfss 05h,3 ; Testing RA3
    goto check_rb1
    
    btfss 06h,1 ; Testing RB1
    goto check_ra3
    
    goto buttons_open_or_closed ; Both buttons are open or closed
    
check_rb1
    btfsc 06h,1 ; Testing RB1
    goto led_on ; RB1 is pressed
    
    goto buttons_open_or_closed ; RA3 is pressed or both buttons are open
    
check_ra3
    btfsc 05h,3 ; Testing RA3
    goto led_on ; RA3 is pressed
    
    goto buttons_open_or_closed ; RB1 is pressed or both buttons are open

led_on
    bsf 86h,7 ; Turn on RB7
    goto start

buttons_open_or_closed
    bcf 86h,7 ; Turn off RB7
    goto start

END

