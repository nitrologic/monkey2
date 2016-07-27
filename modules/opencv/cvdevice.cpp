#include "cvdevice.h"

int CVDevice::Version=17;
int CVDevice::CaptureCount=0;

CVDevice::CVDevice():captureDevice(0){
	isOpen=captureDevice.isOpened();
	if (isOpen){
		CaptureCount++;
	}
	if(isOpen){
		printf("capture device open\n");
	}else{
		printf("no default capture device\n");
	}
}
