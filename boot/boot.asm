[org 0x7c00]

; Print bootloader message
mov si, message
print:
    lodsb
    cmp al, 0
    je done
    mov ah, 0x0E
    int 0x10
    jmp print

done:
cli                 ; Disable interrupts
call kernel_entry   ; Jump to kernel
jmp $               ; Loop if kernel returns

message db "Arain OS booting Kernel...",0

kernel_entry:
    jmp 0x1000      ; Address where kernel will be loaded

times 510-($-$$) db 0
dw 0xAA55
