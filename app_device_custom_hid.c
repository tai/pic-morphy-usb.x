/*******************************************************************************
Copyright 2016 Microchip Technology Inc. (www.microchip.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

To request to license the code under the MLA license (www.microchip.com/mla_license), 
please contact mla_licensing@microchip.com
*******************************************************************************/

/** INCLUDES *******************************************************/
#include "usb.h"
#include "usb_device_hid.h"

#include <string.h>

#include "system.h"

//Class specific descriptor - HID Keyboard
const struct{uint8_t report[HID_RPT01_SIZE];}hid_rpt01={{
//
// Copied from: usbhid-dump -m 0bfe:1003
//
0x06, 0xA0, 0xFF, // USAGE_PAGE (0xFFA0)
0x09, 0x01, // USAGE(1)
0xA1, 0x01, // COLLECTION
0x09, 0x02, // USAGE(2)
0xA1, 0x00, // COLLECTION

0x06,       // USAGE_PAGE
0xA1, 0xFF,

0x09, 0x03, // USAGE(3)
0x09, 0x04, // USAGE(4)
0x15, 0x80,
0x25, 0x7F,
0x35, 0x00, 0x45, 0xFF,
0x75, 0x08, // REPORT_SIZE
0x95, 0x08,
0x81, 0x02, // INPUT

0x09, 0x05, // USAGE(5)
0x09, 0x06, // USAGE(6)
0x15, 0x80, // LOGICAL_MIN
0x25, 0x7F,
0x35, 0x00, 0x45, 0xFF,
0x75, 0x08, // REPORT_SIZE
0x95, 0x08,
0x91, 0x08, // OUTPUT

0xC0, 0xC0

#if 0
    0x06, 0x00, 0xff, // USAGE_PAGE (0xFF00 = vendor defined)
    0x09, 0x01, // USAGE (vendor usage #1)
    0xa1, 0x01, // Collection(Application)
    0x15, 0x00, //   LOGICAL_MIN (0x00)
    0x26,       //   LOGICAL_MAX (0x00FF)
    0xFF, 0x00,
    0x75, 0x08, //   REPORT_SIZE (8bits)

    // OUT Message 0x01
    0x85, 0x01, //   REPORT ID(0x01)
    0x98, 0x01, //   REPORT COUNT (# of REPORT_SIZE fields)
    0x19, 0x01, //   USAGE_MIN
    0x19, 0x40, //   USAGE_MAX
    0x91, 0x02, //   OUTPUT (data, array, absolute)

    // IN Message 0x01
    0x85, 0x01, //   REPORT ID(0x01)
    0x98, 0x01, //   REPORT COUNT (# of REPORT_SIZE fields)
    0x19, 0x01, //   USAGE_MIN
    0x19, 0x40, //   USAGE_MAX
    0x81, 0x02, //   INPUT (data, array, absolute)

    0xc0        // END
#endif
}};

/** VARIABLES ******************************************************/
/* Some processors have a limited range of RAM addresses where the USB module
 * is able to access.  The following section is for those devices.  This section
 * assigns the buffers that need to be used by the USB module into those
 * specific areas.
 */
#if defined(FIXED_ADDRESS_MEMORY)
    #if defined(COMPILER_MPLAB_C18)
        #pragma udata HID_CUSTOM_OUT_DATA_BUFFER = HID_CUSTOM_OUT_DATA_BUFFER_ADDRESS
        unsigned char ReceivedDataBuffer[64];
        #pragma udata HID_CUSTOM_IN_DATA_BUFFER = HID_CUSTOM_IN_DATA_BUFFER_ADDRESS
        unsigned char ToSendDataBuffer[64];
        #pragma udata

    #elif defined(__XC8)
        unsigned char ReceivedDataBuffer[64] @ HID_CUSTOM_OUT_DATA_BUFFER_ADDRESS;
        unsigned char ToSendDataBuffer[64] @ HID_CUSTOM_IN_DATA_BUFFER_ADDRESS;
    #else
    #error "Unknown compiler"
    #endif
#else
    unsigned char ReceivedDataBuffer[64];
    unsigned char ToSendDataBuffer[64];
#endif

volatile USB_HANDLE USBOutHandle;    
volatile USB_HANDLE USBInHandle;

/** DEFINITIONS ****************************************************/
typedef enum
{
    COMMAND_WRITE_PORT0 = 0x01,
    COMMAND_WRITE_PORT1 = 0x02,
    COMMAND_READ_PORT0 = 0x03,
    COMMAND_READ_PORT1 = 0x04,
    COMMAND_TOGGLE_LED = 0x80,
    COMMAND_GET_BUTTON_STATUS = 0x81,
    COMMAND_READ_POTENTIOMETER = 0x37
} CUSTOM_HID_DEMO_COMMANDS;

/** FUNCTIONS ******************************************************/

/*********************************************************************
* Function: void APP_DeviceCustomHIDInitialize(void);
*
* Overview: Initializes the Custom HID demo code
*
* PreCondition: None
*
* Input: None
*
* Output: None
*
********************************************************************/
void APP_DeviceCustomHIDInitialize()
{
    //initialize the variable holding the handle for the last
    // transmission
    USBInHandle = 0;

    //enable the HID endpoint
    USBEnableEndpoint(CUSTOM_DEVICE_HID_EP, USB_IN_ENABLED|USB_OUT_ENABLED|USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);

    //Re-arm the OUT endpoint for the next packet
    USBOutHandle = (volatile USB_HANDLE)HIDRxPacket(CUSTOM_DEVICE_HID_EP,(uint8_t*)&ReceivedDataBuffer[0],8);
}

/*********************************************************************
* Function: void APP_DeviceCustomHIDTasks(void);
*
* Overview: Keeps the Custom HID demo running.
*
* PreCondition: The demo should have been initialized and started via
*   the APP_DeviceCustomHIDInitialize() and APP_DeviceCustomHIDStart() demos
*   respectively.
*
* Input: None
*
* Output: None
*
********************************************************************/
void APP_DeviceCustomHIDTasks()
{
    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if( USBGetDeviceState() < CONFIGURED_STATE )
    {
        return;
    }

    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if( USBIsDeviceSuspended()== true )
    {
        return;
    }

    // Check if we got request from HID.write()
    if(HIDRxHandleBusy(USBOutHandle) == false)
    {
        //We just received a packet of data from the USB host.
        //Check the first uint8_t of the packet to see what command the host
        //application software wants us to fulfill.
        switch(ReceivedDataBuffer[0])				//Look at the data the host sent, to see what kind of application specific command it sent.
        {
            case COMMAND_WRITE_PORT0:
                // write to RC0..7
                PORTC = ReceivedDataBuffer[1];
                break;
            case COMMAND_WRITE_PORT1:
                // write to RB4..7
                PORTB = ReceivedDataBuffer[1] << 4;
                break;
            case COMMAND_READ_PORT0:
                if (! HIDTxHandleBusy(USBInHandle)) {
                    // reset buffer in compatible manner
                    memcpy(ToSendDataBuffer, ReceivedDataBuffer, 8);
                    
                    // read from RC0..7
                    ToSendDataBuffer[1] = LATC;
                    USBInHandle = HIDTxPacket(CUSTOM_DEVICE_HID_EP, (uint8_t *)ToSendDataBuffer, 8);
                }
                break;
            case COMMAND_READ_PORT1:
                if (! HIDTxHandleBusy(USBInHandle)) {
                    // reset buffer in compatible manner
                    memcpy(ToSendDataBuffer, ReceivedDataBuffer, 8);

                    // read from RB4..7
                    ToSendDataBuffer[1] = 0xF0 | (LATB >> 4);
                    USBInHandle = HIDTxPacket(CUSTOM_DEVICE_HID_EP, (uint8_t *)ToSendDataBuffer, 8);
                }
                break;
        }
        //Re-arm the OUT endpoint, so we can receive the next OUT data packet 
        //that the host may try to send us.
        USBOutHandle = HIDRxPacket(CUSTOM_DEVICE_HID_EP, (uint8_t*)&ReceivedDataBuffer[0], 8);
    }

#if 0 /* FIXME */
    // Allow dummy read to avoid HID.read() hangup without prior HID.write().
    if (! HIDTxHandleBusy(USBInHandle)) {
        memset(ToSendDataBuffer, 0, 8);
        USBInHandle = HIDTxPacket(CUSTOM_DEVICE_HID_EP, (uint8_t *)ToSendDataBuffer, 8);
    }
#endif
}
