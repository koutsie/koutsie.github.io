# Orange Pi / General SoC Notes



### Ilitek SPI display:
ili9486: Needs testing, XINIT errors out after init for err: "NO_DISPLAY" even thought we get *some* output.

------

#### GPIO Pinouts

```c
# ╔══════════════════════════════════════════════════════════════════════════════════════╗
# ║ 2x20 GPIO Header of the Xunlong Orange Pi One                                        ║
# ╠════╦══════════════════════════════════════╦════╦═════════════════════════════════════╣
# ║ 1  ║ 3.3V                                 ║  2 ║ 5V                                  ║
# ║ 3  ║ PA12 (TWI0_SDA/DI_RX/PA_EINT12)      ║  4 ║ 5V                                  ║
# ║ 5  ║ PA11 (TWI0_SCK/DI_TX/PA_EINT11)      ║  6 ║ GND                                 ║
# ║ 7  ║ PA6 (SIM_PWREN/PWM1/PA_EINT6)        ║  8 ║ PA13 (SPI1_CS/UART3_TX/PA_EINT13)   ║
# ║ 9  ║ GND                                  ║ 10 ║ PA14 (SPI1_CLK/UART3_RX/PA_EINT14)  ║
# ║ 11 ║ PA1 (UART2_RX/JTAG_CK/PA_EINT1)      ║ 12 ║ PD14                                ║
# ║ 13 ║ PA0 (UART2_TX/JTAG_MS/PA_EINT0)      ║ 14 ║ GND                                 ║
# ║ 15 ║ PA3 (UART2_CTS/JTAG_DI/PA_EINT3)     ║ 16 ║ PC4                                 ║
# ║ 17 ║ 3.3V                                 ║ 18 ║ PC7                                 ║
# ║ 19 ║ PC0 (SPI0_MOSI)                      ║ 20 ║ GND                                 ║
# ║ 21 ║ PC1 (SPI0_MISO)                      ║ 22 ║ PA2 (UART2_RTS/JTAG_DO/PA_EINT2)    ║
# ║ 23 ║ PC2 (SPI0_CLK)                       ║ 24 ║ PC3 (SPI0_CS)                       ║
# ║ 25 ║ GND                                  ║ 26 ║ PA21 (PCM0_DIN/SIM_VPPPP/PA_EINT21) ║
# ║ 27 ║ PA19 (PCM0_CLK/TWI1_SDA/PA_EINT19)   ║ 28 ║ PA18 (PCM0_SYNC/TWI1_SCK/PA_EINT18) ║
# ║ 29 ║ PA7 (SIM_CLK/PA_EINT7)               ║ 30 ║ GND                                 ║
# ║ 31 ║ PA8 (SIM_DATA/PA_EINT8)              ║ 32 ║ PG8 (UART1_RTS/PG_EINT8)            ║
# ║ 33 ║ PA9 (SIM_RST/PA_EINT9)               ║ 34 ║ GND                                 ║
# ║ 35 ║ PA10 (SIM_DET/PA_EINT10)             ║ 36 ║ PG9 (UART1_CTS/PG_EINT9)            ║
# ║ 37 ║ PA20 (PCM0_DOUT/SIM_VPPEN/PA_EINT20) ║ 38 ║ PG6 (UART1_TX/PG_EINT6)             ║
# ║ 39 ║ GND                                  ║ 40 ║ PG7 (UART1_RX/PG_EINT7)             ║
# ╚════╩══════════════════════════════════════╩════╩═════════════════════════════════════╝