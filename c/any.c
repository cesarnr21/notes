/*
 * aht10_driver.c
 *
 * Created: 20/10/2021
 *  Author: Niuslar
 */ 


#include "aht10_driver.h"
#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include <time.h>

static float read_sensor(uint8_t temp_or_hum);

//Commands to trigger measurement
uint8_t trig_cmd[3] = {AHT10_TRIG_MEAS, AHT10_DAT1_CMD, AHT10_DAT2_CMD};
//Calibration commands
uint8_t calib_cmd[3] = {0xE1, 0x08, 0x00};

int fd;
int length;

void aht10_init() {
    //Open I2C Bus
    char *filename = (char*)"/dev/i2c-1";
    if ((fd = open(filename, O_RDWR)) < 0) {
        printf("Failed to open the i2c bus");
        return;
    }
    
    if (ioctl(fd, I2C_SLAVE, AHT10_ADDR) < 0) {
        printf("Failed to acquire bus access and/or talk to slave.\n");
        return;
    }
    
    //Calibrate
       length = 3;      //Number of bytes to write
       //write() returns the number of bytes written, if they don't match return error
    if (write(fd, calib_cmd, length) != length) {
        printf("Failed to write to the i2c bus.\n");
    }
    return;
}

float read_humidity() {
    return read_sensor(HUMIDITY);
}

float read_temperature() {
    return read_sensor(TEMPERATURE);
}

static float read_sensor(uint8_t temp_or_hum) {
    uint8_t rx_buf[6];

    //Send trigger command
    length = 3;
    if (write(fd, trig_cmd, length) != length) {
        printf("Failed to write to the i2c bus.\n");
    }

    //The sensor needs 75 ms before reading the data
    delay(75);

    //Read data
    length = 6;
    if (read(fd, rx_buf, length) != length) {
        printf("Failed to read from the i2c bus.\n");	
    }

    //check if the device is busy and try to read data again
    while(rx_buf[0] & (1 << 7)) {
        if (read(fd, rx_buf, length) != length) {
        printf("Failed to read from the i2c bus.\n");
        }
    }

    uint32_t humidity_reading = ((uint32_t)rx_buf[1] << 12) | ((uint16_t)rx_buf[2] << 4) | (rx_buf[3] >> 4) ;

    uint32_t temp_reading = (((uint32_t)rx_buf[3] & 0x0F) << 16) | ((uint16_t)rx_buf[4] << 8) | (rx_buf[5]) ;

    float humidity = (((float)humidity_reading) / (pow(2,20))) * 100;

    float temperature = ((((float)temp_reading) / (pow(2,20))) * 200) - 50;

    if(temp_or_hum == HUMIDITY) {
        return humidity;
    }
    else if(temp_or_hum == TEMPERATURE) {
        return temperature;
    }

    return 999.0f; //return unrealistic value 
}

void delay(long ms) {
    long pause;
    clock_t now, then;
    pause = ms*(CLOCKS_PER_SEC/1000);
    now = then = clock();
    while( (now-then) < pause) {
        now = clock();
    }
}
