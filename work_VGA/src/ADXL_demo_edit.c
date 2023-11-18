#if defined(D_NEXYS_A7)
   #include <bsp_printf.h>
   #include <bsp_mem_map.h>
   #include <bsp_version.h>
#else
   PRE_COMPILED_MSG("no platform was defined")
#endif
#define SPCR 0x80001104
#define SPSR 0x80001108
#define SPDR 0x80001110 //rfout
#define SPER 0x80001118
#define SS 0x80001120  //slave select
#define MASK_READ  0x1//Read FIFO Empty
#define MASK_WRITE 0x8 //Write FIFO Full
#define MASK_INT 0x80 //Interrupt flag 
//The Serial Peripheral Interrupt Flag is set upon completion of a transfer block
#define DIGIT_BASE    0x80120000
#define VGA_BASE        0x80180000
#define D_UART_LSR_RBRE_BIT  (0x01)
#define M_UART_RD_REG_LSR()  (*((volatile unsigned int*)(D_UART_BASE_ADDRESS + (4*0x05) ))) 
#define READ(dir) (*(volatile unsigned *)dir)
#define WRITE(dir, value) { (*(volatile unsigned *)dir) = (value); }
char uart_inbyte(void) 
{
	unsigned int RecievedByte;

    /* Check for space in UART FIFO */
    while((M_UART_RD_REG_LSR() & D_UART_LSR_RBRE_BIT) == 0);
	
	RecievedByte = READ(D_UART_BASE_ADDRESS);

	return (char)RecievedByte;
}
void delay() 
{
	volatile unsigned int j;
	for (j = 0; j < (5000000); j++) ;	// delay 
}
void write_ADXL(char addr,char value)
{
    WRITE(SS,0xFF); //CS down
    write_spi(0x0A);
    while((READ(SPSR)&MASK_INT)!= 0x80); //wait for interrupt
    write_spi(addr);
    while((READ(SPSR)&MASK_INT)!= 0x80); //wait for interrupt
    write_spi(value);
    while((READ(SPSR)&MASK_INT)!= 0x80); //wait for interrupt
    WRITE(SS,0x00); //CS up
}
unsigned char read_ADXL(char addr)
{
    WRITE(SS,0xFF); //CS down
    write_spi(0x0B);
    while((READ(SPSR)&MASK_INT)!= 0x80); //wait for interrupt
    write_spi(addr);
    while((READ(SPSR)&MASK_INT)!= 0x80); //wait for interrupt
    write_spi(0xFF);
    while((READ(SPSR)&MASK_INT)!= 0x80); //wait for interrupt
    unsigned char recv=READ(SPDR);
    WRITE(SS,0x00); //CS up
    return recv;
}
void print_digit(char c)
{
    unsigned int num=0;
    for(int i=0;i<8;i++)
    {
        num=num+((c%2)<<(4*i));
        c=c>>1;
    }
    WRITE(DIGIT_BASE,num);
}
void write_spi(unsigned char data)
{
    unsigned char recv;
    // internal clear interrupt flag
    recv = READ(SPSR);
    recv = recv | 0x80;
    WRITE(SPSR, recv);
    // send data
    WRITE(SPDR, data);
}

int main ( void )
{
    unsigned char xdata, ydata, zdata;
    int counter_value;
    int displayData = 0;
    WRITE(DIGIT_BASE,0x11111111);// digit work normally
    WRITE(DIGIT_BASE,0x0);// digit work normally
    uartInit();
    printfNexys("hello world\n");
    //init SPI core
    WRITE(SPCR,0b01010010); //SPI interrupts disabled SPI core enabled SPI以SPI模式0（CPOL=0、且CPHA=0）工作
    WRITE(SPER,0b00000000) //SPIF is set after every completed transfer    clock = 50MHz, divided by 16 ,3.125Mhz 推荐的SPI时钟频率范围为1-5MHz
    
    //init 
    // print_digit(read_spi(0x01)); //expect 0b00011101
    // print_digit(read_spi(0x02)); //expect 0b11110010
    // print_digit(read_spi(0x0B)); //read status register
    // write_spi(0x20,0xFA); //Write 250 decimal (0xFA) to Register 0x20
    // write_spi(0x21,0x0);//write 0 to Register 0x21: sets activity threshold to 250 mg
    // write_spi(0x23,0x96); //Write 150 decimal (0x96) to Register 0x23
    // write_spi(0x24,0x0); //write 0 toRegister 0x24: sets inactivity threshold to 150 mg.
    // write_spi(0x25,0x1E); //Write 30 decimal (0x1E) to Register 0x25: sets inactivity timer to 30 samples or about 5 seconds.
    // write_spi(0x27,0x3F); //Write 0x3F to Register 0x27: configures motion detection in loop mode and enables referenced activity and inactivity detec-tion.
    // write_spi(0x2B,0x40); //Write 0x40 to Register 0x2B: map the AWAKE bit to INT2. The INT2 pin is tied to the gate of the switch.
    // write_spi(0x2D,0x0A); //Write 0x0A to Register 0x2D: begins the measurement in wake-up mode.
    // while(1){
    //     xdata = read_ADXL(0x08);
    //     ydata = read_ADXL(0x09);
    //     zdata = read_ADXL(0x0A);
    //     printfNexys("Xdata = %d, Ydata = %d, Zdata = %d", xdata, ydata, zdata);
    //     displayData = xdata | (ydata << 8) | (zdata << 16);
    //     M_PSP_WRITE_REGISTER_32(DIGIT_BASE, displayData); 
    //     M_PSP_WRITE_REGISTER_32(VGA_BASE, displayData);
    //     delay();
    // }

    write_ADXL(0x2D,0b00000010); //Write 0b00000010 to Register 0x2D: begins the measurement in Measurement mode
   printfNexys("Begin to display X-axis, Y-axis, and Z-axis acceleration data");

   while(1){     
        // read X-axis MSB data
        xdata = read_ADXL(0x08);

        // read Y-axis MSB data
        ydata = read_ADXL(0x09);

        // read Z-axis MSB data
        zdata = read_ADXL(0x0A);

        printfNexys("X-axis = %d, Y-axis = %d, Z-axis = %d", xdata, ydata, zdata);

        displayData = xdata | (ydata << 8) | (zdata << 16);
        WRITE(DIGIT_BASE, displayData); 
        WRITE(VGA_BASE, displayData);    
        delay();
   }

}
