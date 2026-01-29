// Freestanding C kernel
void kernel_main() {
    char* video = (char*)0xb8000;  // VGA memory
    const char* msg = "Arain";     // Message
    int i = 0;
    while(msg[i]) {
        video[i*2] = msg[i];       // Character
        video[i*2+1] = 0x07;       // White on black
        i++;
    }
}
