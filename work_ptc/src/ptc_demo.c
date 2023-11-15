#define SegEn_ADDR    0x80001038
#define SegDig_ADDR   0x8000103C
#define IO_LEDR     0x80100000
#define IO_SWs		0x80100008
#define IO_INOUT    0x8010000C
#define RPTC_CNTR     0x80001200
#define RPTC_HRC      0x80001204
#define RPTC_LRC      0x80001208
#define RPTC_CTRL     0x8000120c
#define DIGIT_BASE    0x80120000
#define PWM_BASE    0x80140000
#define READ_Reg(dir) (*(volatile unsigned *)dir)
#define WRITE_Reg(dir, value) { (*(volatile unsigned *)dir) = (value); }
void delay() 
{
	volatile unsigned int j;
	for (j = 0; j < (1000000); j++) ;	// delay 
}
int main ( void )
{
    int counter_value;
    WRITE_Reg(RPTC_LRC, 0x2FFFFFF);
   int j=1;
   int count=0xF;
   unsigned int value = 0;
   unsigned int num = 0;
   unsigned int period = 0;
   while(1){
        if(j == 1) {
		    count = count << 1;
		    if(count == 0xf000)
		        j = 0;
		} else {
				count = count >> 1;
		    if(count == 0x000f)
		        j = 1;
		}
        if(value > 0xf) value = 0;
        num = value * 0x11111111;
	    WRITE_Reg(DIGIT_BASE, num);
        value ++;
        WRITE_Reg(RPTC_CTRL, 0xC0);//reset RPTC_CNTR  & clear int
        WRITE_Reg(RPTC_CTRL, 0x21);//enable RPTC_CNTR  & int enable
        //delay( );
        while(1){
            counter_value = READ_Reg(RPTC_CTRL);
            counter_value = counter_value & 0x40;  //read int
            if(counter_value!=0){
                break;
            }
        }
   }
    return(0);
}
